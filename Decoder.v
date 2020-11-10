module Decoder (
	input [3:0] at,
	output reg [15:0] out);

  always @(*) begin
	  case(at)
	    4'b0000: begin out=16'b0000000000000001; end
	    4'b0001: begin out=16'b0000000000000010; end
	    4'b0010: begin out=16'b0000000000000100; end
	    4'b0011: begin out=16'b0000000000001000; end
	    4'b0100: begin out=16'b0000000000010000; end
	    4'b0101: begin out=16'b0000000000100000; end
	    4'b0110: begin out=16'b0000000001000000; end
	    4'b0111: begin out=16'b0000000010000000; end
	    4'b1000: begin out=16'b0000000100000000; end
	    4'b1001: begin out=16'b0000001000000000; end
	    4'b1010: begin out=16'b0000010000000000; end
	    4'b1011: begin out=16'b0000100000000000; end
	    4'b1100: begin out=16'b0001000000000000; end
	    4'b1101: begin out=16'b0010000000000000; end
	    4'b1110: begin out=16'b0100000000000000; end
	    4'b1111: begin out=16'b1000000000000000; end
	  endcase
  end
endmodule

/* Model port mapping
.EN0(out[0]),
.EN1(out[2]),
.EN2(out[3],
dst
*/
