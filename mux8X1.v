module mux8_1(
    input [7:0] a,
    input [2:0] sel,
    output out
);

    wire [2:0] val;

    mux4_1 DUT0(.a(a[3:0]), .sel(sel[1:0]), .out(val[0]));
    mux4_1 DUT1(.a(a[7:4]), .sel(sel[1:0]), .out(val[1]));

    mux2_1 DUT2(.a(val[1:0]), .sel(sel[2]), .out(val[2]));

    assign out = val[2];

endmodule

module mux4_1(
    input [3:0] a,
    input [1:0] sel,
    output out
);

    wire [2:0] val;

    mux2_1 DUT0(.a(a[1:0]), .sel(sel[0]), .out(val[0]));
    mux2_1 DUT1(.a(a[3:2]), .sel(sel[0]), .out(val[1]));
    mux2_1 DUT2(.a(val[1:0]), .sel(sel[1]), .out(val[2]));

    assign out = val[2];

endmodule

module mux2_1(
    input [1:0] a,
    input sel,
    output out
);

    assign out = (sel)?a[1]:a[0];

endmodule