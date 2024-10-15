`timescale 1 ns / 1 ps
module eqcmp(input [31:0] a, b,
             output        eq);

  assign #1 eq = (a == b);
endmodule