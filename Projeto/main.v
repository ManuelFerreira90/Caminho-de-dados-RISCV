`include "modulos/lerinstrucao.v"
`include "modulos/decodificacao.v"
`include "modulos/sinaisdecontrole.v"
`include "modulos/somapc.v"
`include "modulos/clock.v"
`include "modulos/registradores.v"
`include "modulos/alu.v"
`include "modulos/memoria.v"

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
    wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11;
    wire [31:0] reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23; 
    wire [31:0] reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;

    //EX
    wire [31:0] aluresult1;
    wire [31:0] aluresult2;

    //MEM
    wire [31:0] reddataM; //M para indicar que pertence a memoria
    wire [31:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11;
    wire [31:0] mem12, mem13, mem14, mem15, mem16, mem17, mem18, mem19, mem20, mem21, mem22, mem23; 
    wire [31:0] mem24, mem25, mem26, mem27, mem28, mem29, mem30, mem31;

    //sinais de controle
    wire regiwrite;
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

    clock clock(.clk(clk));
    somapc somapc(.PC(PC), .clk(clk), .pcsrc(pcsrc), .immediate(immediate));
    lerinstrucao lerinstrucao(.instrucao(instrucao), .PC(PC), .clk(clk));
    decodificacao decodificacao(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo), .clk(clk));
    sinaisdecontrole sinaisdecontrole(.tipo(tipo), .regiwrite(regiwrite), .memwrite(memwrite), .memread(memread), .alucontrol(alucontrol), .funct3(funct3), .clk(clk), .branch(branch), .memtoreg(memtoreg), .alusrc(alusrc));
    registradores registradores(.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .readdata1R(readdata1R), .readdata2R(readdata2R), .regiwrite(regiwrite), .memtoreg(memtoreg), .aluresult2(aluresult2), .reddataM(reddataM),.reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), .reg6(reg6), .reg7(reg7), .reg8(reg8), .reg9(reg9), .reg10(reg10), .reg11(reg11),.reg12(reg12), .reg13(reg13), .reg14(reg14), .reg15(reg15), .reg16(reg16), .reg17(reg17), .reg18(reg18), .reg19(reg19), .reg20(reg20), .reg21(reg21), .reg22(reg22), .reg23(reg23), .reg24(reg24), .reg25(reg25), .reg26(reg26), .reg27(reg27), .reg28(reg28), .reg29(reg29), .reg30(reg30), .reg31(reg31));
    alu alu(.clk(clk), .readdata1R(readdata1R), .readdata2R(readdata2R), .alusrc(alusrc), .alucontrol(alucontrol), .immediate(immediate), .aluresult1(aluresult1), .aluresult2(aluresult2), .pcsrc(pcsrc), .branch(branch));
    memoria memoria(.clk(clk), .aluresult2(aluresult2), .rs2(rs2), .reddataM(reddataM), .memwrite(memwrite), .memread(memread), .immediate(immediate), .mem0(mem0), .mem1(mem1), .mem2(mem2), .mem3(mem3), .mem4(mem4), .mem5(mem5), .mem6(mem6), .mem7(mem7), .mem8(mem8), .mem9(mem9), .mem10(mem10), .mem11(mem11),.mem12(mem12), .mem13(mem13), .mem14(mem14), .mem15(mem15), .mem16(mem16), .mem17(mem17), .mem18(mem18), .mem19(mem19), .mem20(mem20), .mem21(mem21), .mem22(mem22), .mem23(mem23), .mem24(mem24), .mem25(mem25), .mem26(mem26), .mem27(mem27), .mem28(mem28), .mem29(mem29), .mem30(mem30), .mem31(mem31));


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