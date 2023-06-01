module somapc (PC, clk, pcsrc, immediate, estado);
  input wire clk;
  input wire [2:0] estado;
  input pcsrc;
  input [11:0] immediate;
  output reg [31:0] PC;

  initial begin
      PC <= 0;
  end

  always @(posedge clk) begin
    if(estado == 3'b100) begin
      case (pcsrc)
          1'b0: PC <= PC + 1;
          1'b1: PC <= PC + immediate;
      endcase
      PC <= PC + 1;
    end
  end

endmodule

