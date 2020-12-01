module PolicyGenerator(clk, start, q_values, epsilon, current_action,next_action);
  input clk; // Clock
  input start;
  input [15:0] epsilon;
  input [63:0] q_values; // Q Values untuk 1 State
  output reg [3:0] current_action; // Next Action
  output [3:0] next_action;

  wire [3:0] w_current_action; // Next Action Wire
  
  ActionSelector Act(.clk(clk),.start(start),.q_values(q_values), .epsilon(epsilon), .action(w_current_action));
  
  assign next_action=w_current_action;

  //Delay Action
  always@(posedge clk)
     begin
        current_action <= w_current_action;
     end
  
endmodule
