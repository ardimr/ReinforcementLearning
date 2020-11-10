module Decoder (
	input [3:0] at,
	output reg en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14,en15);

  always @(*) begin
	  case(at)
	    4'b0000: begin en1=1'b1; end
	    4'b0001: begin en2=1'b1; end
	    4'b0010: begin en3=1'b1; end
	    4'b0011: begin en4=1'b1; end
	    4'b0100: begin en5=1'b1; end
	    4'b0101: begin en6=1'b1; end
	    4'b0110: begin en7=1'b1; end
	    4'b0111: begin en8=1'b1; end
	    4'b1000: begin en9=1'b1; end
	    4'b1001: begin en10=1'b1; end
	    4'b1010: begin en11=1'b1; end
	    4'b1011: begin en12=1'b1; end
	    4'b1100: begin en13=1'b1; end
	    4'b1101: begin en14=1'b1; end
	    default: begin en15=1'b1; end
	  endcase
  end
endmodule

/* Model port mapping
.EN0(out[0]),
.EN1(out[2]),
.EN2(out[3],
dst
*/
