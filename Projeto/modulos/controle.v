module controle (tipo, regiwrite, aluop, memwrite, memread, alucontrol, funct3, aluresult1, clk);
    input wire [2:0] tipo;
    input wire [2:0] funct3;
    input wire aluresult1;
    input wire clk;
    output reg regiwrite;
    output reg [1:0] aluop;
    output reg memwrite;
    output reg memread;
    output reg [3:0] alucontrol;

    always @(posedge clk)begin
        case (tipo)
            3'b000: begin //lw
                regiwrite <= 1'b1;
                aluop <= 2'b00;
                memwrite <= 1'b0;
                memread <= 1'b1;
                alucontrol <= 4'b0010;
            end
            3'b010: begin //sw
                regiwrite <= 1'b0;
                aluop <= 2'b00;
                memwrite <= 1'b1;
                memread <= 1'b0;
                alucontrol <= 4'b0010;
            end
            3'b011: begin
                case (funct3)
                    3'b000 : begin //sub
                        regiwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0110;
                    end
                    3'b100 : begin //xor
                        regiwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0010;
                    end
                    3'b101 : begin //srl
                        regiwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0101;
                    end
                endcase
            end
            3'b110: begin //beq
                regiwrite <= 1'b0;
                aluop <= 2'b01;
                memwrite <= 1'b0;
                memread <= 1'b0;
                alucontrol <= 4'b0110;
            end
        endcase
    end
    
endmodule