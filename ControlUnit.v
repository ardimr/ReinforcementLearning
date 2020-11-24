
module ControlUnit(clk,en,epsilon);
  input clk;
  input en;
  input epsilon; 
  
  wire [3:0] w_next_action;
  wire [15:0] w_next_reward;
  wire [5:0] w_next_state;
  wire [5:0] w_current_state;
  
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
  
	always @(*) begin
			
	end
	
	
endmodule
