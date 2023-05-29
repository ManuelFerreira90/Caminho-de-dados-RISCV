module registradores (clk, rs1, rs2, rd, writedata, readdata1R, readdata2R, regiwrite);
    input wire clk;
    input [4:0] rs1, rs2, rd;
    input regiwrite;
    input [31:0] writedata;
    output reg [31:0] readdata1R, readdata2R;
    
endmodule