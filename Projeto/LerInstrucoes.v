module ler (instrucao, PC, clk);
    input wire [31:0] PC;
    input wire clk;
    output reg [31:0] instrucao;
    reg [31:0] memory [0:6];

    initial begin
        $readmemb("assembler.bin", memory); // Lendo instruções em formato binário
        //$display("Instrucao %0d: %b", i+1, memory[i]);
        instrucao <= memory[PC];
    end

    always @(posedge clk) begin
        instrucao <= memory[PC];
    end


endmodule

