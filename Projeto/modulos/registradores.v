module registradores (clk, rs1, rs2, rd, readdata1R, readdata2R, regiwrite, memtoreg, aluresult2, reddataM, reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31, estado);
    input wire clk;
    input [2:0] estado;
    input [4:0] rs1;
    input [4:0] rs2;
    input [4:0] rd;
    input regiwrite;
    input memtoreg;
    input [31:0] aluresult2;
    input [31:0] reddataM;
    output reg [31:0] readdata1R;
    output reg [31:0] readdata2R;
    output reg [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11;
    output reg [31:0] reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23; 
    output reg [31:0] reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;
    reg [31:0] bancoregistradores [0:31];

    initial begin
        $readmemb("entrada/registradores.bin", bancoregistradores); // Lendo registradores
        reg0 <= bancoregistradores[0];
        reg1 <= bancoregistradores[1];
        reg2 <= bancoregistradores[2];
        reg3 <= bancoregistradores[3];
        reg4 <= bancoregistradores[4];
        reg5 <= bancoregistradores[5];
        reg6 <= bancoregistradores[6];
        reg7 <= bancoregistradores[7];
        reg8 <= bancoregistradores[8];
        reg9 <= bancoregistradores[9];
        reg10 <= bancoregistradores[10];
        reg11 <= bancoregistradores[11];
        reg12 <= bancoregistradores[12];
        reg13 <= bancoregistradores[13];
        reg14 <= bancoregistradores[14];
        reg15 <= bancoregistradores[15];
        reg16 <= bancoregistradores[16];
        reg17 <= bancoregistradores[17];
        reg18 <= bancoregistradores[18];
        reg19 <= bancoregistradores[19];
        reg20 <= bancoregistradores[20];
        reg21 <= bancoregistradores[21];
        reg22 <= bancoregistradores[22];
        reg23 <= bancoregistradores[23];
        reg24 <= bancoregistradores[24];
        reg25 <= bancoregistradores[25];
        reg26 <= bancoregistradores[26];
        reg27 <= bancoregistradores[27];
        reg28 <= bancoregistradores[28];
        reg29 <= bancoregistradores[29];
        reg30 <= bancoregistradores[30];
        reg31 <= bancoregistradores[31];
    end

    always @(posedge clk) begin
        if((estado == 3'b010) || (estado == 3'b101)) begin // Estado de execução
            readdata1R <= bancoregistradores[rs1];
            readdata2R <= bancoregistradores[rs2];
            case (regiwrite)
                1'b1: begin
                    case (memtoreg)
                        1'b1: begin
                            bancoregistradores[rd] <= reddataM;
                        end
                        1'b0: begin
                            bancoregistradores[rd] <= aluresult2;
                        end
                    endcase
                end 
            endcase
            reg0 <= bancoregistradores[0];
            reg1 <= bancoregistradores[1];
            reg2 <= bancoregistradores[2];
            reg3 <= bancoregistradores[3];
            reg4 <= bancoregistradores[4];
            reg5 <= bancoregistradores[5];
            reg6 <= bancoregistradores[6];
            reg7 <= bancoregistradores[7];
            reg8 <= bancoregistradores[8];
            reg9 <= bancoregistradores[9];
            reg10 <= bancoregistradores[10];
            reg11 <= bancoregistradores[11];
            reg12 <= bancoregistradores[12];
            reg13 <= bancoregistradores[13];
            reg14 <= bancoregistradores[14];
            reg15 <= bancoregistradores[15];
            reg16 <= bancoregistradores[16];
            reg17 <= bancoregistradores[17];
            reg18 <= bancoregistradores[18];
            reg19 <= bancoregistradores[19];
            reg20 <= bancoregistradores[20];
            reg21 <= bancoregistradores[21];
            reg22 <= bancoregistradores[22];
            reg23 <= bancoregistradores[23];
            reg24 <= bancoregistradores[24];
            reg25 <= bancoregistradores[25];
            reg26 <= bancoregistradores[26];
            reg27 <= bancoregistradores[27];
            reg28 <= bancoregistradores[28];
            reg29 <= bancoregistradores[29];
            reg30 <= bancoregistradores[30];
            reg31 <= bancoregistradores[31];
        end
    end
    
endmodule