module PG(clk,q_values, current_state, at, st, st_next);
  input clk;
  input [63:0] q_values;
  input [5:0] current_state;
  output reg [3:0] at;
  output reg [5:0] st;
  output [5:0] st_next;
  
  wire [3:0] at_next;
  wire [5:0] s;
  
  ActionSelector Act(.q_values(q_values),.action(at_next));
  PenentuState_Block State(.at(at_next),.current_state(current_state), .next_state(s));
  
  always@(posedge clk)
     begin
        at=at_next;
        st=s;
     end
     
  assign st_next=s;
endmodule
