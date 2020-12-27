module ActionSelector (clk, start, q_values, epsilon, action);
  
  input clk, start;
  input [63:0] q_values; // Values of Q_Table at row equal to current state
  input [15:0] epsilon; // epsilon = 1 - episode/301
  output reg [3:0] action; // action that will be taken
  
  reg [15:0] max_1;
  reg [15:0] max_2;
  reg [14:0] max_value;
  wire [15:0] random;
  wire [15:0] random_value;
  
  Randomizer randomizer_1 (16'b0011110011000011,start,clk,random);
  Randomizer randomizer_2 (16'b1100001100111100,start,clk,random_value);
  
  //assign max_1 = (q_values[14:0] >= q_values[30:16]) ? q_values[14:0] : q_values[30:16];
  //assign max_2 = (q_values[46:32] >= q_values[62:48]) ? q_values[46:32] : q_values[62:48];
  //assign max_value = (max_1 >= max_2) ? max_1 : max_2;
  
  
  always @(*) begin
  if((q_values[15] == 1'b1)&&(q_values[31] == 1'b0)) begin
	max_1=q_values[31:16];
  end
  else if((q_values[15] == 1'b0)&&(q_values[31] == 1'b1)) begin
	max_1=q_values[15:0];
  end
  else begin 
	max_1 = (q_values[14:0] >= q_values[30:16]) ? q_values[15:0] : q_values[31:16];
  end

  if((q_values[47] == 1'b1)&&(q_values[63] == 1'b0)) begin
	max_2=q_values[63:48];
  end
  else if((q_values[47] == 1'b0)&&(q_values[63] == 1'b1)) begin
	max_2=q_values[47:32];
  end
  else begin 
	max_2 = (q_values[46:32] >= q_values[62:48]) ? q_values[47:32] : q_values[63:48];
  end

  
  if((max_1[15] == 1'b1)&&(max_2[15] == 1'b0)) begin
	max_value=max_2[14:0];
  end
  else if((max_1[15] == 1'b0)&&(max_2[15] == 1'b1)) begin
	max_value=max_1[14:0];
  end
  else begin 
	max_value = (max_2[14:0] >= max_1[14:0]) ? max_2[14:0] : max_1[14:0];
  end

    if (epsilon <= random) begin
		if (q_values[14:0] == max_value) begin
			action = 4'd1;
		end
		else if (q_values[30:16] == max_value) begin
			action = 4'd2;
		end
		else if (q_values[46:32] == max_value) begin
			action = 4'd3;
		end
		else if (q_values[62:48] == max_value) begin
			action = 4'd4;
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
