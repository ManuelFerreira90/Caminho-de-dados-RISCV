module lerinstrucao (instrucao, PC, clk, estado);
    input wire [31:0] PC;
    input wire clk;
    input wire [2:0] estado;
    output reg [31:0] instrucao;
    reg [31:0] instrucoes [0:10]; // Memória de instruções

    initial begin
        $readmemb("entrada/assembler.bin", instrucoes); // Lendo instruções em formato binário
        instrucao <= instrucoes[PC];
    end

    always @(posedge clk) begin
        if(estado == 3'b000)begin
            instrucao <= instrucoes[PC];
        end
    end

endmodule

