module half_sub(
    input a, b,
    output borrow, difference
);

    assign {borrow, difference} = {~a&b, a^b};

endmodule