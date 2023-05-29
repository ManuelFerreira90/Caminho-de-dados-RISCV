module pc (PC, clk);
  input wire clk;
  output reg [31:0] PC;

  initial begin
      PC <= 0;
  end

  always @(posedge clk) begin
      PC <= PC + 1;
  end

endmodule

