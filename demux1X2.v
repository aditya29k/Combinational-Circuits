module demux1_2(
    input I, sel,
    output [1:0] out
);

    assign out = (sel) ? {I, 1'b0} : {1'b0, I};

endmodule