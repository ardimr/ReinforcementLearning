// Block Delay

module Delay(clk, din,dout);
  input clk;
  input [15:0] din;
  output reg [15:0] dout;

  //buffer register;
  reg [15:0] temp1,temp2;

  always@(posedge clk) begin
      temp1 <= din;
      dout  <= temp2;
  end
endmodule
