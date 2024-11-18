`timescale 1 ns / 1 ps
module adder(input  [31:0] a, b,
             output [31:0] y);

  assign #1 y = a + b;
endmodule