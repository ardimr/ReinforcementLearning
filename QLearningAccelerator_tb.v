//Testbench Action RAM 
`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps
module maze_sover_tb();
     //input Declaration
     reg clk = 1'b0;
     reg en = 1'b0;
     reg [3:0] action = 4'd0;
     reg [5:0] state;
     reg [5:0] next_state;
     reg signed [15:0] reward;
     reg [3:0] gamma;
     reg [3:0] alpha;

     reg [16:0] action_counter;


     wire [15:0] result;
     //port mapping
    Q_learning_acc DUT(.clk(clk), 
                       .en(en),
                       .action(action),
                       .state(state),
                       .next_state(next_state),
                       .reward(reward),
                       .gamma(gamma),
                       .alpha(alpha),
                       .result(result));

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end
    
    //test case
    always@(*) begin
        if (next_state == 6'd25)
          reward = 16'd100;
        else if (action_counter == 16'd15)
          reward = 16'hFFCE;// -50
        else if (next_state == 6'd3)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd4)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd7)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd13)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd14)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd17)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd19)
          reward = 16'hFF9C; //-100
        else if (next_state == 6'd22)
          reward = 16'hFF9C; //-100
        else 
          reward = 16'h0; // 0
    end

    initial begin
      #10;
      en = 1'b1;
      state = 6'b000001;
      next_state = 6'b000010;
      alpha = 4'b1000;
      gamma = 4'b1110;

      #60;
      state = 6'b000010;
      next_state = 6'b000011;
      action = 4'd1;

    end

    //display monitor
    initial begin
     $monitor("time = %2d\n result = %2d", 
           $time , result);
    end
    
endmodule
