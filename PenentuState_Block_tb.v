module PenentuState_Block_tb;

	reg [5:0] current_st;
	reg [3:0] action;
	wire [5:0] next_st;
	
	PenentuState_Block PenentuState(.current_state(current_st), .at(action), .next_state(next_st));
	
	initial begin
		current_st = 6'b001000;
		action = 4'b0001;
		#100;
		current_st = 6'b001000;
		action = 4'b0000;
		#100;
		current_st = 6'b001000;
		action = 4'b0010;
		#100;
		current_st = 6'b001000;
		action = 4'b0011;
		#100;

		$stop;
	end
endmodule
