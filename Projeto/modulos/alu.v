module alu (clk, readdata1R, readdata2R, alusrc, alucontrol, immediate, aluresult1, aluresult2, pcsrc, branch, estado);
    input wire clk;
    input wire [3:0] estado;
    input [31:0] readdata1R;
    input [31:0] readdata2R;
    input alusrc;
    input [11:0] immediate;
    input branch;
    input [3:0] alucontrol;
    output reg aluresult1;
    output reg [31:0] aluresult2;
    output reg pcsrc;

    always @(posedge clk) begin
        if ((estado == 4'b0010) || (estado == 4'b0101) || (estado == 4'b0110 )) begin // Estado de execução
            case (alusrc)
                1'b0: begin // operações para funções que não usam imediato
                    case (alucontrol)
                        4'b0000: begin // and
                            aluresult2 <= readdata1R & readdata2R;
                            aluresult1 <= 1'b0;
                        end
                        4'b0001: begin // or
                            aluresult2 <= readdata1R | readdata2R;
                            aluresult1 <= 1'b0;
                        end
                        4'b0010: begin // soma
                            aluresult2 <= readdata1R + readdata2R;
                            aluresult1 <= 1'b0;
                        end
                        4'b0110: begin //subtração
                            aluresult2 <= readdata1R - readdata2R;
                            aluresult1 <= 1'b0;
                        end
                        4'b0010: begin // xor
                            aluresult2 <= readdata1R ^ readdata2R;
                            aluresult1 <= 1'b0;
                        end
                        4'b0101: begin // slr
                            aluresult2 <= readdata1R >>> readdata2R;
                            aluresult1 <= 1'b0;
                        end
                    endcase
                end
                1'b1: begin // operações para funções que usam imediato
                    case (alucontrol)
                        4'b0010: begin // soma lw e sw
                            aluresult2 <= readdata1R + (immediate/4);
                            aluresult1 <= 1'b0;
                            
                        end
                        4'b0011: begin // addi
                            aluresult2 <= readdata1R + immediate;
                            aluresult1 <= 1'b0;
                            
                        end
                        4'b0110: begin //subtração para beq
                            aluresult2 <= readdata1R - readdata2R;
                            if(aluresult2 == 0) begin
                                aluresult1 <= 1'b1;
                            end
                        end
                    endcase
                end
            endcase
            pcsrc <= aluresult1 & branch;
        end
    end
    
endmodule