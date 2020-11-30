module tb_action;
	
	reg clk = 1'b1; // Clock
	reg start = 1'b1; // Start signal, Active Low
	reg [63:0] q_values;
	reg [15:0] epsilon;
	wire [3:0] action;
	
	ActionSelector action_selector(clk, start, q_values, epsilon, action);
	
	always begin
		#10 clk = ~clk; //Clock dengan periode 20 time unit
    end
	
	initial begin
		#10;
		start = 1'b0;
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
