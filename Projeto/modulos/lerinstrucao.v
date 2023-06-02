module lerinstrucao (instrucao, PC, clk, estado);
    input wire [31:0] PC;
    input wire clk;
    input wire [3:0] estado;
    output reg [31:0] instrucao;
    reg [31:0] instrucoes [0:14]; // Memória de instruções

    initial begin
        $readmemb("entrada/assembler.bin", instrucoes); // Lendo instruções em formato binário
        instrucao <= instrucoes[PC];
    end

    always @(posedge clk) begin
        if(estado == 4'b0000)begin
            instrucao <= instrucoes[PC];
        end
    end

endmodule

