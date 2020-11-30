//Maze Map

module MazeMap(clk,current_state, out_map_row_1, out_map_row_2, out_map_row_3, out_map_row_4, out_map_row_5);
  input clk;
  input [6:0] current_state;
  
  //output
  output reg[3:0] out_map_row_1, out_map_row_2, out_map_row_3, out_map_row_4, out_map_row_5;

  reg[3:0] memory_map[0:24];

  reg [6:0] prev_state;
  
  //read initial memory access
  initial begin
      $readmemh ("memory_map.list", memory_map);
  end
  
  always @(posedge clk) begin
      prev_state <= current_state;

      out_map_row_1 <= memory_map[0:4];
      out_map_row_2 <= memory_map[5:9];
      out_map_row_3 <= memory_map[10:14];
      out_map_row_4 <= memory_map[15:19];
      out_map_row_5 <= memory_map[20:24];

  end
  
  always @(*) begin
    case(prev_state)
      5'b00000: begin memory_map[0]=3'd0; end
      5'b00001: begin memory_map[1]=3'd0; end
      5'b00010: begin memory_map[2]=3'd0; end
      5'b00011: begin memory_map[3]=3'd0; end
      5'b00100: begin memory_map[4]=3'd0; end
      5'b00101: begin memory_map[5]=3'd0; end
      5'b00110: begin memory_map[6]=3'd0; end
      5'b00111: begin memory_map[7]=3'd0; end
      5'b01000: begin memory_map[8]=3'd0; end
      5'b01001: begin memory_map[9]=3'd0; end
      5'b01010: begin memory_map[10]=3'd0; end
      5'b01011: begin memory_map[11]=3'd0; end
      5'b01100: begin memory_map[12]=3'd0; end
      5'b01101: begin memory_map[13]=3'd0; end
      5'b01111: begin memory_map[14]=3'd0; end
      5'b10000: begin memory_map[15]=3'd0; end
      5'b10001: begin memory_map[16]=3'd0; end
      5'b10010: begin memory_map[17]=3'd0; end
      5'b10011: begin memory_map[18]=3'd0; end
      5'b10100: begin memory_map[19]=3'd0; end
      5'b10101: begin memory_map[20]=3'd0; end
      5'b10110: begin memory_map[21]=3'd0; end
      5'b10111: begin memory_map[22]=3'd0; end
      5'b11000: begin memory_map[23]=3'd0; end
      5'b11001: begin memory_map[24]=3'd0; end
      default: begin memory_map[0]=3'd0; end
	  endcase
    case(current_state)
      5'b00000: begin memory_map[0]=3'd1; end
      5'b00001: begin memory_map[1]=3'd1; end
      5'b00010: begin memory_map[2]=3'd1; end
      5'b00011: begin memory_map[3]=3'd1; end
      5'b00100: begin memory_map[4]=3'd1; end
      5'b00101: begin memory_map[5]=3'd1; end
      5'b00110: begin memory_map[6]=3'd1; end
      5'b00111: begin memory_map[7]=3'd1; end
      5'b01000: begin memory_map[8]=3'd1; end
      5'b01001: begin memory_map[9]=3'd1; end
      5'b01010: begin memory_map[10]=3'd1; end
      5'b01011: begin memory_map[11]=3'd1; end
      5'b01100: begin memory_map[12]=3'd1; end
      5'b01101: begin memory_map[13]=3'd1; end
      5'b01111: begin memory_map[14]=3'd1; end
      5'b10000: begin memory_map[15]=3'd1; end
      5'b10001: begin memory_map[16]=3'd1; end
      5'b10010: begin memory_map[17]=3'd1; end
      5'b10011: begin memory_map[18]=3'd1; end
      5'b10100: begin memory_map[19]=3'd1; end
      5'b10101: begin memory_map[20]=3'd1; end
      5'b10110: begin memory_map[21]=3'd1; end
      5'b10111: begin memory_map[22]=3'd1; end
      5'b11000: begin memory_map[23]=3'd1; end
      5'b11001: begin memory_map[24]=3'd1; end
      default: begin memory_map[0]=3'd1; end
	  endcase
  end
  

  //display monitor
    // initial begin
    //  $monitor("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d", 
    //            memory_map[0], memory_map[1],memory_map[2],memory_map[3],memory_map[4],
    //            memory_map[5], memory_map[6], memory_map[7], memory_map[8], memory_map[9],
    //            memory_map[10],memory_map[11],memory_map[12],memory_map[13],memory_map[14],
    //            memory_map[15],memory_map[16],memory_map[17],memory_map[18],memory_map[19],
    //            memory_map[20],memory_map[21],memory_map[22],memory_map[23],memory_map[24]);
    // end

endmodule  
  
