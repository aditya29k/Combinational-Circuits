module gates(
    input a, b,
    output [5:0] out
);

    mux2_1 DUT0(.sel(a), .a({1'b1, b}), .out(out[0])); // a+(~ab) = a+b OR
    mux2_1 DUT1(.sel(~a), .a({b, 1'b0}), .out(out[1])); //  ab+0 = ab AND
    mux2_1 DUT2(.sel(~a), .a({1'b1, ~b}), .out(out[2])); // ~a+(a.~b) = ~a+~b = ~(ab) NAND
    mux2_1 DUT3(.sel(~a), .a({~b, 1'b0}), .out(out[3])); // 0+~a.~b = ~(a+b) NOR
    mux2_1 DUT4(.sel(a), .a({b,~b}), .out(out[4])); // ~a.b+(a.~b) XOR
    mux2_1 DUT5(.sel(a), .a({~b, b}), .out(out[5])); // ~a.~b+(a.b) XNOR

endmodule

module mux2_1(
    input [1:0] a,
    input sel,
    output out
);

    assign out = (sel)?a[1]:a[0];

endmodule