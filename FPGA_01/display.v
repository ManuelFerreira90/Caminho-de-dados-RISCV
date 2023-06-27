module display (pc, register, final, display1, display2, display3, display4, display5, clk);
   input [31:0] pc;
	input [31:0] register; //variaveis que indicam o valor do pc e do registrador
   input [3:0] final; //variavel que indica o fim da execução
   input clk;
   //display para os 8bits do PC
   output reg [6:0] display1;
   output reg [6:0] display2;
   //display para os 8bits do Register
   output reg [6:0] display3;
   output reg [6:0] display4;
   //display para sinalizar estado do programa
   output reg [6:0] display5;
	
	//displays em formato Hexadecimal
	always @(posedge clk) begin
			//campo das unidades do pc
			case (pc[3:0])
				4'b0000: display1 <= 7'b1000000; // 0
				4'b0001: display1 <= 7'b1111001; // 1
				4'b0010: display1 <= 7'b0100100; // 2
				4'b0011: display1 <= 7'b0110000; // 3
				4'b0100: display1 <= 7'b0011001; // 4
				4'b0101: display1 <= 7'b0010010; // 5
				4'b0110: display1 <= 7'b0000010; // 6
				4'b0111: display1 <= 7'b1111000; // 7
				4'b1000: display1 <= 7'b0000000; // 8
				4'b1001: display1 <= 7'b0010000; // 9
				4'b1010: display1 <= 7'b0001000; // A
				4'b1011: display1 <= 7'b0000011; // B
				4'b1100: display1 <= 7'b1000110; // C
				4'b1101: display1 <= 7'b0100001; // D
				4'b1110: display1 <= 7'b0000110; // E
				4'b1111: display1 <= 7'b0001110; // F
				//default: display1 <= 7'b1111111; // Exibir todos os segmentos acesos para valores inválidos 
			endcase
			//campo das dezenas do pc
			case (pc[7:4])
				4'b0000: display2 <= 7'b1000000; // 0
				4'b0001: display2 <= 7'b1111001; // 1
				4'b0010: display2 <= 7'b0100100; // 2
				4'b0011: display2 <= 7'b0110000; // 3
				4'b0100: display2 <= 7'b0011001; // 4
				4'b0101: display2 <= 7'b0010010; // 5
				4'b0110: display2 <= 7'b0000010; // 6
				4'b0111: display2 <= 7'b1111000; // 7
				4'b1000: display2 <= 7'b0000000; // 8
				4'b1001: display2 <= 7'b0010000; // 9
				4'b1010: display2 <= 7'b0001000; // A
				4'b1011: display2 <= 7'b0000011; // B
				4'b1100: display2 <= 7'b1000110; // C
				4'b1101: display2 <= 7'b0100001; // D
				4'b1110: display2 <= 7'b0000110; // E
				4'b1111: display2 <= 7'b0001110; // F
				//default: display2 <= 7'b1111111; // Exibir todos os segmentos acesos para valores inválidos 
			endcase
			//campo das unidades do registrador
			case (register[3:0])
				4'b0000: display3 <= 7'b1000000; // 0
				4'b0001: display3 <= 7'b1111001; // 1
				4'b0010: display3 <= 7'b0100100; // 2
				4'b0011: display3 <= 7'b0110000; // 3
				4'b0100: display3 <= 7'b0011001; // 4
				4'b0101: display3 <= 7'b0010010; // 5
				4'b0110: display3 <= 7'b0000010; // 6
				4'b0111: display3 <= 7'b1111000; // 7
				4'b1000: display3 <= 7'b0000000; // 8
				4'b1001: display3 <= 7'b0010000; // 9
				4'b1010: display3 <= 7'b0001000; // A
				4'b1011: display3 <= 7'b0000011; // B
				4'b1100: display3 <= 7'b1000110; // C
				4'b1101: display3 <= 7'b0100001; // D
				4'b1110: display3 <= 7'b0000110; // E
				4'b1111: display3 <= 7'b0001110; // F
				//default: display3 <= 7'b1111111; // Exibir todos os segmentos acesos para valores inválidos  
			endcase
			//campo das dezenas do registrador
			case (register[7:4])
				4'b0000: display4 <= 7'b1000000; // 0
				4'b0001: display4 <= 7'b1111001; // 1
				4'b0010: display4 <= 7'b0100100; // 2
				4'b0011: display4 <= 7'b0110000; // 3
				4'b0100: display4 <= 7'b0011001; // 4
				4'b0101: display4 <= 7'b0010010; // 5
				4'b0110: display4 <= 7'b0000010; // 6
				4'b0111: display4 <= 7'b1111000; // 7
				4'b1000: display4 <= 7'b0000000; // 8
				4'b1001: display4 <= 7'b0010000; // 9
				4'b1010: display4 <= 7'b0001000; // A
				4'b1011: display4 <= 7'b0000011; // B
				4'b1100: display4 <= 7'b1000110; // C
				4'b1101: display4 <= 7'b0100001; // D
				4'b1110: display4 <= 7'b0000110; // E
				4'b1111: display4 <= 7'b0001110; // F
				//default: display4 <= 7'b1111111; // Exibir todos os segmentos acesos para valores inválidos
			endcase
			//display para indicar se todas as intruções foram lidas
			case (final)
				4'b0000: display5 <= 7'b1000000; // 0
				4'b0001: display5 <= 7'b1111001; // 1
				4'b0010: display5 <= 7'b0100100; // 2
				4'b0011: display5 <= 7'b0110000; // 3
				4'b0100: display5 <= 7'b0011001; // 4
				4'b0101: display5 <= 7'b0010010; // 5
				4'b0110: display5 <= 7'b0000010; // 6
				4'b0111: display5 <= 7'b1111000; // 7
				4'b1000: display5 <= 7'b0000000; // 8
				4'b1001: display5 <= 7'b0010000; // 9
				4'b1010: display5 <= 7'b0001000; // A
				4'b1011: display5 <= 7'b0000011; // B
				4'b1100: display5 <= 7'b1000110; // C
				4'b1101: display5 <= 7'b0100001; // D
				4'b1110: display5 <= 7'b0000110; // E
				4'b1111: display5 <= 7'b0001110; // F
				//default: display5 <= 7'b1111111; // Exibir todos os segmentos acesos para valores inválidos
			endcase
	end

endmodule