module comparator_2(
    input [1:0] a, b,
    output a_big, b_big, a_b
);

    assign a_big = (a[1]&(~b[1]))|(a[0]&(~b[1])&(~b[0]))|(a[1]&(~a[0])&(~b[0]));
    assign b_big = (~a[1]&b[1])|(a[0]&b[1]&b[0])|(~a[1]&(~a[0])&b[0]);
    assign a_b = (~(a[1]^b[1]))&(~(a[0]^b[0]));

endmodule