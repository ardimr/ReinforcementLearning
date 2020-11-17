module ActionSelector (q_values, action);
  
  input [63:0] q_values; // Values of Q_Table at row equal to current state
  //input [15:0] epsilon; // epsilon = 1 - episode/301
  output reg [3:0] action; // action that will be taken
  
  wire [15:0] max_1;
  wire [15:0] max_2;
  wire [15:0] max_value;
  
  assign max_1 = (q_values[15:0] >= q_values[31:16]) ? q_values[15:0] : q_values[31:16];
  assign max_2 = (q_values[47:32] >= q_values[63:48]) ? q_values[47:32] : q_values[63:48];
  assign max_value = (max_1 >= max_2) ? max_1 : max_2;
  
  always @(*) begin
    if (q_values[15:0] == max_value) begin
      action = 4'd3;
    end
    else if (q_values[31:16] == max_value) begin
      action = 4'd2;
    end
    else if (q_values[47:32] == max_value) begin
      action = 4'd1;
    end
    else if (q_values[63:48] == max_value) begin
      action = 4'd0;
    end
    else begin
      action = 4'd0;
    end
  end
  
endmodule
