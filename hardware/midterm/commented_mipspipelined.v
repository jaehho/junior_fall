module testbench();

  reg         clk;
  reg         reset;

  wire [31:0] writedata, dataadr;
  wire memwrite;

  // instantiate device to be tested
  top dut(clk, reset, writedata, dataadr, memwrite);
  
  // initialize test
  initial
    begin
      reset <= 1; # 22; reset <= 0; // hold reset high for 22 time units
    end

  // generate clock to sequence tests
  always
    begin
      clk <= 1; # 5; clk <= 0; # 5; // clock with period of 10 time units
    end

  // check results
  always@(negedge clk)
    begin
      if(memwrite) begin
        if(dataadr === 84 & writedata === 7) begin
          $display("Simulation succeeded"); // 7 is written to address 84
          $stop;
        end else if (dataadr !== 80) begin
          $display("Simulation failed");
          $stop;
        end
      end
    end
endmodule

module top(input         clk, reset, 
           output [31:0] writedata, dataadr, 
           output        memwrite);

  wire [31:0] pc, instr, readdata;
  
  // instantiate processor and memories
  mips mips(clk, reset, pc, instr, memwrite, dataadr, writedata, readdata);
  imem imem(pc[7:2], instr); // instruction memory
  dmem dmem(clk, memwrite, dataadr, writedata, readdata); // data memory

endmodule

// Data memory module
module dmem(input         clk, we,
            input  [31:0] a, wd,
            output [31:0] rd);

  reg  [31:0] RAM[63:0]; // 64-word memory, each word is 32 bits

  assign rd = RAM[a[31:2]]; // word aligned read

  always @(posedge clk)
    if (we)
      RAM[a[31:2]] <= wd; // write data to memory on positive clock edge if write enable is high
endmodule

// Instruction memory module
module imem(input  [5:0]  a,
            output [31:0] rd);

  reg  [31:0] RAM[63:0]; // 64 instruction memory, each instruction is 32 bits

  initial
    begin
      $readmemh("memfile.dat",RAM); // initialize instructions from memfile.dat
    end

  assign rd = RAM[a]; // instruction aligned read
endmodule

// Pipelined MIPS processor
module mips(input         clk, reset,
            output [31:0] pcF,
            input  [31:0] instrF,
            output        memwriteM,
            output [31:0] aluoutM, writedataM,
            input  [31:0] readdataM);

  wire [5:0]  opD, functD;
  wire        regdstE, alusrcE, 
              pcsrcD,
              memtoregE, memtoregM, memtoregW, regwriteE, regwriteM, regwriteW;
  wire [2:0]  alucontrolE;
  wire        flushE, equalD;

  // instantiate control unit and datapath
  controller c(clk, reset, opD, functD, flushE, equalD,
               memtoregE, memtoregM, memtoregW, memwriteM, pcsrcD, branchD,
               alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD,
               alucontrolE);
  datapath dp(clk, reset, memtoregE, memtoregM, memtoregW, pcsrcD, branchD,
              alusrcE, regdstE, regwriteE, regwriteM, regwriteW, jumpD,
              alucontrolE,
              equalD, pcF, instrF,
              aluoutM, writedataM, readdataM,
              opD, functD, flushE);
endmodule

// Control unit for MIPS processor
module controller(input        clk, reset,
                  input  [5:0] opD, functD,
                  input        flushE, equalD,
                  output       memtoregE, memtoregM, memtoregW, memwriteM,
                  output       pcsrcD, branchD, alusrcE,
                  output       regdstE, regwriteE, regwriteM, regwriteW,
                  output       jumpD,
                  output [2:0] alucontrolE);

  wire [1:0] aluopD;

  wire       memtoregD, memwriteD, alusrcD,
             regdstD, regwriteD;
  wire [2:0] alucontrolD;
  wire       memwriteE;

  // Main decoder and ALU decoder
  maindec md(opD, memtoregD, memwriteD, branchD,
             alusrcD, regdstD, regwriteD, jumpD,
             aluopD);
  aludec  ad(functD, aluopD, alucontrolD);

  assign pcsrcD = branchD & equalD; // determine if PC should be updated for branch

  // pipeline registers
  floprc #(8) regE(clk, reset, flushE,
                  {memtoregD, memwriteD, alusrcD, regdstD, regwriteD, alucontrolD}, 
                  {memtoregE, memwriteE, alusrcE, regdstE, regwriteE,  alucontrolE});
  flopr #(3) regM(clk, reset, 
                  {memtoregE, memwriteE, regwriteE},
                  {memtoregM, memwriteM, regwriteM});
  flopr #(2) regW(clk, reset, 
                  {memtoregM, regwriteM},
                  {memtoregW, regwriteW});
endmodule

// Main decoder for instruction type
module maindec(input  [5:0] op,
               output       memtoreg, memwrite,
               output       branch, alusrc,
               output       regdst, regwrite,
               output       jump,
               output [1:0] aluop);

  reg [9:0] controls;

  assign {regwrite, regdst, alusrc,
          branch, memwrite,
          memtoreg, jump, aluop} = controls;

  always @(*)
    case(op)
      6'b000000: controls <= 9'b110000010; // R-type instruction
      6'b100011: controls <= 9'b101001000; // Load Word (LW)
      6'b101011: controls <= 9'b001010000; // Store Word (SW)
      6'b000100: controls <= 9'b000100001; // Branch if Equal (BEQ)
      6'b001000: controls <= 9'b101000000; // Add Immediate (ADDI)
      6'b000010: controls <= 9'b000000100; // Jump (J)
      default:   controls <= 9'bxxxxxxxxx; // Undefined
    endcase
endmodule

// ALU decoder for determining operation
module aludec(input      [5:0] funct,
              input      [1:0] aluop,
              output reg [2:0] alucontrol);

  always @(*)
    case(aluop)
      2'b00: alucontrol <= 3'b010;  // add
      2'b01: alucontrol <= 3'b110;  // subtract
      default: case(funct)          // R-type instruction
          6'b100000: alucontrol <= 3'b010; // ADD
          6'b100010: alucontrol <= 3'b110; // SUB
          6'b100100: alucontrol <= 3'b000; // AND
          6'b100101: alucontrol <= 3'b001; // OR
          6'b101010: alucontrol <= 3'b111; // SLT (set on less than)
          default:   alucontrol <= 3'bxxx; // Undefined
        endcase
    endcase
endmodule

// Datapath for MIPS processor
module datapath(input         clk, reset,
                input         memtoregE, memtoregM, memtoregW, 
                input         pcsrcD, branchD,
                input         alusrcE, regdstE,
                input         regwriteE, regwriteM, regwriteW, 
                input         jumpD,
                input  [2:0]  alucontrolE,
                output        equalD,
                output [31:0] pcF,
                input  [31:0] instrF,
                output [31:0] aluoutM, writedataM,
                input  [31:0] readdataM,
                output [5:0]  opD, functD,
                output        flushE);

  wire        forwardaD, forwardbD;
  wire [1:0]  forwardaE, forwardbE;
  wire        stallF;
  wire [4:0]  rsD, rtD, rdD, rsE, rtE, rdE;
  wire [4:0]  writeregE, writeregM, writeregW;
  wire        flushD;
  wire [31:0] pcnextFD, pcnextbrFD, pcplus4F, pcbranchD;
  wire [31:0] signimmD, signimmE, signimmshD;
  wire [31:0] srcaD, srca2D, srcaE, srca2E;
  wire [31:0] srcbD, srcb2D, srcbE, srcb2E, srcb3E;
  wire [31:0] pcplus4D, instrD;
  wire [31:0] aluoutE, aluoutW;
  wire [31:0] readdataW, resultW;

  // hazard detection
  hazard    h(rsD, rtD, rsE, rtE, writeregE, writeregM, writeregW, 
              regwriteE, regwriteM, regwriteW, 
              memtoregE, memtoregM, branchD,
              forwardaD, forwardbD, forwardaE, forwardbE,
              stallF, stallD, flushE);

  // next PC logic (operates in fetch and decode)
  mux2 #(32)  pcbrmux(pcplus4F, pcbranchD, pcsrcD, pcnextbrFD); // select between sequential PC and branch target
  mux2 #(32)  pcmux(pcnextbrFD,{pcplus4D[31:28], instrD[25:0], 2'b00}, 
                    jumpD, pcnextFD); // select between branch and jump target

  // register file (operates in decode and writeback)
  regfile     rf(clk, regwriteW, rsD, rtD, writeregW,
                 resultW, srcaD, srcbD); // register file with two read ports and one write port

  // Fetch stage logic
  flopenr #(32) pcreg(clk, reset, ~stallF, pcnextFD, pcF); // program counter register
  adder       pcadd1(pcF, 32'b100, pcplus4F); // PC + 4 for next instruction

  // Decode stage 
  flopenr #(32) r1D(clk, reset, ~stallD, pcplus4F, pcplus4D); // latch PC + 4
  flopenrc #(32) r2D(clk, reset, ~stallD, flushD, instrF, instrD); // latch instruction
  signext     se(instrD[15:0], signimmD); // sign-extend immediate value
  sl2         immsh(signimmD, signimmshD); // shift left immediate by 2
  adder       pcadd2(pcplus4D, signimmshD, pcbranchD); // calculate branch target address
  mux2 #(32)  forwardadmux(srcaD, aluoutM, forwardaD, srca2D); // forward ALU result if needed
  mux2 #(32)  forwardbdmux(srcbD, aluoutM, forwardbD, srcb2D); // forward ALU result if needed
  eqcmp       comp(srca2D, srcb2D, equalD); // compare register values for branch

  assign opD = instrD[31:26]; // opcode field
  assign functD = instrD[5:0]; // function field
  assign rsD = instrD[25:21]; // source register 1
  assign rtD = instrD[20:16]; // source register 2
  assign rdD = instrD[15:11]; // destination register

  assign flushD = pcsrcD | jumpD; // flush decode stage if branch or jump taken

  // Execute stage 
  floprc #(32) r1E(clk, reset, flushE, srcaD, srcaE); // latch source register 1 value
  floprc #(32) r2E(clk, reset, flushE, srcbD, srcbE); // latch source register 2 value
  floprc #(32) r3E(clk, reset, flushE, signimmD, signimmE); // latch sign-extended immediate
  floprc #(5)  r4E(clk, reset, flushE, rsD, rsE); // latch rs
  floprc #(5)  r5E(clk, reset, flushE, rtD, rtE); // latch rt
  floprc #(5)  r6E(clk, reset, flushE, rdD, rdE); // latch rd
  mux3 #(32)  forwardaemux(srcaE, resultW, aluoutM, forwardaE, srca2E); // forward result if needed
  mux3 #(32)  forwardbemux(srcbE, resultW, aluoutM, forwardbE, srcb2E); // forward result if needed
  mux2 #(32)  srcbmux(srcb2E, signimmE, alusrcE, srcb3E); // select between register and immediate for ALU
  alu         alu(srca2E, srcb3E, alucontrolE, aluoutE); // perform ALU operation
  mux2 #(5)   wrmux(rtE, rdE, regdstE, writeregE); // select destination register

  // Memory stage
  flopr #(32) r1M(clk, reset, srcb2E, writedataM); // latch value to be written to memory
  flopr #(32) r2M(clk, reset, aluoutE, aluoutM); // latch ALU output
  flopr #(5)  r3M(clk, reset, writeregE, writeregM); // latch write register

  // Writeback stage
  flopr #(32) r1W(clk, reset, aluoutM, aluoutW); // latch ALU output for writeback
  flopr #(32) r2W(clk, reset, readdataM, readdataW); // latch memory data for writeback
  flopr #(5)  r3W(clk, reset, writeregM, writeregW); // latch write register
  mux2 #(32)  resmux(aluoutW, readdataW, memtoregW, resultW); // select value to write back to register

endmodule

// Hazard detection unit
module hazard(input  [4:0] rsD, rtD, rsE, rtE, 
              input  [4:0] writeregE, writeregM, writeregW,
              input        regwriteE, regwriteM, regwriteW,
              input        memtoregE, memtoregM, branchD,
              output           forwardaD, forwardbD,
              output reg [1:0] forwardaE, forwardbE,
              output       stallF, stallD, flushE);

  wire lwstallD, branchstallD;

  // forwarding sources to D stage (branch equality)
  assign forwardaD = (rsD !=0 & rsD == writeregM & regwriteM); // forward from memory stage if needed
  assign forwardbD = (rtD !=0 & rtD == writeregM & regwriteM); // forward from memory stage if needed

  // forwarding sources to E stage (ALU)
  always @(*)
    begin
      forwardaE = 2'b00; forwardbE = 2'b00;
      if (rsE != 0)
        if (rsE == writeregM & regwriteM) forwardaE = 2'b10; // forward from memory stage
        else if (rsE == writeregW & regwriteW) forwardaE = 2'b01; // forward from writeback stage
      if (rtE != 0)
        if (rtE == writeregM & regwriteM) forwardbE = 2'b10; // forward from memory stage
        else if (rtE == writeregW & regwriteW) forwardbE = 2'b01; // forward from writeback stage
    end

  // stalls  
  assign #1 lwstallD = memtoregE & (rtE == rsD | rtE == rtD); // stall if load-use hazard detected
  assign #1 branchstallD = branchD & 
             (regwriteE & (writeregE == rsD | writeregE == rtD) |
              memtoregM & (writeregM == rsD | writeregM == rtD)); // stall if branch hazard detected

  assign #1 stallD = lwstallD | branchstallD; // stall decode stage if needed
  assign #1 stallF = stallD; // stalling D stalls all previous stages
  assign #1 flushE = stallD; // stalling D flushes next stage

  // *** not necessary to stall D stage on store if source comes from load;
  // *** instead, another bypass network could be added from W to M
endmodule

// ALU module
module alu(input      [31:0] a, b, 
           input      [2:0]  alucont, 
           output reg [31:0] result);

  wire [31:0] b2, sum, slt;

  assign #1 b2 = alucont[2] ? ~b:b;  // determine if subtraction (invert b)
  assign #1 sum = a + b2 + alucont[2]; // add a and b (or subtract if b is inverted)
  assign #1 slt = sum[31]; // set on less than (for signed comparison)

  always@(*)
    case(alucont[1:0])
      2'b00: result <= #1 a & b; // AND operation
      2'b01: result <= #1 a | b; // OR operation
      2'b10: result <= #1 sum;   // ADD/SUB operation
      2'b11: result <= #1 slt;   // Set on less than
    endcase
endmodule

// Register file module
module regfile(input         clk, 
               input         we3, 
               input  [4:0]  ra1, ra2, wa3, 
               input  [31:0] wd3, 
               output [31:0] rd1, rd2);

  reg [31:0] rf[31:0]; // 32-register file, each 32 bits wide

  // three ported register file
  // read two ports combinationally
  // write third port on falling edge of clock
  // register 0 hardwired to 0

  always @(negedge clk)
    if (we3) rf[wa3] <= wd3; // write to register on falling clock edge if write enable is high

  assign #1 rd1 = (ra1 != 0) ? rf[ra1] : 0; // read register 1, register 0 is always 0
  assign #1 rd2 = (ra2 != 0) ? rf[ra2] : 0; // read register 2, register 0 is always 0
endmodule

// Adder module
module adder(input  [31:0] a, b,
             output [31:0] y);

  assign #1 y = a + b; // add two 32-bit values
endmodule

// Equality comparator module
module eqcmp(input [31:0] a, b,
             output        eq);

  assign #1 eq = (a == b); // check if two 32-bit values are equal
endmodule

// Shift left by 2 module
module sl2(input  [31:0] a,
           output [31:0] y);

  // shift left by 2
  assign #1 y = {a[29:0], 2'b00};
endmodule

// Sign extension module
module signext(input  [15:0] a,
               output [31:0] y);
              
  assign #1 y = {{16{a[15]}}, a}; // sign-extend 16-bit value to 32 bits
endmodule

// Flip-flop with reset module
module flopr #(parameter WIDTH = 8)
              (input                  clk, reset,
               input      [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset) q <= #1 0; // reset output to 0
    else       q <= #1 d; // otherwise latch input
endmodule

// Flip-flop with reset and clear module
module floprc #(parameter WIDTH = 8)
              (input                  clk, reset, clear,
               input      [WIDTH-1:0] d, 
               output reg [WIDTH-1:0] q);

  always @(posedge clk, posedge reset)
    if (reset)      q <= #1 0; // reset output to 0
    else if (clear) q <= #1 0; // clear output to 0
    else            q <= #1 d; // otherwise latch input
endmodule

// Flip-flop with enable and reset module
module flopenr #(parameter WIDTH = 8)
                (input                  clk, reset,
                 input                  en,
                 input      [WIDTH-1:0] d, 
                 output reg [WIDTH-1:0] q);
 
  always @(posedge clk, posedge reset)
    if      (reset) q <= #1 0; // reset output to 0
    else if (en)    q <= #1 d; // latch input if enable is high
endmodule

// Flip-flop with enable, reset, and clear module
module flopenrc #(parameter WIDTH = 8)
                 (input                  clk, reset,
                  input                  en, clear,
                  input      [WIDTH-1:0] d, 
                  output reg [WIDTH-1:0] q);
 
  always @(posedge clk, posedge reset)
    if      (reset) q <= #1 0; // reset output to 0
    else if (clear) q <= #1 0; // clear output to 0
    else if (en)    q <= #1 d; // latch input if enable is high
endmodule

// 2-to-1 multiplexer module
module mux2 #(parameter WIDTH = 8)
             (input  [WIDTH-1:0] d0, d1, 
              input              s, 
              output [WIDTH-1:0] y);

  assign #1 y = s ? d1 : d0;  // select between d0 and d1 based on s
endmodule

// 3-to-1 multiplexer module
module mux3 #(parameter WIDTH = 8)
             (input  [WIDTH-1:0] d0, d1, d2,
              input  [1:0]       s, 
              output [WIDTH-1:0] y);

  assign #1 y = s[1] ? d2 : (s[0] ? d1 : d0);  // select between d0, d1, and d2 based on s
endmodule