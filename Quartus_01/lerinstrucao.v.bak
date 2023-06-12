module lerinstrucao (instrucao, PC, clk, estado);
    input wire [31:0] PC;
    input wire clk;
    input wire [3:0] estado;
    output reg [31:0] instrucao;
    // alterar confome o tamanho do arquivo assembler.bin
    reg [31:0] instrucoes [0:3]; // Memória de instruções

    // Lendo instruções do arquivo assembler.bin
    initial begin
        $readmemb("entrada/assembler.bin", instrucoes); // Lendo instruções em formato binário
        instrucao <= instrucoes[PC];
    end

    // Atualizando instrução a cada ciclo de clock
    always @(posedge clk) begin
        if(estado == 4'b0000)begin
            instrucao <= instrucoes[PC];
        end
    end

endmodule

