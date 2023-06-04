`timescale 1ns/100ps

module caminho_tb;

    reg clk_tb, rst_tb;
    main main_ (.clk(clk_tb), .rst(rst_tb));

    initial begin
        clk_tb = 0;
        rst_tb = 1;

        #10
        rst_tb = 0;

        #50
        rst_tb = 1;

        #400
        $stop;
    end

    always #5 clk_tb = ~clk_tb;

endmodule