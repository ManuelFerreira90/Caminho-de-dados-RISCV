module main(clk, rst, display1, display2, display3, display4, display5, LCD_en, LCD_rw, LCD_rs, LCD_blon, LCD_data);

    input clk, rst;

    //IF - para ler a instrução
    wire [31:0] instrucao;
    wire [6:0] opcode;
    wire [4:0] rd; // registrador de destino
    wire [4:0] rs1; // registrador de leitura 1
    wire [4:0] rs2; // registrador de leitura 2
    wire [2:0] funct3; 
    wire [6:0] funct7;
    wire [11:0] immediate;
    wire [2:0] tipo; // tipo da instrução
    wire [31:0] pc; // posição para ler a instrução
    wire negativo; // usado para quando o immediate é negativo

    //ID - para ler os registradores
    wire [31:0] readdata1R; //R para indicar que pertence ao banco de registradores
    wire [31:0] readdata2R; //R para indicar que pertence ao banco de registradores
    wire [31:0] writedataR; //R para indicar que pertence ao banco de registradores
    //registradores de x0 a x31
    wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11;
    wire [31:0] reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23; 
    wire [31:0] reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;

    //EX - para executar a instrução
    //resultado da alu
    wire aluresult1;
    wire [31:0] aluresult2;

    //MEM - para ler/escrever na memoria
    wire [31:0] reddataM; //M para indicar que pertence a memoria
    //campos da memoria
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

    //display
    //display 1 e 2 para mostrar os 8 bits menos significativos do pc
	output [6:0] display1; 
	output [6:0] display2;
    //display 3 e 4 para mostrar os 8 bits menos significativos do pc
    output [6:0] display3;
	output [6:0] display4;
    //display 5 para mostrar o estado da execução 0 para ainda em execução e 1 para finalizado
    output [6:0] display5;
    reg [3:0] final; //indicar final da execução


    //parametros do estado
    parameter IF = 4'b0000, //posição instrução
              ID = 4'b0001, //leitura
              EX = 4'b0010, //execução
              AUX1 = 4'b0101, //auxiliar para atraso
              AUX2 = 4'b1111, //auxiliar para atraso
              MEM = 4'b0011, //leitura memoria
              WB = 4'b0100, //escrita
              AUX3 = 4'b0110, //auxiliar para atraso
              AUX4 = 4'b0111, //auxiliar para atraso
              AUX5 = 4'b1100, //auxiliar para atualização do display
              SUMPC = 4'b1000, //soma pc
              FIM = 4'b1001; //finish


    // //maquina de estados
    reg [3:0] estado;
	 
	//LCD
	output LCD_en, LCD_rw, LCD_rs, LCD_blon;
   output [7:0] LCD_data;
	
	
    //calcular o endereço
    somapc somapc(.pc(pc), .clk(clk), .pcsrc(pcsrc), .immediate(immediate), .estado(estado), 
    .negativo(negativo), .rst(rst));

    //leitura da instrução da instruction memory
    lerinstrucao lerinstrucao(.instrucao(instrucao), .pc(pc), .clk(clk), .estado(estado), .rst(rst));

    //decodificação da instrução
    decodificacao decodificacao(.instrucao(instrucao), .opcode(opcode), .rd(rd), .rs1(rs1), .rs2(rs2), 
    .funct3(funct3), .funct7(funct7), .immediate(immediate), .tipo(tipo), .clk(clk), .estado(estado), 
    .negativo(negativo));

    //gerando os sinais de controle
    sinaisdecontrole sinaisdecontrole(.tipo(tipo), .regiwrite(regiwrite), .memwrite(memwrite), 
    .memread(memread), .alucontrol(alucontrol), .funct3(funct3), .clk(clk), .branch(branch), 
    .memtoreg(memtoreg), .alusrc(alusrc), .funct7(funct7), .estado(estado));

    //leitura e escrita dos registradores
    registradores registradores(.clk(clk), .rs1(rs1), .rs2(rs2), .rd(rd), .readdata1R(readdata1R), 
    .readdata2R(readdata2R), .regiwrite(regiwrite), .memtoreg(memtoreg), .writedataR(writedataR), 
    .reddataM(reddataM),.reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), 
    .reg6(reg6), .reg7(reg7), .reg8(reg8), .reg9(reg9), .reg10(reg10), .reg11(reg11),.reg12(reg12), 
    .reg13(reg13), .reg14(reg14), .reg15(reg15), .reg16(reg16), .reg17(reg17), .reg18(reg18), .reg19(reg19), 
    .reg20(reg20), .reg21(reg21), .reg22(reg22), .reg23(reg23), .reg24(reg24), .reg25(reg25), .reg26(reg26), 
    .reg27(reg27), .reg28(reg28), .reg29(reg29), .reg30(reg30), .reg31(reg31), .estado(estado), .rst(rst));

    //execução da alu
    alu alu(.clk(clk), .readdata1R(readdata1R), .readdata2R(readdata2R), .alusrc(alusrc), 
    .alucontrol(alucontrol), .immediate(immediate), .aluresult1(aluresult1), .aluresult2(aluresult2), 
    .pcsrc(pcsrc), .branch(branch), .estado(estado), .negativo(negativo));

    //leitura e escrita da memoria
    memoria memoria(.clk(clk), .aluresult2(aluresult2), .readdata2R(readdata2R), .reddataM(reddataM), 
    .memwrite(memwrite), .memread(memread), .immediate(immediate), .mem0(mem0), .mem1(mem1), .mem2(mem2), 
    .mem3(mem3), .mem4(mem4), .mem5(mem5), .mem6(mem6), .mem7(mem7), .mem8(mem8), .mem9(mem9), .mem10(mem10), 
    .mem11(mem11),.mem12(mem12), .mem13(mem13), .mem14(mem14), .mem15(mem15), .mem16(mem16), .mem17(mem17), 
    .mem18(mem18), .mem19(mem19), .mem20(mem20), .mem21(mem21), .mem22(mem22), .mem23(mem23), .mem24(mem24), 
    .mem25(mem25), .mem26(mem26), .mem27(mem27), .mem28(mem28), .mem29(mem29), .mem30(mem30), .mem31(mem31), 
    .estado(estado), .writedataR(writedataR), .rst(rst));

    //modulo display
    //no campo .register deve ser colocado o registrador que se deseja mostrar no display
	display display (.pc(pc), .register(reg1), .final(final), .display1(display1), .display2(display2), 
	.display3(display3), .display4(display4), .display5(display5), .clk(clk));
	
	//LCD
	lcdd(.clk(clk), .LCD_data(LCD_data), .LCD_en(LCD_en), .LCD_rw(LCD_rw), .LCD_rs(LCD_rs), .LCD_blon(LCD_blon),
	.rst(rst));
    //maquina de estados
    always @(posedge clk) begin
        // rst ativo para incialização das variáveis
        if(rst == 1'b0)begin
            final <= 1'b0;
            estado <= IF;
        end 
            case(estado)
                IF: begin //estado para leitura da instrução na memória de instruções
                    estado <= ID;
                end
                ID: begin //estado para decodificação da instrução
                    // se a instrução for 0, vai para AUX5 atualiza o display e finaliza
                    if(instrucao != 0)begin
                        estado <= EX; 
                    end
                    else begin
                        estado <= AUX5;
                    end
                end
                EX: begin //estado para execução da ALU
                    estado <= AUX1; 
                end
                AUX1: begin //estado para gerar atraso de 1 ciclo
                    estado <= AUX2; 
                end
                AUX2: begin //estado para gerar atraso de 1 ciclo
                    estado <= MEM; 
                end
                MEM: begin //estado para leiura e escrita na memória
                    estado <= WB; 
                end
                WB: begin //estado para escrever no banco registrador
                    estado <= AUX3;
                end
                AUX3: begin //estado para gerar atraso de 1 ciclo
                    estado <= AUX4;
                end
                AUX4: begin //estado para gerar atraso de 1 ciclo
                    estado <= AUX5;
                end
                AUX5: begin //estado para gerar atraso de 1 ciclo
                    if(instrucao == 0)begin
                        estado <= FIM; //se a instrução for 0, vai para FIM
                    end
                    else begin
                        estado <= SUMPC; //se a instrução for diferente de 0, vai para SUMPC, 
                                        //onde o PC é incrementado
                    end
                end
                SUMPC: begin //estado para incrementar o PC
                    estado <= IF; //vai para IF para buscar a próxima instrução
                end
                FIM : begin //estado final para parar a execução
                    final <= 1'b1; //ativa o sinal final para indicar o fim da execução no display
                end
            endcase
    end

endmodule