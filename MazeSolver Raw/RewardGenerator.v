module RewardGenerator (next_state, reward);
	input [5:0] next_state;
	output reg signed [15:0] reward;
	
	
	always @(*) begin
		case (next_state)
			6'd25 : reward = 16'd100; //100
			6'd3 : reward = 16'hFF9C; //-100
			6'd4 : reward = 16'hFF9C; //-100
			6'd7 : reward = 16'hFF9C; //-100
			6'd13 : reward = 16'hFF9C; //-100
			6'd14 : reward = 16'hFF9C; //-100
			6'd17 : reward = 16'hFF9C; //-100
			6'd19 : reward = 16'hFF9C; //-100
			6'd22 : reward = 16'hFF9C; //-100
			default : reward = 16'h0; //0
		endcase
	end
endmodule
