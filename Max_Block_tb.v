//Testbench Max Blcok 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module max_block_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     
     reg[15:0] Q_Act1;
     reg[15:0] Q_Act2;
     reg[15:0] Q_Act3;
     reg[15:0] Q_Act4;
     reg[15:0] Q_Act5;
     reg[15:0] Q_Act6;
     reg[15:0] Q_Act7;
     reg[15:0] Q_Act8;
     reg[15:0] Q_Act9;
     reg[15:0] Q_Act10;
     reg[15:0] Q_Act11;
     reg[15:0] Q_Act12;
     reg[15:0] Q_Act13;
     reg[15:0] Q_Act14;
     reg[15:0] Q_Act15;

     wire[15:0] Q_max;
     //port mapping
    Max_Block DUT(.clk(clk),
                 .Q_Act1(Q_Act1),
                 .Q_Act2(Q_Act2),
                 .Q_Act3(Q_Act3),
                 .Q_Act4(Q_Act4),
                 .Q_Act5(Q_Act5),
                 .Q_Act6(Q_Act6),
                 .Q_Act7(Q_Act7),
                 .Q_Act8(Q_Act8),
                 .Q_Act9(Q_Act9),
                 .Q_Act10(Q_Act10),
                 .Q_Act11(Q_Act11),
                 .Q_Act12(Q_Act12),
                 .Q_Act13(Q_Act13),
                 .Q_Act14(Q_Act14),
                 .Q_Act15(Q_Act15),
                 .out(Q_max));

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end

    //test case
    initial begin
      #10;
      Q_Act1 = 16'd1;
      Q_Act2 = 16'd2;
      Q_Act3 = 16'd3;
      Q_Act4 = 16'd4;
      Q_Act5 = 16'd0;
      Q_Act6 = 16'd0;
      Q_Act7 = 16'd0;
      Q_Act8 = 16'd0;
      Q_Act9 = 16'd0;
      Q_Act10 = 16'd0;
      Q_Act11 = 16'd0;
      Q_Act12 = 16'd0;
      Q_Act13 = 16'd0;
      Q_Act14 = 16'd0;
      Q_Act15 = 16'd0;

      #10;
      Q_Act1 = 16'd2;
      Q_Act2 = 16'd3;
      Q_Act3 = 16'd6;
      Q_Act4 = 16'd1;

      #30;
      Q_Act1 = 16'd5;
      Q_Act2 = 16'd4;
      Q_Act3 = 16'd1;
      Q_Act4 = 16'd2;

      #20;
      Q_Act1 = 16'd4;
      Q_Act2 = 16'd7;
      Q_Act3 = 16'd2;
      Q_Act4 = 16'd3;

    
    end

    //display monitor
    initial begin
     $monitor("time = %2d\n dout = %2d", 
           $time , Q_max);
    end
    
endmodule