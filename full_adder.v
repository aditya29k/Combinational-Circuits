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