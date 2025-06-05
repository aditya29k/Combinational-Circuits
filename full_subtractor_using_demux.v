module full_subtractor_demux(
    input A,
    input B,
    input Bin,
    output D,
    output Bout
);

    wire [7:0] minterm;

    demux1_8 dm(.I(1'b1), .sel({A, B, Bin}), .out(minterm));

    assign D    = minterm[1] | minterm[2] | minterm[4] | minterm[7];
    assign Bout = minterm[1] | minterm[2] | minterm[3] | minterm[5] | minterm[7];

endmodule

module demux1_8( // better form for demux
    input I,
    input [2:0] sel,
    output reg [7:0] out
);
    always @(*) begin
        out = 8'b00000000;
        out[sel] = I;
    end
endmodule