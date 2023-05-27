`include "LerInstrucoes.v"
`include "decodificacao.v"

module teste;
    //wire [6:0] instrucao;
    wire [31:0] saida;
    wire [6:0] opcode;
    wire [5:0] rd;
    wire [5:0] rs1;
    wire [5:0] rs2;
    wire [3:0] funct3;
    wire [6:0] funct7;
    wire [11:0] immediate;
    wire [3:0] tipo;

    ler leitura(.saida(saida));
    decod decodificar(.saida(saida), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo));

    initial begin
        #1
        $display("Instrucao : %b", saida);
        case (tipo)
         3'b000 : $display("formato i");
         3'b010 : $display("formato s");
         3'b011 : $display("formato r");
         3'b110 : $display("formato sb");
        endcase
        $finish; 
    end

endmodule