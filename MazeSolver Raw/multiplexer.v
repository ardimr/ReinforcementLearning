//multiplexer 16 to 1

module Mux16to1(sel, d0, d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15, dout);
  input[3:0] sel;
  input[15:0] d0, d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15; 

  output reg [15:0] dout;

  always@(*) begin
    case (sel)
      4'd1 : dout = d1;
      4'd2 : dout = d2;
      4'd3 : dout = d3;
      4'd4 : dout = d4;
      4'd5 : dout = d5;
      4'd6 : dout = d6;
      4'd7 : dout = d7;
      4'd8 : dout = d8;
      4'd9 : dout = d9;
      4'd10 : dout = d10;
      4'd11 : dout = d11;
      4'd12 : dout = d12;
      4'd13 : dout = d13;
      4'd14 : dout = d14;
      4'd15 : dout = d15;
      default : dout = d0;
    endcase
  end
     
endmodule

