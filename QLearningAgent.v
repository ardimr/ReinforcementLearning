//Module Q learning Agent

module QLearningAgent (clk, en, start, epsilon, next_reward, next_state, next_action);
  input clk;
  input en;
  input start;
  input [15:0] epsilon;
  input [15:0] next_reward; // Reward
  input [5:0] next_state; // Next State
  output next_action; // Action that will be taken from Policy
  
  wire [63:0] w_q_values;
  //wire w_next_reward;
  //wire w_next_state;
  wire [15:0] w_curr_reward;
  wire [5:0] w_curr_state;
  wire [3:0] w_curr_action;

  QLearningAccelerator QLearningAccelerator(.clk(clk), 
                                            .en(en),
                                            .current_action(w_curr_action),
                                            .current_state(w_curr_state),
                                            .next_state(next_state),
                                            .current_reward(w_curr_reward),
                                            .Q_out_action(w_q_values));

  PolicyGenerator PolicyGenerator(.clk(clk), .start(start)
                                   .current_action(w_curr_action),
                                   .epsilon(epsilon),
                                   .q_values(w_q_values));
    
    DelayReward DelayReward(.clk(clk),
                            .din(next_reward),
                            .dout(w_curr_reward));
    
    DelayState DelayState(.clk(clk),
                            .din(next_state),
                            .dout(w_curr_state));
    
  
    assign next_action = w_curr_action;
endmodule
