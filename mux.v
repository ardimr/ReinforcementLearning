module mux (sel, op1, op2, result);
  
  input sel;
  input [15:0] op1;
  input [15:0] op2;
  
  output [15:0] result;
   
  assign result = (sel == 1'b0) ? op1 : op2;
endmodule
