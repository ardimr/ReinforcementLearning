module Randomizer(ic,start,clk,q); // main module for lfsr
  input [15:0]ic;
  input start, clk;
  output [15:0]q;
  wire s;
  wire [15:0]lfs;
  assign s=lfs[15]^lfs[10]^lfs[9]^lfs[5];
  dff dff1(lfs[15],start?ic[15]:s,clk);
  dff dff2(lfs[14],start?ic[14]:lfs[15],clk);
  dff dff3(lfs[13],start?ic[13]:lfs[14],clk);
  dff dff4(lfs[12],start?ic[12]:lfs[13],clk);
  dff dff5(lfs[11],start?ic[11]:lfs[12],clk);
  dff dff6(lfs[10],start?ic[10]:lfs[11],clk);
  dff dff7(lfs[9],start?ic[9]:lfs[10],clk);
  dff dff8(lfs[8],start?ic[8]:lfs[9],clk);
  dff dff9(lfs[7],start?ic[7]:lfs[8],clk);
  dff dff10(lfs[6],start?ic[6]:lfs[7],clk);
  dff dff11(lfs[5],start?ic[5]:lfs[6],clk);
  dff dff12(lfs[4],start?ic[4]:lfs[5],clk);
  dff dff13(lfs[3],start?ic[3]:lfs[4],clk);
  dff dff14(lfs[2],start?ic[2]:lfs[3],clk);
  dff dff15(lfs[1],start?ic[1]:lfs[2],clk);
  dff dff16(lfs[0],start?ic[0]:lfs[1],clk);
  assign q=lfs;
endmodule

module dff (Q, D, Clock); //sub module- d flip flop
  output Q;
  input D;
  input Clock;
  reg Q;
  always @(posedge Clock)
  begin
    Q <= D;
  end
endmodule