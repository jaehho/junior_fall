`timescale 1 ns / 1 ps
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