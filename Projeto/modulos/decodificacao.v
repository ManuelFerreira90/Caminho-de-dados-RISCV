module decodificacao (instrucao, opcode, rd, rs1, rs2, funct3, funct7, immediate, tipo, clk, estado);
    input wire [31:0] instrucao;
    input wire clk;
    input wire [2:0] estado;
    output reg [6:0] opcode;
    output reg [4:0] rd;
    output reg [4:0] rs1;
    output reg [4:0] rs2;
    output reg [2:0] funct3;
    output reg [6:0] funct7;
    output reg [11:0] immediate; 
    output reg [2:0] tipo;

    always @(posedge clk) begin
      if(estado == 3'b001)begin
        opcode <= instrucao [6:0];
        case (opcode[6:4]) 
          3'b000: begin //formato i
            rd <= instrucao[11:7];
            rs1 <= instrucao[19:15];
            funct3 <= instrucao[14:12];
            immediate <= instrucao[31:20];
            tipo <= 3'b000;
          end
          3'b010: begin //formato s
            immediate <= {instrucao[31:25], instrucao[11:7]};
            rs1 <= instrucao[19:15];
            rs2 <= instrucao[24:20];
            funct3 <= instrucao[14:12];
            tipo <= 3'b010;
          end
          3'b011: begin //formato r
            funct7 <= instrucao[31:25];
            rs2 <= instrucao[24:20];
            rs1 <= instrucao[19:15];
            rd <= instrucao[11:7];
            funct3 <= instrucao[14:12];
            tipo <= 3'b011;
          end 
          3'b110: begin //formato sb
            immediate <= {instrucao[31:25], instrucao[11:7]};
            rs1 <= instrucao[19:15];
            rs2 <= instrucao[24:20];
            funct3 <= instrucao[14:12];
            tipo <= 3'b110;
          end 
        endcase
      end
  end

endmodule