`include "LerInstrucoes.v"
`include "decodificacao.v"

//lw sw sub xor addi srl beq

module teste;
    wire [31:0] instrucao;
    wire [6:0] opcode;
    wire [4:0] rd;
    wire [4:0] rs1;
    wire [4:0] rs2;
    wire [2:0] funct3;
    wire [6:0] funct7;
    wire [11:0] immediate;
    wire [2:0] tipo;
    input wire PC;

    //sinais de controle
    wire regiwrite;
    wire [1:0] aluop;
    wire [3:0] alucontrol;
    wire branch;
    wire memwrite;
    wire memread;
    wire aluresult1;
    wire aluresult2;
    

    //pameter
    parameter IF = 3'b000, //posição instrução
              ID = 3'b001, //leitura
              EX = 3'b010, //execução
              MEM = 3'b011, //leitura memoria
              WB = 3'b100; //escrita
              FIM = 3'b110; //finish


    // //maquina de estados
    reg [2:0] estado

    inital begin
        estado <= IF;
        regwrite <= 1'b0;
        aluop <= 3'b000;
        branch <= 1'b0;
        memwrite <= 1'b0;
        memread <= 1'b0
        PC <= 1'b0;
    end

    // ler leitura(.instrucao(instrucao), .PC(PC));
    // decod decodificar(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo));

    //  initial begin
    //      #1
    //      $display("Instrucao : %b", instrucao);
    //      case (tipo)
    //       3'b000 : $display("formato i");
    //       3'b010 : $display("formato s");
    //       3'b011 : $display("formato r");
    //       3'b110 : $display("formato sb");
    //      endcase
    //      $finish; 
    //  end

    always @(*) begin
        case(estado)
        3'b000 : begin
            
        end

        endcase
     
    end

endmodule