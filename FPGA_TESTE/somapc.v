module somapc (pc, clk, pcsrc, immediate, estado, negativo, rst);
  input clk, rst;
  input wire [3:0] estado;
  input pcsrc;
  input [11:0] immediate;
  input negativo;
  output reg [31:0] pc; // posição da próxima instrução

  // incrementa o PC
  always @(posedge clk) begin
    //rst ativo para inicialização do PC
    if(rst == 1'b0) begin
      pc <= 1'b0; // inicializa o pc
    end
    if(estado == 4'b1000) begin
      // sinais de controle para o pc saber se vai ser incrementado com imeadiato ou não
      case (pcsrc)
          1'b0: begin
            pc <= pc + 1; // proxima instrução
          end
          1'b1: begin
            // sinal de controle para saber se o imediato é negativo ou não
            if(negativo == 1'b1)begin
              pc <= pc - (immediate/4); // caso haja desvio
            end
            else begin
              pc <= pc + (immediate/4); // caso haja desvio
            end
          end
      endcase
    end
  end

endmodule