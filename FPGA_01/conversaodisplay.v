module conversaodisplay (dezenapc, unidadepc, dezenareg, unidadereg, pc, register);
	input [31:0] pc; //program counter
	input [31:0] register; //registrador escolhido para ser mostrado no display
	output [3:0] dezenapc; //dezena do pc
	output [3:0] unidadepc; //unidade do pc
	output [3:0] dezenareg; //dezena do registrador
	output [3:0] unidadereg; //unidade do registrador
	
	assign dezenapc = pc / 10; //divisão inteira para pegar a dezena do pc
	assign unidadepc = pc % 10; //resto da divisão inteira para pegar a unidade do pc
	assign dezenareg = register / 10; //divisão inteira para pegar a dezena do registrador
	assign unidadereg = register % 10; //resto da divisão inteira para pegar a unidade do registrador
	
endmodule