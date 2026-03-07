module tb_async_up_counter;
    reg clk;
    reg reset;
    wire [3:0] count;

    // Instantiate the counter
    async_up_counter uut (
        .clk(clk),
        .reset(reset),
        .count(count)
    );

    // Generate Clock: 10ns period
    always #5 clk = ~clk;

    initial begin
        // Initialize signals
        clk = 0;
        reset = 1;

        // Release reset after 20ns
        #20 reset = 0;

        // Let it run for 200ns to see a full cycle (0-15)
        #200 $finish;
    end

    initial begin
        $monitor("Time=%0t | Reset=%b | Count=%b (%d)", $time, reset, count, count);
    end
endmodule
