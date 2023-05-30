module registradores (clk, rs1, rs2, rd, writedataR, readdata1R, readdata2R, regiwrite);
    input wire clk;
    input [4:0] rs1;
    input [4:0] rs2;
    input [4:0] rd;
    input regiwrite;
    input [31:0] writedataR;
    output reg [31:0] readdata1R;
    output reg [31:0] readdata2R;
    reg [31:0] memoriaderegistradores [0:31];

    initial begin
        $readmemb("entrada/registradores.bin", memoriaderegistradores); // Lendo registradores
    end

    always @(posedge clk) begin
        readdata1R <= memoriaderegistradores[rs1];
        readdata2R <= memoriaderegistradores[rs2];
        if(regiwrite == 1'b1) begin
            memoriaderegistradores[rd] <= writedataR;
        end
    end
    
endmodule