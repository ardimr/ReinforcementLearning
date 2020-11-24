module PolicyGenerator(clk, q_values, epsilon, current_action);
  input clk; // Clock
  input [15:0] epsilon;
  input [63:0] q_values; // Q Values untuk 1 State
  output reg [3:0] current_action; // Next Action
  
  wire [3:0] w_current_action; // Next Action Wire
  
  ActionSelector Act(.q_values(q_values), .epsilon(epsilon), .action(w_current_action));
  
  //Delay Action
  always@(posedge clk)
     begin
        current_action = w_current_action;
     end
  
endmodule
