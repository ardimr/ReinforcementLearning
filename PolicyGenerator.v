module PolicyGenerator(clk, q_values, current_state, new_action, next_state);
  input clk;
  input [63:0] q_values;
  input [5:0] current_state;
  output [3:0] new_action;
  output [5:0] next_state;
  
  reg [3:0] new_action;
  reg [5:0] st;
  
  wire [3:0] at_next;
  wire [5:0] s;
  
  ActionSelector Act(.q_values(q_values),.action(at_next));
  StateSelector State(.new_action(at_next),.current_state(current_state), .next_state(s));
  
  //Delay
  always@(posedge clk)
     begin
        new_action = at_next;
        st = s;
     end
     
  assign next_state = s;
  
endmodule
