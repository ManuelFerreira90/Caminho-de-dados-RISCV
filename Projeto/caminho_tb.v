//`timescale 1ns/100ps
`include "main.v"

module caminho_tb;

    reg clk_tb, rst_tb;
    wire [31:0] reg0, reg1, reg2, reg3, reg4, reg5, reg6, reg7, reg8, reg9, reg10, reg11, reg12, reg13, reg14, reg15, reg16, reg17, reg18, reg19, reg20, reg21, reg22, reg23, reg24, reg25, reg26, reg27, reg28, reg29, reg30, reg31;
    main main (.clk(clk_tb), .rst(rst_tb), .reg0(reg0), .reg1(reg1), .reg2(reg2), .reg3(reg3), .reg4(reg4), .reg5(reg5), .reg6(reg6), .reg7(reg7), .reg8(reg8), .reg9(reg9), .reg10(reg10), .reg11(reg11),.reg12(reg12), .reg13(reg13), .reg14(reg14), .reg15(reg15), .reg16(reg16), .reg17(reg17), .reg18(reg18), .reg19(reg19), .reg20(reg20), .reg21(reg21), .reg22(reg22), .reg23(reg23), .reg24(reg24), .reg25(reg25), .reg26(reg26), .reg27(reg27), .reg28(reg28), .reg29(reg29), .reg30(reg30), .reg31(reg31));

    initial begin
        rst_tb = 0;
        $dumpfile("_wavefile.vcd");
        $dumpvars(0, caminho_tb);
        
        // $monitor("Registrador [0] = %b", reg0);
        // $monitor("Registrador [1] = %b", reg1);
        // $monitor("Registrador [2] = %b", reg2);
        // $monitor("Registrador [3] = %b", reg3);
        // $monitor("Registrador [4] = %b", reg4);
        // $monitor("Registrador [5] = %b", reg5);
        // $monitor("Registrador [6] = %b", reg6);
        $monitor("Registrador [7] = %b", reg7);
        // $monitor("Registrador [8] = %b", reg8);
        // $monitor("Registrador [9] = %b", reg9);
        // $monitor("Registrador [10] = %b", reg10);
        // $monitor("Registrador [11] = %b", reg11);
        // $monitor("Registrador [12] = %b", reg12);
        // $monitor("Registrador [13] = %b", reg13);
        // $monitor("Registrador [14] = %b", reg14);
        // $monitor("Registrador [15] = %b", reg15);
        // $monitor("Registrador [16] = %b", reg16);
        // $monitor("Registrador [17] = %b", reg17);
        // $monitor("Registrador [18] = %b", reg18);
        // $monitor("Registrador [19] = %b", reg19);
        // $monitor("Registrador [20] = %b", reg20);
        // $monitor("Registrador [21] = %b", reg21);
        // $monitor("Registrador [22] = %b", reg22);
        // $monitor("Registrador [23] = %b", reg23);
        // $monitor("Registrador [24] = %b", reg24);
        // $monitor("Registrador [25] = %b", reg25);
        // $monitor("Registrador [26] = %b", reg26);
        // $monitor("Registrador [27] = %b", reg27);
        // $monitor("Registrador [28] = %b", reg28);
        // $monitor("Registrador [29] = %b", reg29);
        // $monitor("Registrador [30] = %b", reg30);
        // $monitor("Registrador [31] = %b", reg31);

        #200
        $display("Registrador [7] = %b", reg7);
        $finish;
        
    end
    initial clk_tb = 1'b0;
    always #1 clk_tb = ~clk_tb;

endmodule