//Testbench Max Blcok 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module decoder_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     
     reg[3:0] action;
     wire en1,en2,en3,en4,en5,en6,en7,e8,en9,en10,en11,en12,en13,en14,en15;
     //port mapping
    Decoder DUT( .at(action),
                 .en1(en1),
                 .en2(en2),
                 .en3(en3),
                 .en4(en4),
                 .en5(en5),
                 .en6(en6),
                 .en7(en7),
                 .en8(en8),
                 .en9(en9),
                 .en10(en10),
                 .en11(en11),
                 .en12(en12),
                 .en13(en13),
                 .en14(en14),
                 .en15(en15));

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end

    //test case
    initial begin
      #10;
      action = 1;
      #20;
      action = 2;
      #20;
      action = 3;
      #20;
      action = 4;
      
      

    
    end

    //display monitor
    // initial begin
    //  $monitor("time = %2d\n dout = %2d", 
    //        $time , Q_max);
    // end
    
endmodule