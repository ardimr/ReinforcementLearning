//Testbench Action RAM 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module Delay_tb();
  reg clk = 0;
  reg [15:0] din;
  wire [15:0] dout;

  DelayActionRAM DUT(.clk(clk),
            .din(din),
            .dout(dout));
  //clock generator
  always begin
  #10 clk = ~clk; //Clock dengan periode 20 time unit
  end

  initial begin
      #10;
      din = 16'd10;
      #20;
      din = 15'd20;
  end
endmodule

