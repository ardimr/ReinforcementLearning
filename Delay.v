// Block Delay

module Delay(clk, din,dout);
  input clk;
  input [15:0] din;
  output reg [15:0] dout;

  //buffer register;
  reg [15:0] temp1,temp2,temp3;

  always@(posedge clk) begin
      temp1 <= din;
      dout <= temp1;
  end
endmodule

module Delay_action(clk,din,dout);
  input clk;
  input [3:0] din;
  output reg [3:0] dout;
  //buffer register;
  reg [3:0] temp1,temp2;

  always@(posedge clk) begin
      temp1 <= din;
      dout  <= temp1;
  end
endmodule

module Delay_state(clk,din,dout);
  input clk;
  input [5:0] din;
  output reg [3:0] dout;
  //buffer register;
  reg [5:0] temp1,temp2;

  always@(posedge clk) begin
      temp1 <= din;
      dout  <= temp1;
  end
endmodule