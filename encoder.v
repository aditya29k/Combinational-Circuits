//ALLPRIORITY ENCODERS ARE GIVEN

module encoder10_4(
    input [9:0] A,
    output [3:0] out
);

    assign out[0] = A[1]|A[3]|A[5]|A[7]|A[9];
    assign out[1] = A[2]|A[3]|A[6]|A[7];
    assign out[2] = A[4]|A[5]|A[6]|A[7];
    assign out[3] = A[8]|A[9];

endmodule

module encoder4_2(
    input [3:0] A,
    output [1:0] out
);

    assign out[0] = A[1]|A[3];
    assign out[1] = A[2]|A[3];

endmodule

module encoder8_3(
    input [7:0] A,
    output [2:0] out
); // octal to binary encoder

    assign out[0] = A[1]|A[3]|A[5]|A[7];
    assign out[1] = A[2]|A[3]|A[6]|A[7];
    assign out[2] = A[4]|A[5]|A[6]|A[7];

endmodule