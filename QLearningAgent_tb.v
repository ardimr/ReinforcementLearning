//Testbench Action RAM 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module QLearningAgent_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     reg [5:0] next_state;
     reg signed [15:0] next_reward;
     reg signed [15:0] next_reward_temp;
    //  reg [3:0] gamma;
    //  reg [3:0] alpha;

     //reg [16:0] action_counter;


     //wire [15:0] result;
    // wire [63:0] Q_out_action;
     //port mapping
    QLearningAgent DUT(.clk(clk), 
                       .en(en),
                       .next_state(next_state),
                       .next_reward(next_reward));

    reg[3:0] memory_map[0:24];

   //read initial memory access
   initial begin
      $readmemh ("memory_map.list", memory_map);
   end


    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end
    
    //test case
    always@(*) begin
        if (next_state == 6'd25)
          next_reward = 16'd100;
        else if (next_state == 6'd3)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd4)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd7)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd13)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd14)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd17)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd19)
          next_reward = 16'h9C00; //-100
        else if (next_state == 6'd22)
          next_reward = 16'h9C00; //-100
        else 
          next_reward = 16'h0; // 0
    end

    initial begin
      #10;
      //next_reward = 16'b00000111_00000000; //7
      en = 1'b1;
      memory_map[0] = 1;
      next_state = 6'b000001; //1
      //current_action = 4'd1;
      // alpha = 4'b1000; 
      // gamma = 4'b1110;

      #20;
      next_state = 6'b000010; //2
      memory_map[1] = 1;
      //next_reward = 16'b00000101_00000000; //7
      //current_action = 4'd1;

      #20;
      next_state = 6'b000111; //7
      memory_map[2] = 1;
      //next_reward = 16'b00000101_00000000; //7

       #20;
      next_state = 6'b001000; //8
      memory_map[7] = 1;

      #20;
      memory_map[8] = 1;
      //next_reward = 16'b00000101_00000000; //7

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
