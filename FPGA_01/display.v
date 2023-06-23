module display (pc1, pc2, regpart1, regpart2, final, display1, display2, display3, display4, display5, clk, estado);
   input [3:0] pc1; //unidades do pc
   input [3:0] pc2; //dezenas do pc
   input [3:0] regpart1; //unidade do registrador
   input [3:0] regpart2; //dezena do registrador
   input [3:0] final; //variavel que indica o fim da execução
   input clk;
   input [3:0] estado;
   output reg [6:0] display1;
   output reg [6:0] display2;
   output reg [6:0] display3;
   output reg [6:0] display4;
   output reg [6:0] display5;
	
	//displays em formato BCD
	always @(posedge clk) begin
			//campo das unidades do pc
			case (pc1)
						4'b0000: display1 <= 7'b1000000;
						4'b0001: display1 <= 7'b1111001; 
						4'b0010: display1 <= 7'b0100100; 
						4'b0011: display1 <= 7'b0110000; 
						4'b0100: display1 <= 7'b0011001; 
						4'b0101: display1 <= 7'b0010010;
						4'b0110: display1 <= 7'b0000010; 
						4'b0111: display1 <= 7'b1111000; 
						4'b1000: display1 <= 7'b0000000; 
						4'b1001: display1 <= 7'b0010000; 
						default: display1 <= 7'b1111111; 
			endcase
			//campo das dezenas do pc
			case (pc2)
						4'b0000: display2 <= 7'b1000000;
						4'b0001: display2 <= 7'b1111001; 
						4'b0010: display2 <= 7'b0100100; 
						4'b0011: display2 <= 7'b0110000; 
						4'b0100: display2 <= 7'b0011001; 
						4'b0101: display2 <= 7'b0010010;
						4'b0110: display2 <= 7'b0000010; 
						4'b0111: display2 <= 7'b1111000; 
						4'b1000: display2 <= 7'b0000000; 
						4'b1001: display2 <= 7'b0010000; 
						default: display2 <= 7'b1111111; 
			endcase
			//campo das unidades do registrador
			case (regpart1)
						4'b0000: display3 <= 7'b1000000;
						4'b0001: display3 <= 7'b1111001; 
						4'b0010: display3 <= 7'b0100100; 
						4'b0011: display3 <= 7'b0110000; 
						4'b0100: display3 <= 7'b0011001; 
						4'b0101: display3 <= 7'b0010010;
						4'b0110: display3 <= 7'b0000010; 
						4'b0111: display3 <= 7'b1111000; 
						4'b1000: display3 <= 7'b0000000; 
						4'b1001: display3 <= 7'b0010000; 
						default: display3 <= 7'b1111111; 
			endcase
			//campo das dezenas do registrador
			case (regpart2)
						4'b0000: display4 <= 7'b1000000;
						4'b0001: display4 <= 7'b1111001; 
						4'b0010: display4 <= 7'b0100100; 
						4'b0011: display4 <= 7'b0110000; 
						4'b0100: display4 <= 7'b0011001; 
						4'b0101: display4 <= 7'b0010010;
						4'b0110: display4 <= 7'b0000010; 
						4'b0111: display4 <= 7'b1111000; 
						4'b1000: display4 <= 7'b0000000; 
						4'b1001: display4 <= 7'b0010000; 
						default: display4 <= 7'b1111111; 
			endcase
			//display para indicar se todas as intruções foram lidas
			case (final)
						4'b0000: display5 <= 7'b1000000;
						4'b0001: display5 <= 7'b1111001; 
						4'b0010: display5 <= 7'b0100100; 
						4'b0011: display5 <= 7'b0110000; 
						4'b0100: display5 <= 7'b0011001; 
						4'b0101: display5 <= 7'b0010010;
						4'b0110: display5 <= 7'b0000010; 
						4'b0111: display5 <= 7'b1111000; 
						4'b1000: display5 <= 7'b0000000; 
						4'b1001: display5 <= 7'b0010000; 
						default: display5 <= 7'b1111111; 
			endcase
	end

endmodule