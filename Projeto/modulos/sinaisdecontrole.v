module sinaisdecontrole (tipo, regiwrite, memwrite, memread, alucontrol, funct3, clk, branch, memtoreg, alusrc);
    input wire [2:0] tipo;
    input wire [2:0] funct3;
    //input wire aluresult1;
    input wire clk;
    output reg regiwrite;
    output reg [1:0] aluop;
    output reg memwrite;
    output reg memread;
    output reg [3:0] alucontrol;
    output reg branch;
    output reg memtoreg;
    output reg alusrc;

    always @(posedge clk)begin
        case (tipo)
            3'b000: begin //lw
                regiwrite <= 1'b1;
                memwrite <= 1'b0;
                memread <= 1'b1;
                alucontrol <= 4'b0010;
                branch <= 1'b0;
                memtoreg <= 1'b1;
                alusrc <= 1'b1;
            end
            3'b010: begin //sw
                regiwrite <= 1'b0;
                memwrite <= 1'b1;
                memread <= 1'b0;
                alucontrol <= 4'b0010;
                branch <= 1'b0;
                memtoreg <= 1'b1;
                alusrc <= 1'b1;
            end
            3'b011: begin
                case (funct3)
                    3'b000 : begin //sub
                        regiwrite <= 1'b1;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0110;
                        branch <= 1'b0;
                        memtoreg <= 1'b0;
                        alusrc <= 1'b0;
                    end
                    3'b100 : begin //xor
                        regiwrite <= 1'b1;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0010;
                        branch <= 1'b0;
                        memtoreg <= 1'b0;
                        alusrc <= 1'b0;
                    end
                    3'b101 : begin //srl
                        regiwrite <= 1'b1;
                        memwrite <= 1'b0;
                        memread <= 1'b0;
                        alucontrol <= 4'b0101;
                        branch <= 1'b0;
                        memtoreg <= 1'b0;
                        alusrc <= 1'b0;
                    end
                endcase
            end
            3'b110: begin //beq
                regiwrite <= 1'b0;
                memwrite <= 1'b0;
                memread <= 1'b0;
                alucontrol <= 4'b0110;
                branch <= 1'b1;
                memtoreg <= 1'b0;
                alusrc <= 1'b1;
            end
        endcase
    end
    
endmodule