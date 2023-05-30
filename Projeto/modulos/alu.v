module alu (clk, readdata1R, readdata2R, alusrc, alucontrol, immediate, aluresult1, aluresult2, pcsrc, branch);
    input wire clk;
    input [31:0] readdata1R;
    input [31:0] readdata2R;
    input alusrc;
    input [11:0] immediate;
    input branch;
    output reg [31:0] aluresult1;
    output reg [31:0] aluresult2;
    output reg pcsrc;

    always @(posedge clk) begin
        case (alusrc)
            1'b0: begin // operações para funções que não usam imediato
                case (alucontrol)
                    4'b0010: begin // soma
                        aluresult2 <= readdata1R + readdata2R;
                        writedataR <= aluresult2;
                        aluresult1 <= 1'b0;
                    end
                    4'b0110: begin //subtração
                        aluresult2 <= readdata1R - readdata2R;
                        writedataR <= aluresult2;
                        aluresult1 <= 1'b0;
                    end
                    4'b0010: begin // xor
                        aluresult2 <= readdata1R ^ readdata2R;
                        writedataR <= aluresult2;
                        aluresult1 <= 1'b0;
                    end
                    4'b0101: begin // slr
                        aluresult2 <= readdata1R >>> readdata2R;
                        writedataR <= aluresult2;
                        aluresult1 <= 1'b0;
                    end
                endcase
            end
            1'b1: begin // operações para funções que usam imediato
                case (alucontrol)
                    4'b0010: begin // soma lw e sw
                        aluresult2 <= readdata1R + imediato;
                        writedataR <= aluresult1;
                        aluresult1 <= 1'b0;
                    end
                     4'b0110: begin //subtração para beq
                        aluresult2 <= readdata1R - readdata2R;
                        writedataR <= aluresult2;
                        if(aluresult2 == 0) begin
                            aluresult1 <= 1'b1;
                        end
                    end
                endcase
            end
        endcase
        pcsrc <= aluresult1 & branch;
    end
    
endmodule