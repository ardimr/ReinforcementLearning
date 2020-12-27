module BarrelShifter(op, shift_mag, result);
  input [15:0] op;
  input [3:0] shift_mag;
  output [15:0] result;
  wire [15:0] mux1_out;
  wire [15:0] mux2_out;
  wire [15:0] mux3_out;
  
  mux mux_instance1(shift_mag[0], op, (op >> 1), mux1_out);
  mux mux_instance2(shift_mag[1], mux1_out, (mux1_out >> 2), mux2_out);
  mux mux_instance3(shift_mag[2], mux2_out, (mux2_out >> 4), mux3_out);
  mux mux_instance4(shift_mag[3], mux3_out, (mux3_out >> 8), result);
  
endmodule
