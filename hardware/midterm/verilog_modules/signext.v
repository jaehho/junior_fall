`timescale 1 ns / 1 ps
module signext(input  [15:0] a,
               output [31:0] y);
              
  assign #1 y = {{16{a[15]}}, a};
endmodule