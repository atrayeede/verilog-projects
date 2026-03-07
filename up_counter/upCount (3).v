// T Flip-Flop Module
module tff (
    input clk,
    input reset,
    output reg q
);
    always @(negedge clk or posedge reset) begin
        if (reset)
            q <= 1'b0;
        else
            q <= ~q; // Toggle
    end
endmodule

// 4-Bit Asynchronous Up-Counter
module async_up_counter (
    input clk,
    input reset,
    output [3:0] count
);
    // Each stage uses the output of the previous stage as its clock
    tff tf0 (clk,      reset, count[0]);
    tff tf1 (count[0], reset, count[1]);
    tff tf2 (count[1], reset, count[2]);
    tff tf3 (count[2], reset, count[3]);

endmodule
