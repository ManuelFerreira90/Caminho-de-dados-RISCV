module somapc (PC, clk, pcsrc, immediate, estado, negativo);
  input wire clk;
  input wire [3:0] estado;
  input pcsrc;
  input [11:0] immediate;
  input negativo;
  output reg [31:0] PC;

  initial begin
      PC <= 0;
  end

  // incrementa o PC
  always @(posedge clk) begin
    if(estado == 4'b1000) begin
      case (pcsrc)
          1'b0: begin
            PC <= PC + 1; // proxima instrução
          end
          1'b1: begin
            if(negativo == 1'b1)begin
              PC <= PC - (immediate/4); // caso haja desvio
            end
            else begin
              PC <= PC + (immediate/4); // caso haja desvio
            end
          end
      endcase
    end
  end

endmodule