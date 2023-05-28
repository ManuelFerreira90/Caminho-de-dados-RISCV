`include "LerInstrucoes.v"
`include "decodificacao.v"
`include "control.v"
`include "pc.v"
`include "clock.v"

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
    wire [31:0] PC;
    wire clk;

    //sinais de controle
    wire regiwrite;
    wire [1:0] aluop;
    wire [3:0] alucontrol;
    wire branch;
    wire memwrite;
    wire memread;
    wire aluresult1;
    wire aluresult2;
    

    //parametros do estado
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

    geraclock geraclk(.clk(clk));
    calcpc resultpc(.PC(PC), .clk(clk));
    ler leitura(.instrucao(instrucao), .PC(PC), .clk(clk));
    decod decodificar(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo), .clk(clk));
    controle controlador(.tipo(tipo), .regiwrite(regiwrite), .aluop(aluop), .memwrite(memwrite), .memread(memread), .alucontrol(alucontrol), .funct3(funct3), .aluresult1(aluresult1), .clk(clk));

    always @(posedge clk or negedge clk) begin
        case(estado)
        IF : begin
            $display("Instrucao : %b", instrucao);
            estado <= ID;
        end
        ID: begin
            case (tipo)
            3'b000 : $display("formato i");
            3'b010 : $display("formato s");
            3'b011 : $display("formato r");
            3'b110 : $display("formato sb");
            endcase
            #1
            $display("sinal de controle");
            $display("regiwrite : %b", regiwrite);
            $display("aluop : %b", aluop);
            $display("memwrite : %b", memwrite);
            $display("memread : %b", memread);
            $display("alucontrol : %b", alucontrol);
            $display("funct3 : %b", funct3);
            $display("aluresult1 : %b", aluresult1);
            $display("PC: %d", PC);
            if(PC < 7) begin
                estado <= IF;
            end
            else begin
                estado <= FIM;
            end
        end
        FIM : begin
            $finish;
        end
        endcase
     
    end


endmodule