//Model 1 register di akhir

module Max_Block (
	input [15:0] Q_Act1, 
        input [15:0] Q_Act2,
	input [15:0] Q_Act3, 
        input [15:0] Q_Act4, 
	input [15:0] Q_Act5, 
        input [15:0] Q_Act6, 
	input [15:0] Q_Act7, 
        input [15:0] Q_Act8,
	input [15:0] Q_Act9,
	input [15:0] Q_Act10, 
	input [15:0] Q_Act11,
  	input [15:0] Q_Act12, 
	input [15:0] Q_Act13,
	input [15:0] Q_Act14, 
	input [15:0] Q_Act15,
	input clk,
        output reg [15:0] out);

  wire [15:0] a;
  wire [15:0] b;
  wire [15:0] c;
  wire [15:0] d;
  wire [15:0] e;
  wire [15:0] f;
  wire [15:0] g;

  wire [15:0] h;
  wire [15:0] i;
  wire [15:0] j;
  wire [15:0] k;

  wire [15:0] l;
  wire [15:0] m;

  wire [15:0] RegOut;
 
  
  assign a = (Q_Act1>=Q_Act2)? Q_Act1 : Q_Act2;
  assign b = (Q_Act3>=Q_Act4)? Q_Act3 : Q_Act4;
  assign c = (Q_Act5>=Q_Act6)? Q_Act5 : Q_Act6;
  assign d = (Q_Act7>=Q_Act8)? Q_Act7 : Q_Act8;
  assign e = (Q_Act9>=Q_Act10)? Q_Act9 : Q_Act10;
  assign f = (Q_Act11>=Q_Act12)? Q_Act11 : Q_Act12;
  assign g = (Q_Act13>=Q_Act14)? Q_Act13 : Q_Act14;

  assign h = (a>=b)? a : b;
  assign i = (c>=d)? c : d;
  assign j = (e>=f)? e : f;
  assign k = (g>=Q_Act15)? g : Q_Act15;

  assign l = (h>=i)? h : i;
  assign m = (j>=k)? j : k;	

  assign RegOut = (l>=m)? l : m;

  always@(posedge clk) begin
  	out=RegOut;
  end

endmodule
