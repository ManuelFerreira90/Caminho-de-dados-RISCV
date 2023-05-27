module moduleName (clock, immediate);
    input [11:0] immediate;
    output reg [31:0] completeimm;

    always @(clock) begin
        completeimm[11:0] <= immediate;
        completeimm[31:12] <= 20'b0;
    end

endmodule