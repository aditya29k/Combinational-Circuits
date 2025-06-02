module full_subtractor(
    input a, b, bin,
    output borrow, difference
);

    wire borrow0, borrow1;
    wire diff0;

    half_sub DUT0(.borrow(borrow0), .difference(diff0), .a(a), .b(b));
    half_sub DUT1(.borrow(borrow1), .difference(difference), .a(diff0), .b(bin));

    assign borrow = borrow0|borrow1;

    /* assign {borrow, difference} = {(~a&b)|(~(a^b)&bin)};*/
    // sinlge line assignment

endmodule

module half_sub(
    input a, b,
    output borrow, difference
);

    assign {borrow, difference} = {~a&b, a^b};

endmodule