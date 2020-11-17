module Decoder (
	input [3:0] at,
	output en1,en2,en3,en4,en5,en6,en7,en8,en9,en10,en11,en12,en13,en14,en15);

	reg [15:0] out;

  always @(*) begin
	  case(at)
	    4'd1: begin out=16'b0000000000000001; end
	    4'd2: begin out=16'b0000000000000010; end
	    4'd3: begin out=16'b0000000000000100; end
	    4'd4: begin out=16'b0000000000001000; end
	    4'd5: begin out=16'b0000000000010000; end
	    4'd6: begin out=16'b0000000000100000; end
	    4'd7: begin out=16'b0000000001000000; end
	    4'd8: begin out=16'b0000000010000000; end
	    4'd9: begin out=16'b0000000100000000; end
	    4'd10: begin out=16'b0000001000000000; end
	    4'd11: begin out=16'b0000010000000000; end
	    4'd12: begin out=16'b0000100000000000; end
	    4'd13: begin out=16'b0001000000000000; end
	    4'd14: begin out=16'b0010000000000000; end
	    4'd15: begin out=16'b0100000000000000; end
	    default : begin out=16'b0000000000000000; end
	  endcase
  end

  assign en1 = out[0];
  assign en2 = out[1];
  assign en3 = out[2];
  assign en4 = out[3];
  assign en5 = out[4];
  assign en6 = out[5];
  assign en7 = out[6];
  assign en8 = out[7];
  assign en9 = out[8];
  assign en10 = out[9];
  assign en11 = out[10];
  assign en12 = out[11];
  assign en13 = out[12];
  assign en14 = out[13];
  assign en15 = out[14];
endmodule
