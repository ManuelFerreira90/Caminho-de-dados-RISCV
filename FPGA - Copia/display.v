module display (pc1, pc2, reg1, reg2, HEX0, HEX1, HEX6, HEX7);
     input [3:0] reg1;
     input [3:0] reg2;
	input [3:0] pc1;
	input [3:0] pc2;
	output reg [6:0] HEX0;
	output reg [6:0] HEX1;
	output reg [6:0] HEX6;
	output reg [6:0] HEX7;

	always @* begin
		case (pc1)
	    4'b0000: HEX0 = 7'b1000000;
         4'b0001: HEX0 = 7'b1111001; 
         4'b0010: HEX0 = 7'b0100100; 
         4'b0011: HEX0 = 7'b0110000; 
         4'b0100: HEX0 = 7'b0011001; 
         4'b0101: HEX0 = 7'b0010010;
         4'b0110: HEX0 = 7'b0000010; 
         4'b0111: HEX0 = 7'b1111000; 
         4'b1000: HEX0 = 7'b0000000; 
         4'b1001: HEX0 = 7'b0010000; 
         default: HEX0 = 7'b1111111; 
		endcase
		
		case (pc2)
          4'b0000: HEX1 = 7'b1000000;
          4'b0001: HEX1 = 7'b1111001; 
          4'b0010: HEX1 = 7'b0100100; 
          4'b0011: HEX1 = 7'b0110000; 
          4'b0100: HEX1 = 7'b0011001; 
          4'b0101: HEX1 = 7'b0010010;
          4'b0110: HEX1 = 7'b0000010; 
          4'b0111: HEX1 = 7'b1111000; 
          4'b1000: HEX1 = 7'b0000000; 
          4'b1001: HEX1 = 7'b0010000; 
          default: HEX1 = 7'b1111111; 
		endcase

          case (reg1)
	    4'b0000: HEX6 = 7'b1000000;
         4'b0001: HEX6 = 7'b1111001; 
         4'b0010: HEX6 = 7'b0100100; 
         4'b0011: HEX6 = 7'b0110000; 
         4'b0100: HEX6 = 7'b0011001; 
         4'b0101: HEX6 = 7'b0010010;
         4'b0110: HEX6 = 7'b0000010; 
         4'b0111: HEX6 = 7'b1111000; 
         4'b1000: HEX6 = 7'b0000000; 
         4'b1001: HEX6 = 7'b0010000; 
         default: HEX6 = 7'b1111111; 
		endcase
		
		case (reg2)
          4'b0000: HEX7 = 7'b1000000;
          4'b0001: HEX7 = 7'b1111001; 
          4'b0010: HEX7 = 7'b0100100; 
          4'b0011: HEX7 = 7'b0110000; 
          4'b0100: HEX7 = 7'b0011001; 
          4'b0101: HEX7 = 7'b0010010;
          4'b0110: HEX7 = 7'b0000010; 
          4'b0111: HEX7 = 7'b1111000; 
          4'b1000: HEX7 = 7'b0000000; 
          4'b1001: HEX7 = 7'b0010000; 
          default: HEX7 = 7'b1111111; 
		endcase
	end

endmodule