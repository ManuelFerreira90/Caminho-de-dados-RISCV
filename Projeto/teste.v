`include "LerInstrucoes.v"
`include "decodificacao.v"
`include "control.v"
`include "pc.v"

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

    assign PC = 0;

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
              WB = 3'b100, //escrita
              FIM = 3'b110; //finish


    // //maquina de estados
    reg [2:0] estado;

    initial begin
        estado <= IF;
    end

    ler leitura(.instrucao(instrucao), .PC(PC));
    decod decodificar(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo));
    controle controlador(.tipo(tipo), .regiwrite(regiwrite), .aluop(aluop), .memwrite(memwrite), .memread(memread), .alucontrol(alucontrol), .funct3(funct3), .aluresult1(aluresult1));
    calcpc resultpc(.PC(PC));

    always @(*) begin
        case(estado)
        3'b000 : begin
            #1
            $display("Instrucao : %b", instrucao);
            estado <= ID;
        end
        3'b001 : begin
            #1
            case (tipo)
            3'b000 : $display("formato i");
            3'b010 : $display("formato s");
            3'b011 : $display("formato r");
            3'b110 : $display("formato sb");
            endcase
            $display("sinal de controle");
            $display("regiwrite : %b", regiwrite);
            $display("aluop : %b", aluop);
            $display("memwrite : %b", memwrite);
            $display("memread : %b", memread);
            $display("alucontrol : %b", alucontrol);
            $display("funct3 : %b", funct3);
            $display("aluresult1 : %b", aluresult1);
            $display("PC: %d", PC);
            #2
            if(PC <= 6) begin
                estado <= ID;
            end
            else begin
                estado <= FIM;
            end
        end
        3'b110 : begin
            $finish;
        end
        endcase
     
    end


endmodule