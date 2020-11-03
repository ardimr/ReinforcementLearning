module tb_barrel;
  
  reg [15:0] op;
  reg [3:0] shift_mag;
  wire [15:0] result;
  
  BarrelShifter shifter_instance(op, shift_mag, result);
  
  initial begin
    shift_mag = 4'b0001;
    op = 16'b0000000000000001;
    #10;
    shift_mag = 4'b0101;
    op = 16'b0000000000000101;
    #10;
    $stop;
  end
endmodule