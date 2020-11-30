module QUpdater_tb();

	reg signed [15:0] old_Q;
	reg signed [15:0] max_Q;
	reg [3:0] gamma;
	reg [15:0] current_reward;
	reg [3:0] alpha;
	wire [15:0] new_Q;
	
	localparam sf = 2.0**-8.0;  // Q4.4 scaling factor is 2^-4

	QUpdater q_updater(old_Q, max_Q, current_reward, new_Q);
	
	initial begin
		old_Q = 16'b00000010_00000000; // 2
		max_Q = 16'b00000010_00000000; // 2
		current_reward = 16'b00000111_00000000; //7
		#10;
		$display("new_Q = %f", $itor(new_Q)*sf);
		$stop;
	end
endmodule
