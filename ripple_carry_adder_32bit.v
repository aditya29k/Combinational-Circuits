module ripple_adder_32(
    input [31:0] a, b,
    input cin,
    output [31:0] carry,
    output [31:0] sum
);

    ripple_adder_16 DUT0(.a(a[15:0]), .b(b[15:0]), .cin(cin), .carry(carry[15:0]), .sum(sum[15:0]));
    ripple_adder_16 DUT1(.a(a[31:16]), .b(b[31:16]), .cin(carry[15]), .carry(carry[31:16]), .sum(sum[31:16]));

endmodule

module ripple_adder_16(
    input [15:0] a, b,
    input cin,
    output [15:0] carry,
    output [15:0] sum
);

    ripple_adder_8 DUT0(.a(a[7:0]), .b(b[7:0]), .cin(cin), .carry(carry[7:0]), .sum(sum[7:0]));
    ripple_adder_8 DUT1(.a(a[15:8]), .b(b[15:8]), .cin(carry[7]), .carry(carry[15:8]), .sum(sum[15:8]));

endmodule

module ripple_adder_8(
    input [7:0] a, b,
    input cin,
    output [7:0] carry,
    output [7:0] sum
);

    ripple_adder DUT0(.a(a[3:0]), .b(b[3:0]), .cin(cin), .carry(carry[3:0]), .sum(sum[3:0]));
    ripple_adder DUT1(.a(a[7:4]), .b(b[7:4]), .cin(carry[3]), .carry(carry[7:4]), .sum(sum[7:4]));

endmodule

module ripple_adder(
    input [3:0] a, b,
    input cin,
    output [3:0] sum,
    output [3:0] carry
);
    full_adder DUT0(.a(a[0]), .b(b[0]), .cin(cin), .sum(sum[0]), .carry(carry[0]));
    full_adder DUT1(.a(a[1]), .b(b[1]), .cin(carry[0]), .sum(sum[1]), .carry(carry[1]));
    full_adder DUT2(.a(a[2]), .b(b[2]), .cin(carry[1]), .sum(sum[2]), .carry(carry[2]));
    full_adder DUT3(.a(a[3]), .b(b[3]), .cin(carry[2]), .sum(sum[3]), .carry(carry[3]));

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