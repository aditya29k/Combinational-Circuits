module full_sub_using_mux(
    input a, b, bin,
    output diff, bout
);

    assign diff = ({a,b} == 2'b00) ? bin:(({a,b} == 2'b01) ? ~bin: (({a,b} == 2'b10) ? ~bin:bin)); 
    assign bout = ({a,b} == 2'b00) ? bin:(({a,b} == 2'b01) ? 1'b1: (({a,b} == 2'b10) ? 1'b0:bin));

endmodule