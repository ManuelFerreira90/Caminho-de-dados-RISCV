module lerinstrucao (instrucao, PC, clk);
    input wire [31:0] PC;
    input wire clk;
    output reg [31:0] instrucao;
    reg [31:0] instrucoes [0:11]; // Memória de instruções

    initial begin
        $readmemb("entrada/teste.bin", instrucoes); // Lendo instruções em formato binário
        instrucao <= instrucoes[PC];
    end

    always @(posedge clk) begin
        instrucao <= instrucoes[PC];
    end


endmodule

