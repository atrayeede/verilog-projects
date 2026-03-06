`timescale 1ns/1ps

module mult_piped_8x8_2sC1_tb;

    // Signals
    reg clock, reset;
    reg [7:0] a_in, b_in;
    wire [15:0] y_out;

    // Expected value queue to handle 8-cycle pipeline latency
    reg [15:0] expected_q [0:7];
    integer i;

    // DUT Instance
    mult_piped_8x8_2sC DUT (
        .a(a_in), 
        .b(b_in), 
        .clk(clock), 
        .reset(reset), 
        .y(y_out)
    );

    // Clock Generation (100MHz)
    initial clock = 0;
    always #5 clock = ~clock;

    // Stimulus Block
    initial begin
        // Initialize
        a_in = 0;
        b_in = 0;
        reset = 1;
        for (i = 0; i < 8; i = i + 1) expected_q[i] = 0;

        #20 reset = 0;
        
        // Test Case 1: Positive * Positive
        apply_test(8'd10, 8'd5);   // 50
        
        // Test Case 2: Negative * Positive
        apply_test(-8'd10, 8'd5);  // -50
        
        // Test Case 3: Negative * Negative
        apply_test(-8'd4, -8'd3);  // 12
        
        // Test Case 4: Max range 
        apply_test(8'd127, 8'd127); 
        
        // Test Case 5: Zero
        apply_test(8'd0, 8'd100);

        // Wait for pipeline to flush
        repeat(10) @(posedge clock);
        
        $display("Simulation Finished successfully.");
        $finish;
    end

    // Task to apply inputs and calculate expected results locally
    task apply_test(input [7:0] a, input [7:0] b);
        begin
            @(posedge clock);
            #1; // Small delay after edge
            a_in = a;
            b_in = b;
            
            // Push expected result into the pipeline model (manual shift register)
            for (i = 7; i > 0; i = i - 1) begin
                expected_q[i] = expected_q[i-1];
            end
            expected_q[0] = $signed(a) * $signed(b);
        end
    endtask

    // Response Checking Logic
    always @(posedge clock) begin
        #2; // Check shortly after clock edge
        if (!reset) begin
            $display("Time=%0t | In: A=%d B=%d | Out: Y=%d | Expected(delayed)=%d", 
                     $time, a_in, b_in, y_out, expected_q[7]);
            
            // We compare y_out with the value that has traveled through our local 8-stage queue
            if (y_out !== expected_q[7]) begin
                $display("ERROR: Mismatch detected!");
                //$stop; // Uncomment to halt on error
            end
        end
    end

endmodule
