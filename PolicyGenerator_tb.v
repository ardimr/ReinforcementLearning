`timescale 1 ns/10 ps  // time-unit = 1 ns, precision = 10 ps

module PolicyGenerator_tb();
	reg clk = 1'b0; // Clock
    reg [15:0] epsilon;
    reg [63:0] q_values; // Q Values untuk 1 State

	wire [3:0] action;
	
	PolicyGenerator policy_generator(.clk(clk), .q_values(q_values), .epsilon(epsilon), .current_action(action));

    //clock generator
    always begin
    #10 clk = ~clk; //Clock dengan periode 20 time unit
    end
	
	initial begin
		q_values = 64'b0000000000001100000000000000000100000000000000100000000000000011;
		epsilon = 16'b0000000011100000;
		$display("epsilon = %f", $itor(epsilon)*2.0**-8.0);
		#10;
		q_values = 64'b0000000000001100000000000000000100000000000000100000000000000111;
		epsilon = 16'b0000000011000000;
		$display("epsilon = %f", $itor(epsilon)*2.0**-8.0);
		#10;
		$stop;
	end
	
endmodule
