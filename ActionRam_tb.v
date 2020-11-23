//Testbench Action RAM 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module action_ram_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     reg write_en = 1'b0;
     reg [5:0] wr_addr ;
     reg [5:0] rd_addr;
     reg [15:0] data_in;

     wire [15:0] data_out;
     //port mapping
    action_ram DUT(.clk(clk),
                 .en(en),
                 .write_en(write_en),
                 .wr_addr(wr_addr),
                 .rd_addr(rd_addr),
                 .data_in(data_in),
                 .data_out(data_out));

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end

    //test case
    initial begin
      #10;
      en = 1'b1;
      #20;
      write_en = 1'b1;
      wr_addr = 6'd5;
      data_in = 16'd5;
      #20;
      write_en = 1'b0;
      rd_addr = 6'd5;
      #20;
      write_en = 1'b1;
      wr_addr = 6'd1;
      data_in = 16'd10;
      #20;
      write_en = 1'b0;
      rd_addr = 6'd1;
      #20;
    end

    //display monitor
    initial begin
     $monitor("time = %2d\n dout = %2d", 
           $time , data_out);
    end
    
endmodule
