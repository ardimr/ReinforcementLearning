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
        output [15:0] out);

  wire [15:0] a;
  wire [15:0] b;
  wire [15:0] c;
  wire [15:0] d;
  wire [15:0] e;
  wire [15:0] f;
  wire [15:0] g;

  assign a = (Q_Act1>=Q_Act2)? Q_Act1 : Q_Act2;
  assign b = (Q_Act3>=Q_Act4)? Q_Act3 : Q_Act4;
  assign c = (Q_Act5>=Q_Act6)? Q_Act5 : Q_Act6;
  assign d = (Q_Act7>=Q_Act8)? Q_Act7 : Q_Act8;
  assign e = (a>=b)? a : b;
  assign f = (c>=d)? c : d;
  assign g = (e>=f)? e : f;
  assign out = (g>=Q_Act9)? g : Q_Act9;

endmodule
