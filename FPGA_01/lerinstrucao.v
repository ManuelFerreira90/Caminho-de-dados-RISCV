module lerinstrucao (instrucao, pc, clk, estado, rst);
    input wire [31:0] pc;
    input clk, rst;
    input wire [3:0] estado;
    output reg [31:0] instrucao;
    // alterar confome a quantidade de linhas do arquivo
    reg [31:0] instrucoes [0:10]; // Memória de instruções

    // Atualizando instrução a cada ciclo de clock
    always @(posedge clk) begin
        if(rst == 1'b1) begin
            instrucoes [0] <= 32'b00000000000000001010000000000011;
            instrucoes [1] <= 32'b00000000001000011010001000100011;
            instrucoes [2] <= 32'b01000000010100101000001010110011;
            instrucoes [3] <= 32'b00000000011000110100001100110011;
            instrucoes [4] <= 32'b00000000101000101000001010010011; //10
				//instrucoes [4] <= 32'b00000000011100101000001010010011;
            instrucoes [5] <= 32'b00000000010101000101010000110011;
            instrucoes [6] <= 32'b00000000000000000000010001100011;
            instrucoes [7] <= 32'b00000000010100101000001010110011;
				instrucoes [8] <= 32'b00000010011000101000001010010011; //38
				instrucoes [9] <= 32'b00000000001000101000001010010011; //2
				instrucoes [10] <= 32'b00000000000000000000000000000000;
        end
        if(estado == 4'b0000)begin
            instrucao <= instrucoes[pc];
        end
    end

endmodule

