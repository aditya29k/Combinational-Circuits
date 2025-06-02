module half_adder(
    input a, b,
    output sum, carry
);

    assign {carry, sum} = {a&b, a^b};

endmodule