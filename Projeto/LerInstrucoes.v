module ler (instrucao,PC);
    //input [31:0] instrucao;
    input wire PC;
    output reg [31:0] instrucao;
    reg [31:0] memory [0:6];

    initial begin
        $readmemb("assembler.bin", memory); // Lendo instruções em formato binário
        //$display("Instrucao %0d: %b", i+1, memory[i]);
        instrucao <= memory[PC];
    end
    
    //assign instrucao = memory;

endmodule

