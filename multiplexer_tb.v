//Testbench Max Blcok 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module Mux16to1_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     
     reg[3:0] sel;
     reg[15:0] d0, d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15;

     wire[15:0] dout;
     //port mapping
     Mux16to1 DUT( .sel(sel),
                 .d1(d1),
                 .d2(d2),
                 .d3(d3),
                 .d4(d4),
                 .d5(d5),
                 .d6(d6),
                 .d7(d7),
                 .d8(d8),
                 .d9(d9),
                 .d10(d10),
                 .d11(d11),
                 .d12(d12),
                 .d13(d13),
                 .d14(d14),
                 .d15(d15),
                 .dout(dout)
                 );

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end

    //test case
    initial begin
      #10;
      d0 = 4'd0;
      d1 = 4'd1;
      d2 = 4'd2;
      d3 = 4'd3;
      d4 = 4'd4;
      d5 = 4'd5;
      d6 = 4'd6;
      d7 = 4'd7;
      d8 = 4'd8;
      d9 = 4'd9;
      d10 = 4'd10;
      d11 = 4'd11;
      d12 = 4'd12;
      d13 = 4'd13;
      d14 = 4'd14;
      d15 = 4'd15;

      sel = 4'd0;

      #20;
      sel = 4'd1;
      #20;
      sel = 4'd2;
      #20;
      sel = 4'd3;
      #20;
      sel = 4'd4;
      #20;
      sel = 4'd5;
      #20;
      sel = 4'd6;
      #20;
      sel = 4'd7;
      #20;
      sel = 4'd8;
    
    end

    //display monitor
    initial begin
     $monitor("time = %2d\n dout = %2d", 
           $time , dout );
    end
    
endmodule