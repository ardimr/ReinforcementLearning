module tb_random;
	reg [15:0] seed;
	reg clk = 1'b1; // Clock
	reg start = 1'b1; // Start signal, Active Low
	wire [15:0] out;
	
	always begin
		#10 clk = ~clk; //Clock dengan periode 20 time unit
		if (clk) begin
			$displayb(out[7:0]);
			$display("Random Number = %f", $itor(out[7:0])*2.0**-8.0);
		end
    end
	
	Randomizer randomizer(seed, start, clk, out);
	
	initial begin
		seed = 16'b0100001001000010;
		#10;
		start = 1'b0;
		#1000;
		$stop;
	end

endmodule
