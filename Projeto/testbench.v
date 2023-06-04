//`timescale 1ns/100ps
`include "main.v"

module caminho_tb;

    reg clk_tb, rst_tb;
    wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;
    main main (.clk(clk_tb), .rst(rst_tb), .reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), .reg6(reg6), .reg7(reg7), .reg8(reg8), .reg9(reg9), .reg10(reg10), .reg11(reg11),.reg12(reg12), .reg13(reg13), .reg14(reg14), .reg15(reg15), .reg16(reg16), .reg17(reg17), .reg18(reg18), .reg19(reg19), .reg20(reg20), .reg21(reg21), .reg22(reg22), .reg23(reg23), .reg24(reg24), .reg25(reg25), .reg26(reg26), .reg27(reg27), .reg28(reg28), .reg29(reg29), .reg30(reg30), .reg31(reg31));

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, caminho_tb);
        $display("Iniciando simulacao");
        rst_tb = 0;
        #400;
        rst_tb = 1;
        $display("Registrador [0] =  %b", reg0);
        $display("Registrador [1] =  %b", reg1);
        $display("Registrador [2] =  %b", reg8);
        $display("Registrador [3] =  %b", reg9);
        $display("Registrador [4] =  %b", reg10);
        $display("Registrador [5] =  %b", reg11);
        $display("Registrador [6] =  %b", reg12);
        $display("Registrador [7] =  %b", reg13);
        $display("Registrador [8] =  %b", reg8);
        $display("Registrador [9] =  %b", reg9);
        $display("Registrador [10] = %b", reg10);
        $display("Registrador [11] = %b", reg11);
        $display("Registrador [12] = %b", reg12);
        $display("Registrador [13] = %b", reg13);
        $display("Registrador [14] = %b", reg14);
        $display("Registrador [15] = %b", reg15);
        $display("Registrador [16] = %b", reg16);
        $display("Registrador [17] = %b", reg17);
        $display("Registrador [18] = %b", reg18);
        $display("Registrador [19] = %b", reg19);
        $display("Registrador [20] = %b", reg20);
        $display("Registrador [21] = %b", reg21);
        $display("Registrador [22] = %b", reg22);
        $display("Registrador [23] = %b", reg23);
        $display("Registrador [24] = %b", reg24);
        $display("Registrador [25] = %b", reg25);
        $display("Registrador [26] = %b", reg26);
        $display("Registrador [27] = %b", reg27);
        $display("Registrador [28] = %b", reg28);
        $display("Registrador [29] = %b", reg29);
        $display("Registrador [30] = %b", reg30);
        $display("Registrador [31] = %b", reg31);
        $finish;
        
    end
    initial clk_tb = 1'b0;
    always #1 clk_tb = ~clk_tb;

endmodule