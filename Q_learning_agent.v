//Module Q learning Agent

module Q_learning_agent (clk,en, reward, gamma, alpha, state, next_state);
  input clk;
  input en;
  input[15:0] reward;
  input [3:0] gamma, alpha;
  input[5:0] state, next_state;

  wire [63:0] w_q_values;
  wire w_next_action;
  wire w_next_state;
  wire w_curr_action;
  wire w_curr_state;

  

  
  Q_learning_acc Q_learning_acc(.clk(clk), 
                    .en(en),
                    .action(w_curr_action),
                    .state(w_curr_state),
                    .next_state(w_next_state),
                    .reward(reward),
                    .gamma(gamma),
                    .alpha(alpha),
                    .Q_new(result),
                    .Q_out_action(q_values));

   PG policy_generator(.clk(clk),
                       .new_action(w_next_action),
                       .q_values(q_values),
                       .state(w_curr_state),
                       .next_state(w_next_state));
    
    Delay_action delay_action(.clk(clk),
                              .din(w_next_action),
                              .dout(w_curr_action));
    
    Delay_state delay_state(.clk(clk),
                            .din(w_next_state),
                            .dout(w_curr_state));

endmodule