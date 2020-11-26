module QUpdater (old_Q, max_Q, reward, new_Q);
	input [15:0] old_Q;
	input [15:0] max_Q;
	input [15:0] reward; // Current Reward
	output [15:0] new_Q; // Updated Q value
	
	wire [15:0] max_i;
	wire [15:0] max_j;
	wire [15:0] max_k;
	wire [15:0] combined_Q;
	wire [15:0] final_Q;
	
	BarrelShifter barrel_max_i(max_Q, 4'd1, max_i);
	BarrelShifter barrel_max_j(max_Q, 4'd2, max_j);
	BarrelShifter barrel_max_k(max_Q, 4'd3, max_k);
	BarrelShifter barrel_alpha(combined_Q, 4'd1, final_Q);
	
	assign combined_Q = reward + max_i + max_j + max_k - old_Q;
	assign new_Q = final_Q + old_Q;
	
endmodule
