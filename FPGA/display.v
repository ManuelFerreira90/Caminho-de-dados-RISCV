module display (pc1, pc2, display1, display2);
	input [3:0] pc1;
	input [3:0] pc2;
	output reg [6:0] display1;
	output reg [6:0] display2;
	
	always @* begin
		case (pc1)
			4'b0000: display1 = 7'b1000000;
			4'b0001: display1 = 7'b1111001;
			4'b0010: display1 = 7'b0100100;
			4'b0011: display1 = 7'b0110000;
			4'b0100: display1 = 7'b0110001;
			4'b0101: display1 = 7'b0010010;
			4'b0110: display1 = 7'b0110010;
			4'b0111: display1 = 7'b1111000;
			4'b1000: display1 = 7'b0000000;
			4'b1001: display1 = 7'b0010000;
			default: display1 = 7'b1111111;
		endcase
		
		case (pc2)
			4'b0000: display2 = 7'b1000000;
			4'b0001: display2 = 7'b1111001;
			4'b0010: display2 = 7'b0100100;
			4'b0011: display2 = 7'b0110000;
			4'b0100: display2 = 7'b0110001;
			4'b0101: display2 = 7'b0010010;
			4'b0110: display2 = 7'b0110010;
			4'b0111: display2 = 7'b1111000;
			4'b1000: display2 = 7'b0000000;
			4'b1001: display2 = 7'b0010000;
			default: display2 = 7'b1111111;
		endcase
	end

endmodule