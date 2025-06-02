module cla(
    input [3:0] a, b, 
    input cin,
    output carry,
    output [3:0] sum
);

    wire [4:0] c;
    wire [3:0] p, g;

    // carry propogator
    assign p[0] = a[0]^b[0];
    assign p[1] = a[1]^b[1];
    assign p[2] = a[2]^b[2];
    assign p[3] = a[3]^b[3];

    // carry generator
    assign g[0] = a[0]&b[0];
    assign g[1] = a[1]&b[1];
    assign g[2] = a[2]&b[2];
    assign g[3] = a[3]&b[3];

    assign c[0] = cin;

    // carry next
    assign c[1] = g[0] | (p[0] & c[0]);
    assign c[2] = g[1] | (p[1] & g[0]) | (p[1] & p[0] & c[0]);
    assign c[3] = g[2] | (p[2] & g[1]) | (p[2] & p[1] & g[0]) | (p[2] & p[1] & p[0] & c[0]);
    assign c[4] = g[3] | (p[3] & g[2]) | (p[3] & p[2] & g[1]) | (p[3] & p[2] & p[1] & g[0]) | (p[3] & p[2] & p[1] & p[0] & c[0]); 

    // sum and carry
    assign sum = p^c[3:0];
    assign carry = c[4];

endmodule