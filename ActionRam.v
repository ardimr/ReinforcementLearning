//action ram
module ActionRAM(clk, en, wr_addr, rd_addr, write_en, data_in, data_out);
  input clk;
  input en;
  input write_en;
  input[5:0] wr_addr ;
  input[5:0] rd_addr;
  input[15:0] data_in;

  output reg[15:0] data_out;

  //File Name Parameter
  parameter FILENAME = "memory_in.list";
  //Memory Model
  reg[15:0] mem[0:63];

  initial begin
      $readmemh (FILENAME, mem);
  end
  
  always@(posedge clk) begin
      if(!en) begin
          data_out = 16'd0;
      end
      else begin
          data_out <= mem[rd_addr];
      end
       
      if (write_en) begin
          mem[wr_addr] <= data_in;
      end
      else begin
          mem[wr_addr] <= mem[wr_addr]; //do nothing
      end
  end
endmodule
