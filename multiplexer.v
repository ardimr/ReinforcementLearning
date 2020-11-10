//multiplexer 16 to 1

module multiplexer(sel, d0, d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15, dout);
  input[3:0] sel;
  input[15:0] d0, d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11,d12,d13,d14,d15; 

  output [15:0] dout;

  assign dout = (sel == 4'd0) ? d0 :
                (sel == 4'd1) ? d1 :           
                (sel == 4'd2) ? d2 : 
                (sel == 4'd3) ? d3 :
                (sel == 4'd4) ? d4 :
                (sel == 4'd5) ? d5 :
                (sel == 4'd6) ? d6 :
                (sel == 4'd7) ? d7 :
                (sel == 4'd8) ? d8 :
                (sel == 4'd9) ? d9 :
                (sel == 4'd10) ? d10 :
                (sel == 4'd11) ? d11 : 
                (sel == 4'd12) ? d12 :
                (sel == 4'd13) ? d13 :
                d14;
     
endmodule

