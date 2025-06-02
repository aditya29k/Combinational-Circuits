module add_sub(
    input [3:0] a, b,
    input control,
    output carry,
    output [3:0] sum
);

    wire [3:0] c;
    wire [3:0] b_new;

    assign b_new = b^{4{control}};

    full_adder DUT0(.a(a[0]), .b(b_new[0]), .cin(control), .carry(c[0]), .sum(sum[0]));
    full_adder DUT1(.a(a[1]), .b(b_new[1]), .cin(c[0]), .carry(c[1]), .sum(sum[1]));
    full_adder DUT2(.a(a[2]), .b(b_new[2]), .cin(c[1]), .carry(c[2]), .sum(sum[2]));
    full_adder DUT3(.a(a[3]), .b(b_new[3]), .cin(c[2]), .carry(c[3]), .sum(sum[3]));

    assign carry = c[3];

endmodule

module full_adder(

    input a, b, cin,
    output sum, carry

);

    wire sum0;
    wire carry0, carry1;

    half_adder DUT0(.sum(sum0), .carry(carry0), .a(a), .b(b));
    half_adder DUT1(.sum(sum), .carry(carry1), .a(sum0), .b(cin));

    assign carry = carry0|carry1;

    /* assign {carry, sum} = {((a&b)|(cin&(a^b)))} */
    // assignment in oneline

endmodule

module half_adder(

    input a, b,
    output sum, carry

);

    assign {carry, sum} = {a&b, a^b};

endmodule