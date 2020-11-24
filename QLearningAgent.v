//Module Q learning Agent

module QLearningAgent (clk, en, next_reward, current_state, next_state);
  input clk;
  input en;
  input[15:0] next_reward; // Reward
  input[5:0] next_state; // Next State

  wire [63:0] w_q_values;
  wire w_next_reward;
  wire w_next_state;
  wire w_curr_reward;
  wire w_curr_state;

 
  QlearningAccelerator QLearningAccelerator(.clk(clk), 
                    .en(en),
                    .current_action(w_curr_action),
                    .current_state(w_curr_state),
                    .next_state(w_next_state),
                    .current_reward(w_curr_reward),
                    .Q_out_action(w_q_values));

   PolicyGenerator PolicyGenerator(.clk(clk),
                                   .next_action(w_next_action),
                                   .q_values(w_q_values));
    
    DelayReward DelayReward(.clk(clk),
                            .din(w_next_reward),
                            .dout(w_curr_reward));
    
    Delay_state delay_state(.clk(clk),
                            .din(w_next_state),
                            .dout(w_curr_state));

endmodule
