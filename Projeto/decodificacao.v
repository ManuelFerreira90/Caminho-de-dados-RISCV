module decod (saida, opcode, rd, rs1, rs2, funct3, funct7, immediate, tipo);
    //input wire clock,
    input wire [31:0] saida;
    output reg [6:0] opcode;
    output reg [5:0] rd;
    output reg [5:0] rs1;
    output reg [5:0] rs2;
    output reg [3:0] funct3;
    output reg [6:0] funct7;
    output reg [11:0] immediate; 
    output reg [3:0] tipo;

    always @(*) begin
    opcode <= saida [6:0];
    case (opcode[6:4]) 
      3'b000: begin //formato i
        rd <= saida[11:7];
        rs1 <= saida[19:15];
        funct3 <= saida[14:12];
        immediate <= saida[31:20];
        tipo <= 3'b000;
      end
      3'b010: begin //formato s
        immediate <= {saida[31:25], saida[11:7]};
        rs1 <= saida[19:15];
        rs2 <= saida[24:20];
        funct3 <= saida[14:12];
        tipo <= 3'b010;
      end
      3'b011: begin //formato r
        funct7 <= saida[31:25];
        rs2 <= saida[24:20];
        rs1 <= saida[19:15];
        rd <= saida[11:7];
        funct3 <= saida[14:12];
        tipo <= 3'b011;
      end 
      3'b110: begin //formato sb
        immediate <= {saida[31:25], saida[11:7]};
        rs1 <= saida[19:15];
        rs2 <= saida[24:20];
        funct3 <= saida[14:12];
        tipo <= 3'b110;
      end 
    endcase
  end

endmodule