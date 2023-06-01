module memoria (clk, aluresult2, rs2, reddataM, memwrite, memread, immediate, mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11, mem12, mem13, mem14, mem15, mem16, mem17, mem18, mem19, mem20, mem21, mem22, mem23, mem24, mem25, mem26, mem27, mem28, mem29, mem30, mem31, estado);
    input wire clk;
    input [2:0] estado;
    input [31:0] aluresult2;
    input [4:0] rs2;
    input memwrite;
    input memread;
    input [11:0] immediate;
    output reg [31:0] reddataM;
    output reg [31:0] mem0, mem1, mem2, mem3, mem4, mem5, mem6, mem7, mem8, mem9, mem10, mem11;
    output reg [31:0] mem12, mem13, mem14, mem15, mem16, mem17, mem18, mem19, mem20, mem21, mem22, mem23; 
    output reg [31:0] mem24, mem25, mem26, mem27, mem28, mem29, mem30, mem31;
    //reg [31:0] immediateaux;
    reg [31:0] memoria [0:31];

    initial begin
        $readmemb("entrada/memoria.bin", memoria); // iniciando a memoria
        mem0 <= memoria[0];
        mem1 <= memoria[1];
        mem2 <= memoria[2];
        mem3 <= memoria[3];
        mem4 <= memoria[4];
        mem5 <= memoria[5];
        mem6 <= memoria[6];
        mem7 <= memoria[7];
        mem8 <= memoria[8];
        mem9 <= memoria[9];
        mem10 <= memoria[10];
        mem11 <= memoria[11];
        mem12 <= memoria[12];
        mem13 <= memoria[13];
        mem14 <= memoria[14];
        mem15 <= memoria[15];
        mem16 <= memoria[16];
        mem17 <= memoria[17];
        mem18 <= memoria[18];
        mem19 <= memoria[19];
        mem20 <= memoria[20];
        mem21 <= memoria[21];
        mem22 <= memoria[22];
        mem23 <= memoria[23];
        mem24 <= memoria[24];
        mem25 <= memoria[25];
        mem26 <= memoria[26];
        mem27 <= memoria[27];
        mem28 <= memoria[28];
        mem29 <= memoria[29];
        mem30 <= memoria[30];
        mem31 <= memoria[31];
    end

    always @(posedge clk) begin
        //immediateaux <= immediate / 4;
        if(estado == 3'b011) begin
            if(memwrite == 1'b1) begin
                memoria[aluresult2] <= rs2;
            end
            if(memread == 1'b1) begin
                reddataM <= memoria[aluresult2];
            end
            mem0 <= memoria[0];
            mem1 <= memoria[1];
            mem2 <= memoria[2];
            mem3 <= memoria[3];
            mem4 <= memoria[4];
            mem5 <= memoria[5];
            mem6 <= memoria[6];
            mem7 <= memoria[7];
            mem8 <= memoria[8];
            mem9 <= memoria[9];
            mem10 <= memoria[10];
            mem11 <= memoria[11];
            mem12 <= memoria[12];
            mem13 <= memoria[13];
            mem14 <= memoria[14];
            mem15 <= memoria[15];
            mem16 <= memoria[16];
            mem17 <= memoria[17];
            mem18 <= memoria[18];
            mem19 <= memoria[19];
            mem20 <= memoria[20];
            mem21 <= memoria[21];
            mem22 <= memoria[22];
            mem23 <= memoria[23];
            mem24 <= memoria[24];
            mem25 <= memoria[25];
            mem26 <= memoria[26];
            mem27 <= memoria[27];
            mem28 <= memoria[28];
            mem29 <= memoria[29];
            mem30 <= memoria[30];
            mem31 <= memoria[31];
        end
    end
    
endmodule