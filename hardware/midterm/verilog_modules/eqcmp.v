module eqcmp(input [31:0] a, b,
             output        eq);

  assign #1 eq = (a == b);
endmodule