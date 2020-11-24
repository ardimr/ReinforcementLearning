module StateSelector (
	input [3:0] next_action,
	input [5:0] current_state,
	output reg [5:0] next_state);

  always @(*) begin
	  case(next_action)
	    //Geser Kanan
	    4'b0000: begin 
			if(current_state%5 != 0)
			   begin
                    next_state=current_state+1;
			   end
			else
			   begin
                    next_state=current_state;
			   end     
		     end
	    //Geser Atas
	    4'b0001: begin 
			if(current_state > 5)
			   begin
                    next_state=current_state-5;
			   end
			else
			   begin
                    next_state=current_state;
			   end     
		     end
	    //Geser Kiri
            4'b0010: begin 
			if(current_state%5 != 1)
			   begin
                    next_state=current_state-1;
			   end
			else
			   begin
                    next_state=current_state;
			   end     
		     end
            //Geser Bawah
	    4'b0011: begin 
			if(current_state%5 < 21)
			   begin
                    next_state=current_state+5;
			   end
			else
			   begin
                    next_state=current_state;
			   end     
		     end
	    default: begin next_state=current_state; end
	  endcase
  end
endmodule
