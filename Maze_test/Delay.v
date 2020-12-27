// Block Delay

module DelayActionRAM(clk, din,dout);
  input clk;
  input [15:0] din;
  output reg [15:0] dout = 16'd0;

  //buffer register;
  reg [15:0] temp1,temp2,temp3;

  always@(posedge clk) begin
      dout <= din;
  end
endmodule

module DelayReward(clk,din,dout);
  input clk;
  input [15:0] din;
  output reg [15:0] dout = 16'd0;
  //buffer register;
  reg [15:0] temp1,temp2;

  always@(posedge clk) begin
      //temp1 <= din;
      dout  <= din;
  end
endmodule

module DelayState(clk,din,dout);
  input clk;
  input [5:0] din;
  output reg [5:0] dout = 5'd0;
  //buffer register;
  reg [5:0] temp1,temp2;

  always@(posedge clk) begin
     dout  <= din;
  end
endmodule
