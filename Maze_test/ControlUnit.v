module ControlUnit(clk,enb,epsilon,next_action,current_st,episode,fail,finish,new_gen,next_action_o);
  input clk;
  input [15:0]epsilon;
  input enb; 
  input [3:0] next_action; //hilangkan kalo pake qagent
  //input [5:0] current_state;
  output reg [9:0] episode;
  output reg fail;
  output reg finish;
  output reg new_gen;
  output reg [5:0] current_st;
  output wire [3:0] next_action_o;
	
  wire [3:0] w_next_action;
  wire signed [15:0] w_next_reward ;
  wire [5:0] next_state;
  reg [5:0] current_state = 6'd0;
  reg start;
  reg en;

  reg [1:0] current_condition = 2'b00;
  reg [1:0] next_condition = 2'b00;
  reg [5:0] counter;
 

  RewardGenerator Reward(.next_state(next_state),
                        .next_reward(w_next_reward));
  

  StateSelector State(.next_action(w_next_action),
	         	   .current_state(current_state), 
			   .next_state(next_state));

  QLearningAgent Agent(.clk(clk),
			.en(en),
			.start(start),
			.next_reward(w_next_reward), 	
			.next_state(next_state),
			.current_state(current_state),
			.epsilon(epsilon),
			.next_action(w_next_action));

assign next_action_o=w_next_action;
always@(*) begin
	
	if(current_condition == 2'b00) begin
	   //State Start
	   current_state=6'd1;
	   current_st=6'd1;
	   start=1'b1;
	   en=1'b1;
	   new_gen=1'b1;
	   counter=4'd0;
	end
	else if (current_condition ==2'b01) begin
	   //State Calculation
	   current_state=6'd1;
	   current_st=6'd1;
	   start=1'b0;
	   en=1'b1;
	   new_gen=1'b1;
	   counter=4'd0;
	end
	else if (current_condition ==2'b10) begin
	   //State finish
	   start=1'b0;
	   en=1'b1;
	   new_gen=1'b0;
	end
	else begin
	   //State Tidak Berhasil
	   start=1'b0;
	   en=1'b0;
	   new_gen=1'b0;
	   counter=4'd0;
	end
	
	if(current_state == 6'd25) begin
		next_condition=2'b01;
	end
	else if(current_state == 5  || current_state == 8 || current_state == 7  || current_state == 14 || current_state == 17 || 
                current_state == 19 || current_state == 22) begin
	        next_condition=2'b01;
		 
	end
	else if (counter > 5'd14) begin
		next_condition=2'b01;
	end
	else if (episode == 10'd256) begin
		next_condition=2'b11;
	end
	else if (current_condition == 2'b00) begin
		next_condition=2'b01;
	end
	else if (current_condition == 2'b01) begin
		next_condition=2'b10;
	end


end

always@(posedge clk) begin
	current_state<=next_state;
	current_st<=next_state;
	current_condition<=next_condition;

	if (enb == 1'b1) begin
	current_condition<=2'b00;
	episode=10'd0;
	end
	else if (current_condition == 2'b10) begin
		counter=counter+1;
	end
	else if (current_condition == 2'b01) begin
		episode= episode+1;
	end

end		
endmodule
