module alu (clk, readdata1R, readdata2R, alusrc, alucontrol, immediate, aluresult1, aluresult2, pcsrc, branch, estado, negativo);
    input wire clk;
    input wire [3:0] estado;
    input [31:0] readdata1R;
    input [31:0] readdata2R;
    input alusrc;
    input [11:0] immediate;
    input branch;
    input [3:0] alucontrol;
    input negativo;
    output reg aluresult1;
    output reg [31:0] aluresult2;
    output pcsrc;

    assign pcsrc = aluresult1 & branch;

    always @(posedge clk) begin
        //estados em a alu é usada
        if ((estado == 4'b0101) || (estado == 4'b0110 )) begin // Estado de execução
            //alusrc define se a alu vai usar imediato ou não
            case (alusrc)
                1'b0: begin // operações para funções que não usam imediato
                    //alucontrol define a operação que a alu vai fazer
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
                        4'b0100: begin // xor
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
                            if(negativo == 1'b1) begin
                                aluresult2 <= readdata1R - (immediate/4);
                            end else begin
                                aluresult2 <= readdata1R + (immediate/4);
                            end
                            aluresult1 <= 1'b0;
                            
                        end
                        4'b0011: begin // addi
                            if(negativo == 1'b1) begin
                                aluresult2 <= readdata1R - immediate;
                            end else begin
                                aluresult2 <= readdata1R + immediate;
                            end
                            aluresult1 <= 1'b0;
                            
                        end
                        4'b0110: begin //subtração para beq
                            aluresult2 <= readdata1R - readdata2R;
                            if(aluresult2 == 0) begin
                                aluresult1 <= 1'b1;
                            end
                        end
                        4'b1111: begin // bne
                            if(readdata1R != readdata2R) begin
                                aluresult1 <= 1'b1;
                            end 
                            else begin
                                aluresult1 <= 1'b0;
                            end
                        end
                    endcase
                end
            endcase
        end
    end
    
endmodule