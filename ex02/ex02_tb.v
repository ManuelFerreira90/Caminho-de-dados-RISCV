module ex02(a,b,c,d,s4,s3,s2,s1);
    
    input a,b,c,d;
    output s4,s3,s2,s1;

    assign s4 = a;
    assign s3 = a ^ b;
    assign s2 = b ^ c;
    assign s1 = c ^ d;

endmodule

module ex02_tb;

    reg a_tb, b_tb, c_tb, d_tb;
    wire s4_tb, s3_tb, s2_tb, s1_tb;

    initial begin
        $monitor("output= %b%b%b%b, a= %b, b= %b, c= %b, d= %b", s4_tb, s3_tb, s2_tb, s1_tb, a_tb, b_tb, c_tb, d_tb);
    end

    ex02 test (.a(a_tb), .b(b_tb), .c(c_tb), .d(d_tb), .s4(s4_tb), .s3(s3_tb), .s2(s2_tb), .s1(s1_tb));

    initial begin

        a_tb = 1'b0;
        b_tb = 1'b0;
        c_tb = 1'b0;
        d_tb = 1'b0;

        // 0001
        #1 d_tb = 1'b1;
        //0010
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b1;
        //0011
        #1 d_tb = 1'b1;
        #1 c_tb = 1'b1;
        //0100
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b0;
        #0 b_tb = 1'b1;
        //0101
        #1 d_tb = 1'b1;
        //0110
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b1;
        //0111
        #1 d_tb = 1'b1;
        //1000
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b0;
        #0 b_tb = 1'b0;
        #0 a_tb = 1'b1;
        //1001
        #1 d_tb = 1'b1;
        //1010
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b1;
        //1011
        #1 d_tb = 1'b1;
        //1100
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b0;
        #0 b_tb = 1'b1;
        //1101
        #1 d_tb = 1'b1;
        //1110
        #1 d_tb = 1'b0;
        #0 c_tb = 1'b1;
        //1111
        #1 d_tb = 1'b1;

    end

endmodule