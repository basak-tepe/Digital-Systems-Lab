`timescale 1ns / 1ns

module encoder(y, x);

  output reg [2:0] y;
  input wire [6:0] x;

  always @(x) begin
    y = x[6] + x[5] + x[4] + x[3] + x[2] + x[1] + x[0];
  end
  
endmodule


module mux(z, y, s);

  output reg z;
  input wire [2:0] y;
  input wire [1:0] s;

  always @(y,s) begin
    case(y[0] + y[1] + y[2])
      2'b00: z = (s == 2'b00) ? 1 : 0;
      2'b01: z = (s == 2'b01) ? 1 : 0;
      2'b10: z = (s == 2'b10) ? 1 : 0;
      2'b11: z = (s == 2'b11) ? 1 : 0;
    endcase
  end
  
endmodule


