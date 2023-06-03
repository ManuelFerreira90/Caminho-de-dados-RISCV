module clock (clk);
    output reg clk; // clock

    initial begin
        clk = 1'b0;
    end

    // Clock
    always begin
        case (clk)
            1'b0: #1 clk <= 1'b1;
            1'b1: #1 clk <= 1'b0;
        endcase
    end

endmodule
