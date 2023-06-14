`include "main.v"

module testbench;

    reg clk_tb, rst_tb;
    wire [6:0] display1, display2, display3, display4, display5;
 
    main main (.clk(clk_tb), .rst(rst_tb), .display1(display1), .display2(display2), 
    .display3(display3), .display4(display4), .display5(display5));

    initial begin
        $dumpfile("testbench.vcd");
        $dumpvars(0, testbench);
        rst_tb = 1;
        #5
        rst_tb = 0;
        #1000;
        $finish;
    end
    initial clk_tb = 1'b0;
    always #1 clk_tb = ~clk_tb;

endmodule