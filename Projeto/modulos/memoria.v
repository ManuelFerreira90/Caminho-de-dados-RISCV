module memoria (clk, aluresult2, rs2, reddataM, memwrite, memread, immediate);
    input wire clk;
    input [31:0] aluresult2;
    input [4:0] rs2;
    input memwrite;
    input memread;
    input [11:0] immediate;
    output reg [31:0] reddataM;
    reg [31:0] immediateaux;
    reg [31:0] memoria [0:31];

    initial begin
        $readmemb("entrada/memoria.bin", memoria); // iniciando a memoria
    end

    always @(posedge clk) begin
        immediateaux <= immediate / 4;
        if(memwrite == 1'b1) begin
            memoria[aluresult2] <= rs2;
        end
        if(memread == 1'b1) begin
            reddataM <= memoria[aluresult2];
        end
    end
    
endmodule