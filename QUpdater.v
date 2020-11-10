module QUpdater (old_Q, max_Q, gamma, alpha, rt, new_Q);
	input [15:0] old_Q;
	input [15:0] max_Q;
	input [3:0] gamma;
	input [15:0] rt;
	input [3:0] alpha;
	output [15:0] new_Q;
	
	wire [15:0] shifted_max_Q;
	wire [15:0] combined_Q;
	
	BarrelShifter barrel_gamma(max_Q, gamma, shifted_max_Q);
	BarrelShifter barrel_alpha(combined_Q, alpha, new_Q);
	
	assign combined_Q = rt + shifted_max_Q - old_Q;
	
endmodule
