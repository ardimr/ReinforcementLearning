module PolicyGenerator(clk, q_values, new_action, epsilon);
  input clk; // Clock
  input [15:0] epsilon;
  input [63:0] q_values; // Q Values untuk 1 State
  output reg [3:0] next_action; // Next Action
  
  wire [3:0] w_next_action; // Next Action Wire
  
  ActionSelector Act(.q_values(q_values),.action(w_next_action), .epsilon(epsilon));
  
  //Delay Action
  always@(posedge clk)
     begin
        next_action = w_next_action;
     end
  
endmodule
