//action ram
module action_ram(clk, en, wr_addr, rd_addr, write_en, data_in, data_out);
  input clk;
  input en;
  input write_en;
  input[5:0] wr_addr ;
  input[5:0] rd_addr;
  input[15:0] data_in;

  output reg[15:0] data_out;

  //Memory Model
  reg[15:0] mem[0:63];

  //read initial memory access
//   initial begin
//       $readmemh ("memory_in.list", mem);
//   end
  
  always@(posedge clk) begin
      if(!en) begin
          data_out = 16'd0;
      end
      else if (write_en) begin
          mem[wr_addr] <= data_in;
      end
      else begin //read mode
          data_out <= mem[rd_addr]; 
      end
  end
endmodule