module comparator_4(
    input [3:0] a, b,
    output reg a_big, b_big, a_b
);

    // simple way is to check a>b, a<b, a == b

    wire upper_a, upper_b, upper_equal;
    wire lower_a, lower_b, lower_equal;

    comparator_2 DUT0(.a(a[3:2]), .b(b[3:2]), .a_big(upper_a), .b_big(upper_b), .a_b(upper_equal));
    comparator_2 DUT1(.a(a[1:0]), .b(b[1:0]), .a_big(lower_a), .b_big(lower_b), .a_b(lower_equal));

    always @(*) begin
        {a_big, b_big, a_b} = 3'b000;

        if(upper_a) begin
            a_big = 1'b1;
        end
        else if(upper_b) begin
            b_big = 1'b1;
        end
        else if(upper_equal) begin
            if(lower_a) begin
                a_big = 1'b1;
            end
            else if(lower_b) begin
                b_big = 1'b1;
            end
            else if(lower_equal) begin
                a_b = 1'b1;
            end
        end

    end

endmodule

module comparator_2(
    input [1:0] a, b,
    output a_big, b_big, a_b
);

    assign a_big = (a[1]&(~b[1]))|(a[0]&(~b[1])&(~b[0]))|(a[1]&(~a[0])&(~b[0]));
    assign b_big = (~a[1]&b[1])|(a[0]&b[1]&b[0])|(~a[1]&(~a[0])&b[0]);
    assign a_b = (~(a[1]^b[1]))&(~(a[0]^b[0]));

endmodule