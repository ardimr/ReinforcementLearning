module tb_action;
	
	reg [63:0] q_values;
	reg [15:0] epsilon;
	wire [3:0] action;
	
	ActionSelector action_selector(q_values, epsilon, action);
	
	initial begin
		q_values = 64'b0000000000001100000000000000000100000000000000100000000000000011;
		epsilon = 16'b0000000011100000;
		$display("Random = %f", $itor(epsilon)*2.0**-8.0);
		#10;
		q_values = 64'b0000000000001100000000000000000100000000000000100000000000000111;
		epsilon = 16'b0000000011000000;
		$display("Random = %f", $itor(epsilon)*2.0**-8.0);
		#10;
		$stop;
		
	end
	
endmodule
