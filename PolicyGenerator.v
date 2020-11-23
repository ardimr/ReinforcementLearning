module PolicyGenerator(clk, q_values, current_state, new_action, next_state);
  input clk; // Clock
  input [63:0] q_values; // Q Values untuk 1 State
  //output reg [5:0] current_state; // Current State
  output reg [3:0] next_action; // Next Action
  //output [5:0] next_state; // Next State  
  //reg [5:0] current_state_reg; // Current State Temporary
  
  wire [3:0] w_next_action; // Next Action Wire
  //wire [5:0] w_next_state; // Next State Wire
  
  ActionSelector Act(.q_values(q_values),.action(at_next));
  //StateSelector State(.new_action(at_next),.current_state(current_state), .next_state(s));
  
  //Delay
  always@(posedge clk)
     begin
        next_action = next_action;
        //current_state_reg = w_next_state;
     end
     
  //assign next_state = w_next_state;
  
endmodule
