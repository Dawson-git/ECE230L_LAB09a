module d_latch(
    input D, E,
    output reg Q,
    output reg NotQ
);

    always @(E or D) begin
        if (E) begin
            Q    <= D;
            NotQ <= ~D;
        end
    end

endmodule