module ler (saida);
    //input [31:0] instrucao;
    output reg [31:0] saida;
    reg [31:0] memory [0:0];

    initial begin
        $readmemb("assemble.bin", memory); // Lendo instruções em formato binário
        //$display("Instrucao %0d: %b", i+1, memory[i]);
        saida <= memory[0];
    end
    
    //assign saida = memory;

endmodule

