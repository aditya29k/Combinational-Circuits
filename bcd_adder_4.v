module bcd_4(
    input [3:0] a, b,
    output carry,
    output [3:0] sum
);

    wire [3:0] c0, c2;
    wire c1;
    wire [3:0] s;

    ripple_adder DUT0(.a(a), .b(b), .cin(1'b0), .sum(s), .cout(c0));
    assign c1 = (c0[3])|(s[2]&s[3])|(s[3]&s[1]);
    ripple_adder DUT1(.a(s), .b({1'b0, {2{c1}}, 1'b0}), .cin(1'b0), .sum(sum), .cout(c2));

    assign carry = c2[3];

endmodule

module ripple_adder(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output [3:0] cout
);
    full_adder DUT0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(cout[0]));
    full_adder DUT1(.a(a[1]), .b(b[1]), .cin(cout[0]), .sum(sum[1]), .carry(cout[1]));
    full_adder DUT2(.a(a[2]), .b(b[2]), .cin(cout[1]), .sum(sum[2]), .carry(cout[2]));
    full_adder DUT3(.a(a[3]), .b(b[3]), .cin(cout[2]), .sum(sum[3]), .carry(cout[3]));

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