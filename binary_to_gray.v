module gray_convert(
    input [3:0] a,
    output [3:0] gray
);

    assign gray[3] = a[3];
    assign gray[2] = a[3]^a[2];
    assign gray[1] = a[2]^a[1];
    assign gray[0] = a[1]^a[0]; 

endmodule

module binary_convert(
    input [3:0] gray,
    output [3:0] binary
);

    assign binary[3] = gray[3];
    assign binary[2] = binary[3]^gray[2];
    assign binary[1] = binary[2]^gray[1];
    assign binary[0] = binary[1]^gray[0];

endmodule