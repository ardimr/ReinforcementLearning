//Maze Map

module MazeMap(current_action, current_state);
  input [3:0] current_action;
  input [6:0] current_state;

  reg[3:0] memory_map[0:24];

  //read initial memory access
  initial begin
      $readmemh ("memory_map.list", memory_map);
  end

  //display monitor
    initial begin
     $monitor("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d", 
               memory_map[0], memory_map[1],memory_map[2],memory_map[3],memory_map[4],
               memory_map[5], memory_map[6], memory_map[7], memory_map[8], memory_map[9],
               memory_map[10],memory_map[11],memory_map[12],memory_map[13],memory_map[14],
               memory_map[15],memory_map[16],memory_map[17],memory_map[18],memory_map[19],
               memory_map[20],memory_map[21],memory_map[22],memory_map[23],memory_map[24]);
    end
endmodule  
  