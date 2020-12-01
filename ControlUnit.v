module ControlUnit(clk,enb,epsilon,next_action,current_st,episode,fail,finish,print);
  input clk;
  input [15:0]epsilon;
  input enb; 
  input [3:0] next_action; //hilangkan kalo pake qagent
  //input [5:0] current_state;
  output reg [8:0] episode;
  output reg fail;
  output reg finish;
  output reg print;
  output reg [5:0] current_st;
	
  wire [3:0] w_next_action;
  wire signed [15:0] w_next_reward ;
  wire [5:0] next_state;
  reg [5:0] current_state = 6'd0;
  reg start;
  reg en;

  reg [1:0] current_condition = 2'b00;
  reg [1:0] next_condition = 2'b00;
  reg [5:0] counter;
 
  //current_condition = 2'b00;

  RewardGenerator Reward(.next_state(next_state),
                        .next_reward(w_next_reward));
  

  StateSelector State(.next_action(next_action),
	         	   .current_state(current_state), 
			   .next_state(next_state));
/*
  QLearningAgent Agent(.clk(clk),
			.en(en),
			.reward(w_next_reward), 	
			.next_state(w_next_state)
			.next_action(w_next_action));

*/	
always@(*) begin
	
	if(current_condition == 2'b00) begin
	   //State Start
	   current_state=6'd1;
	   current_st=6'd1;
	   //next_state=6'd1;
	   start=1'b1;
	   en=1'b0;
	   print=1'b1;
	   counter=4'd0;
	end
	else if (current_condition ==2'b01) begin
	   //State Calculation
	   start=1'b0;
	   en=1'b1;
	   print=1'b1;
	end
	else if (current_condition ==2'b10) begin
	   //State finish
	   start=1'b0;
	   en=1'b0;
	   print=1'b0;
	   counter=4'd0;
	   finish=1'b1;
	end
	else begin
	   //State Tidak Berhasil
	   start=1'b0;
	   en=1'b0;
	   print=1'b0;
	   counter=4'd0;
	   fail=1'b0;
	end
	
	if(current_state == 6'd25) begin
		next_condition=2'b10;
	end
	else if(current_state == 5 || current_state == 8 || current_state == 7 || current_state == 20 || current_state == 14 || current_state == 17 || 
                current_state == 19 || current_state == 22) begin
	        next_condition=2'b00;
		
	end
	else if (counter > 5'd14) begin
		next_condition=2'b00;
	end
	else if (episode == 9'd300) begin
		next_condition=2'b11;
	end
	else if (current_condition == 2'b00) begin
		next_condition=2'b01;
	end


end

always@(posedge clk) begin
	current_state<=next_state;
	current_st<=next_state;
	current_condition<=next_condition;

	if (enb == 1'b1) begin
	current_condition<=2'b00;
	end
	else if (current_condition == 2'b01) begin
		counter=counter+1;
	end
	else if (current_condition == 2'b00) begin
		episode= episode+1;
		//current_state=6'd1;
	end

end		
endmodule
