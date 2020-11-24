
module ControlUnit(clk,en,epsilon,goal,error);
  input clk;
  input en;
  input epsilon; 
  output goal;
  output error;
	
  wire [3:0] w_next_action;
  wire [15:0] w_next_reward;
  wire [5:0] W_next_state;
  wire [5:0] w_current_state
  
  RewardGenerator Reward(.next_state(w_next_state),
			 .next_reward(w_next_reward));

  StateSelector State(.next_action(w_next_action),
	         	   .current_state(w_current_state), 
			   .next_state(w_next_state));

  QLearningAgent Agent(.clk(clk),
			.en(en),
			.reward(w_next_reward), 	
			.next_state(w_next_state));

  MazeMap Maze(.current_state(w_current_state)));
	
always@(*) begin
	if(w_current_state == 6'd25) begin
		goal=1'b1;
	end
	else begin
		goal=1'b0
        end
	if(w_current_state == 3 || w_current_state == 4 || w_current_state == 7 || w_current_state == 13 || w_current_state == 14 || w_current_state == 17 || 
           w_current_state == 19 || w_current_state == 22) begin
	        error =1'b1;
	end
	else begin
	        error =1'b0;
	end
end
			
endmodule
