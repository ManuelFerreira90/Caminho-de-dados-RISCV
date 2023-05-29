`include "modulos/lerinstrucao.v"
`include "modulos/decodificacao.v"
`include "modulos/controle.v"
`include "modulos/pc.v"
`include "modulos/clock.v"

//lw sw sub xor addi srl beq

module main;
    //IF
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

    //ID
    wire [31:0] readdata1R; //R para indicar que pertence ao banco de registradores
    wire [31:0] readdata2R; //R para indicar que pertence ao banco de registradores
    wire [31:0] writedata;

    //EX
    wire [31:0] aluresult1;
    wire [31:0] aluresult2;

    //MEM
    wire [31:0] reddataM; //M para indicar que pertence a memoria

    //sinais de controle
    wire regiwrite;
    wire [1:0] aluop;
    wire [3:0] alucontrol;
    wire branch;
    wire memwrite;
    wire memread;
    wire pcsrc;
    wire memtoreg;
    wire alusrc;


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
        $dumpfile("wavefile.vcd");
        $dumpvars;

        estado <= IF;
    end

    clock geraclk(.clk(clk));
    pc somapc(.PC(PC), .clk(clk));
    lerinstrucao leitura(.instrucao(instrucao), .PC(PC), .clk(clk));
    decodificacao decodificar(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo), .clk(clk));
    controle controlador(.tipo(tipo), .regiwrite(regiwrite), .aluop(aluop), .memwrite(memwrite), .memread(memread), .alucontrol(alucontrol), .funct3(funct3), .clk(clk), .branch(branch), .memtoreg(memtoreg), .alusrc(alusrc));

    always @(posedge clk) begin
        case(estado)
        IF : begin
            estado <= ID;
        end
        ID: begin
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