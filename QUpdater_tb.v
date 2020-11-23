module tb_qupdater;

	reg [15:0] old_Q;
	reg [15:0] max_Q;
	reg [3:0] gamma;
	reg [15:0] rt;
	reg [3:0] alpha;
	wire [15:0] new_Q;
	
	QUpdater q_updater(old_Q, max_Q, gamma, alpha, rt, new_Q);
	
	initial begin
		old_Q = 16'b0000000000000001;
		max_Q = 16'b0000000000000011;
		gamma = 4'b0001;
		alpha = 4'b0001;
		rt = 16'b0000000000000111;
		#10;
		$stop;
	end
endmodule
