module lerinstrucao (instrucao, PC, clk);
    input wire [31:0] PC;
    input wire clk;
    output reg [31:0] instrucao;
    reg [31:0] instrucoes [0:6]; // Memória de instruções

    initial begin
        $readmemb("entrada/assembler.bin", instrucoes); // Lendo instruções em formato binário
        instrucao <= instrucoes[PC];
    end

    always @(posedge clk) begin
        #10
        instrucao <= instrucoes[PC];
    end


endmodule

