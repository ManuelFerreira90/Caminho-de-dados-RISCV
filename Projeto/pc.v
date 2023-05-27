module calcpc (PC);
    output reg PC;

  always @(*) begin
    PC <= PC + 1;
  end


endmodule
