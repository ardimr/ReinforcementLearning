module ActionSelector (q_values, epsilon, action);
  
  input [63:0] q_values; // Values of Q_Table at row equal to current state
  input [15:0] epsilon; // epsilon = 1 - episode/301
  output reg [3:0] action; // action that will be taken
  
  wire [15:0] max_1;
  wire [15:0] max_2;
  wire [15:0] max_value;
  reg [15:0] random = 16'b0000000000000000;
  reg [15:0] random_value = 16'b0000000000000000;
  
  assign max_1 = (q_values[15:0] >= q_values[31:16]) ? q_values[15:0] : q_values[31:16];
  assign max_2 = (q_values[47:32] >= q_values[63:48]) ? q_values[47:32] : q_values[63:48];
  assign max_value = (max_1 >= max_2) ? max_1 : max_2;
  
  
  always @(*) begin
	random[7:0] = {$random} % 8;
	random_value[7:0] = {$random} % 8;
    if (epsilon <= random) begin
		if (q_values[15:0] == max_value) begin
			action = 4'd4;
		end
		else if (q_values[31:16] == max_value) begin
			action = 4'd3;
		end
		else if (q_values[47:32] == max_value) begin
			action = 4'd2;
		end
		else if (q_values[63:48] == max_value) begin
			action = 4'd1;
		end
		else begin
			action = 4'd1;
		end
	end
    else begin
        if (random_value <= 16'b0000000001000000) begin
            action = 4'd1;
		end
        else if (random_value <= 16'b0000000010000000) begin
            action = 4'd2;
		end
        else if (random_value <= 16'b0000000011000000) begin
            action = 4'd3;
		end
        else begin
            action = 4'd4;
        end
    end
  end
  
endmodule
