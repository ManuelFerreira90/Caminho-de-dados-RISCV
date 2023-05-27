module controle (tipo, regiwrite, aluop, memwrite, memread, alucontrol, funct3, aluresult1);
    input reg [3:0] tipo;
    input reg [2:0] funct3;
    input reg aluresult1
    output wire regiwrite;
    output wire [1:0] aluop;
    output wire memwrite;
    output wire memread;
    output wire [3:0] alucontrol;

    always @(*)begin
        case (tipo)
            3'b000: begin //lw
                regwrite <= 1'b1;
                aluop <= 2'b00;
                memwrite <= 1'b0;
                memread <= 1'b1;
                alucontrol <= 4'b0010;
            end
            3'b010: begin //sw
                regwrite <= 1'b0;
                aluop <= 2'b00;
                memwrite <= 1'b1;
                memread <= 1'b0;
                alucontrol <= 4'b0010;
            end
            3'b011: begin
                case (funct3)
                    3'b000 : begin //sub
                        regwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0110;
                    end
                    3'b100 : begin //xor
                        regwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0010;
                    end
                    3'b101 : begin //srl
                        regwrite <= 1'b1;
                        aluop <= 2'b10;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0101;
                    end
                endcase
            end
            3'b110: begin //beq
                regwrite <= 1'b0;
                aluop <= 2'b01;
                memwrite <= 1'b0;
                memread <= 1'b0;
                alucontrol <= 4'b0110;
            end
        endcase
    end
    
endmodule