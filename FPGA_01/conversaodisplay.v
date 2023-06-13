module conversaodisplay (dezenapc, unidadepc, dezenareg, unidadereg, pc, register);
	input [32:0] pc;
	input [32:0] register;
	output [3:0] dezenapc;
	output [3:0] unidadepc;
	output [3:0] dezenareg;
	output [3:0] unidadereg;
	
	assign dezenapc = pc / 10;
	assign unidadepc = pc % 10;
	assign dezenareg = register / 10;
	assign unidadereg = register % 10;
	
endmodule