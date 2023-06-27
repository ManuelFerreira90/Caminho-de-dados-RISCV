module lcdd(clk, LCD_data, LCD_en, LCD_rw, LCD_rs, LCD_blon, rst);
    input clk, rst;
    output reg LCD_en, LCD_rw, LCD_rs, LCD_blon;
    output reg [7:0] LCD_data; 
    reg [5:0] LCD_estado;

    always @(posedge clk) begin
		if(rst == 1'b0) begin
			LCD_estado <= 1'b0;
		end
        case(LCD_estado)
            0: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b0;
                LCD_blon <= 1'b1;
                LCD_data <= 8'b00000000;

                LCD_estado <= LCD_estado + 1;
            end

            1: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b0;
                LCD_data <= 8'b10000100; //Configura escrita para a linha 0 e coluna 5

                LCD_estado <= LCD_estado + 1;
            end
            
            2: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01010100; //T

                LCD_estado <= LCD_estado + 1;
            end

            3: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01010000; //P

                LCD_estado <= LCD_estado + 1;
            end

            4: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b00100000; //espaço

                LCD_estado <= LCD_estado + 1;
            end
            
            5: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01001111; //O

                LCD_estado <= LCD_estado + 1;
            end

            6: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01000011; //C

                LCD_estado <= LCD_estado + 1;
            end

            7: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b00110001; //1

                LCD_estado <= LCD_estado + 1;
            end

            8: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b0;
                LCD_data <= 8'b11000000; //Configurando para a linha 1 coluna 0

                LCD_estado <= LCD_estado + 1;
            end

            9: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01000011; //C

                LCD_estado <= LCD_estado + 1;
            end

            10: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01100001; //a

                LCD_estado <= LCD_estado + 1;
            end

            11: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101101; //m

                LCD_estado <= LCD_estado + 1;
            end

            12: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101001; //i

                LCD_estado <= LCD_estado + 1;
            end

            13: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101110; //n

                LCD_estado <= LCD_estado + 1;
            end
            
            14: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101000; //h

                LCD_estado <= LCD_estado + 1;
            end
            
            15: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101111; //o

                LCD_estado <= LCD_estado + 1;
            end
            
            16: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b00100000; //espaço

                LCD_estado <= LCD_estado + 1;
            end
            
            17: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01100100; //d

                LCD_estado <= LCD_estado + 1;
            end
            
            18: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01100101; //e

                LCD_estado <= LCD_estado + 1;
            end
            
            19: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b00100000; //espaço

                LCD_estado <= LCD_estado + 1;
            end
            
            20: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01000100; //D

                LCD_estado <= LCD_estado + 1;
            end
            
            21: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01100001; //a

                LCD_estado <= LCD_estado + 1;
            end
            
            22: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01100100; //d

                LCD_estado <= LCD_estado + 1;
            end
            
            23: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01101111; //o

                LCD_estado <= LCD_estado + 1;
            end
            
            24: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b1;
                LCD_data <= 8'b01110011; //s

                LCD_estado <= LCD_estado + 1;
            end

            25: begin
                LCD_en <= 1'b0;
                LCD_rw <= 1'b0;
                LCD_rs <= 1'b0;
                LCD_data <= 8'b10000000; //finish

                //LCD_estado <= LCD_estado + 1;
            end
        endcase
    end

endmodule