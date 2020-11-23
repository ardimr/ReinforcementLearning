module RewardGenerator (next_state, next_reward);
	input [5:0] next_state;
	output reg signed [15:0] next_reward;
	
	
	always @(*) begin
		case (next_state)
			6'd25 : next_reward = 16'd100; //100
			6'd3 : next_reward = 16'hFF9C; //-100
			6'd4 : next_reward = 16'hFF9C; //-100
			6'd7 : next_reward = 16'hFF9C; //-100
			6'd13 : next_reward = 16'hFF9C; //-100
			6'd14 : next_reward = 16'hFF9C; //-100
			6'd17 : next_reward = 16'hFF9C; //-100
			6'd19 : next_reward = 16'hFF9C; //-100
			6'd22 : next_reward = 16'hFF9C; //-100
			default : next_reward = 16'h0; //0
		endcase
	end
endmodule
