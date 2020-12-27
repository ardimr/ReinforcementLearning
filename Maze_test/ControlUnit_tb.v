`timescale 100 ps/1 ps  // time-unit = , precision =
module ControlUnit_tb();
     //input Declaration
     reg clk = 1'b1;
     reg enb = 1'b1;
     reg [15:0] epsilon = 15'd0;
     reg [3:0] next_action ;
     reg [5:0] count =6'd0;
     reg [5:0] prev_st=6'd0;
     
     wire [9:0] episode;
     wire fail;
     wire finish;
     wire new_gen;
     wire [5:0] current_st;
     wire [3:0] next_action_o;
    //  reg [3:0] gamma;
    //  reg [3:0] alpha;

     //reg [16:0] action_counter;


     //wire [15:0] result;
    // wire [63:0] Q_out_action;
     //port mapping
    ControlUnit DUT(.clk(clk),
                       .enb(enb),
		       .epsilon(epsilon),
		       .next_action(next_action),
		       .current_st(current_st),
                       .episode(episode),
                       .fail(fail),
		       .finish(finish),
	               .new_gen(new_gen),
		       .next_action_o(next_action_o));

    reg[3:0] memory_map[0:24];
    reg[5:0] Maze[0:24];

   //read initial memory access
   initial begin
      $readmemh ("memory_map.list", memory_map);
   end


    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end
    
    
    initial begin
      //new_gen=1'd1;
	Maze[0]=6'd0;
	Maze[1]=6'd0;
	Maze[2]=6'd0;
	Maze[3]=6'd0;
	Maze[4]=6'd0;
	Maze[5]=6'd0;
	Maze[6]=6'd0;
	Maze[7]=6'd0;
	Maze[8]=6'd0;
	Maze[9]=6'd0;
	Maze[10]=6'd0;
	Maze[11]=6'd0;
	Maze[12]=6'd0;
	Maze[13]=6'd0;
	Maze[14]=6'd0;
	Maze[15]=6'd0;
	#20;
	epsilon=16'b0000000011111111;
      //next_reward = 16'b00000111_00000000; //7
      enb = 1'b0;
      next_action = 4'b0000; 
      //current_action = 4'd1;
      // alpha = 4'b1000; 
      // gamma = 4'b1110;

      #20;
      enb= 1'b0;
      next_action = 4'b0000;
      //next_reward = 16'b00000101_00000000; //7
      //current_action = 4'd1;

      #20;
      next_action = 4'b0000;
      

      #20;
      next_action = 4'b0000;

      #20;
      next_action = 4'b0000;

      #20;
      next_action = 4'b0000;
      

      #20;
      next_action = 4'b0000;

      #20;
      next_action = 4'b0011;

      #20;
      next_action = 4'b0011;
      

      #20;
      next_action = 4'b0011;

      #20;
      next_action = 4'b0011;

      #20;
      next_action = 4'b0000;
      

      #20;
      next_action = 4'b0000;

      #20;
      next_action = 4'b0011;

     #20;
      next_action = 4'b0011;

     #20;
      next_action = 4'b0000;
      
      #20;
      next_action = 4'b0000;
    end

    always@(episode) begin
    	epsilon=1-episode/300;
    end
  //display monitor
    always@(negedge clk) begin
     $readmemh ("memory_map.list", memory_map);
     
     if(new_gen) begin
	Maze[0]=6'd0;
	Maze[1]=6'd0;
	Maze[2]=6'd0;
	Maze[3]=6'd0;
	Maze[4]=6'd0;
	Maze[5]=6'd0;
	Maze[6]=6'd0;
	Maze[7]=6'd0;
	Maze[8]=6'd0;
	Maze[9]=6'd0;
	Maze[10]=6'd0;
	Maze[11]=6'd0;
	Maze[12]=6'd0;
	Maze[13]=6'd0;
	Maze[14]=6'd0;
	Maze[15]=6'd0;
	Maze[16]=6'd0;
	Maze[17]=6'd0;
	Maze[18]=6'd0;
	Maze[19]=6'd0;
	Maze[20]=6'd0;
	Maze[21]=6'd0;
	Maze[22]=6'd0;
	Maze[23]=6'd0;
	Maze[24]=6'd0;
	count=6'd0;	
	end
	
	if(prev_st != current_st) begin
	Maze[count]=current_st;
	count=count+1;
	end
	prev_st=current_st;	
	
	//$monitor("S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d\n", 
          //     Maze[0], Maze[1],Maze[2],Maze[3],Maze[4],
            //   Maze[5], Maze[6],Maze[7],Maze[8],Maze[9],
              // Maze[10],Maze[11],Maze[12],Maze[13],Maze[14]);
	

     case(current_st)
      5'b00001: begin memory_map[0]=3'd1; end
      5'b00010: begin memory_map[1]=3'd1; end
      5'b00011: begin memory_map[2]=3'd1; end
      5'b00100: begin memory_map[3]=3'd1; end
      5'b00101: begin memory_map[4]=3'd1; end
      5'b00110: begin memory_map[5]=3'd1; end
      5'b00111: begin memory_map[6]=3'd1; end
      5'b01000: begin memory_map[7]=3'd1; end
      5'b01001: begin memory_map[8]=3'd1; end
      5'b01010: begin memory_map[9]=3'd1; end
      5'b01011: begin memory_map[10]=3'd1; end
      5'b01100: begin memory_map[11]=3'd1; end
      5'b01101: begin memory_map[12]=3'd1; end
      5'b01110: begin memory_map[13]=3'd1; end
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
      5'b11010: begin memory_map[25]=3'd1; end
      default: begin memory_map[0]=3'd1; end
	  endcase
     $monitor("%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n%d %d %d %d %d\n S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d => S %d\n ", 
               memory_map[0], memory_map[1],memory_map[2],memory_map[3],memory_map[4],
               memory_map[5], memory_map[6], memory_map[7], memory_map[8], memory_map[9],
               memory_map[10],memory_map[11],memory_map[12],memory_map[13],memory_map[14],
               memory_map[15],memory_map[16],memory_map[17],memory_map[18],memory_map[19],
               memory_map[20],memory_map[21],memory_map[22],memory_map[23],memory_map[24],
	       Maze[0], Maze[1],Maze[2],Maze[3],Maze[4],
               Maze[5], Maze[6],Maze[7],Maze[8],Maze[9],
               Maze[10],Maze[11],Maze[12],Maze[13],Maze[14]);
    end
    
    
endmodule
