module MeuModulo (clk, reset, instr_out);
    input wire clk;
    input reset;
    output reg instr_out;

    reg instr_delayed;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
        instr_delayed <= 1'b0;  // Valor inicial do registrador de atraso
        end else begin
        instr_delayed <= instr_out;  // Valor atrasado da instrução
        end
    end

    // Atraso de um ciclo antes de atribuir o valor a instr_out
    always @(posedge clk) begin
        instr_out <= instr_delayed;
    end

endmodule