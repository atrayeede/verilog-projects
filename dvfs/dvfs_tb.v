`timescale 1ns / 1ps

module tb_dvfs_tunable_multiplier;

    // Parameters
    parameter WIDTH = 8;

    // Testbench Signals
    reg clk_in;
    reg rst;
    reg start;
    reg [WIDTH-1:0] a;
    reg [WIDTH-1:0] b;
    reg [3:0] precision;
    reg [1:0] dvfs_v_state;
    
    wire [2*WIDTH-1:0] result;
    wire done;

    // Variables for performance tracking
    integer start_time;
    integer end_time;

    // Instantiate the Device Under Test (DUT)
    dvfs_tunable_multiplier #(WIDTH) dut (
        .clk_in(clk_in),
        .rst(rst),
        .start(start),
        .a(a),
        .b(b),
        .precision(precision),
        .dvfs_v_state(dvfs_v_state),
        .result(result),
        .done(done)
    );

    // Clock Generation: 100 MHz clock (10ns period)
    always #5 clk_in = ~clk_in;

    // Stimulus Block
    initial begin
        // 1. Initialize System and Apply Reset
        $display("--- Starting DVFS Tunable Multiplier Simulation ---");
        clk_in = 0;
        rst = 1;
        start = 0;
        a = 0;
        b = 0;
        precision = 8;
        dvfs_v_state = 2'b11; // Default to High Voltage (Div by 1)
        
        #20 rst = 0; // Release reset
        #10;

        // =========================================================================
        // TEST 1: High Voltage (Max Speed) + Full Precision
        // Voltage = 2'b11 (No division), Precision = 8 (Full accuracy)
        // Math: 25 * 10 = 250
        // =========================================================================
        $display("\nTEST 1: High Voltage (Max Speed), Full Precision");
        a = 8'd25;
        b = 8'd10;
        precision = 4'd8;
        dvfs_v_state = 2'b11; 
        
        start = 1;
        #10 start = 0;
        start_time = $time;

        wait(done); // Pause testbench until the DUT signals it is done
        end_time = $time;
        
        $display("Result: %d (Expected: 250)", result);
        $display("Time Taken: %0d ns", (end_time - start_time));

        #30; // Wait a few cycles before next test

        // =========================================================================
        // TEST 2: Low Voltage (Slower Speed) + Full Precision
        // Voltage = 2'b01 (Divide clk by 4), Precision = 8 (Full accuracy)
        // Math: 25 * 10 = 250
        // =========================================================================
        $display("\nTEST 2: Low Voltage (Div/4 Speed), Full Precision");
        a = 8'd25;
        b = 8'd10;
        precision = 4'd8;
        dvfs_v_state = 2'b01; // << Dropping the voltage state
        
        start = 1;
        #10 start = 0;
        start_time = $time;

        wait(done);
        end_time = $time;
        
        $display("Result: %d (Expected: 250)", result);
        $display("Time Taken: %0d ns  <-- Notice it takes exactly 4x longer!", (end_time - start_time));

        #30;

        // =========================================================================
        // TEST 3: High Voltage + Approximate Math (Tunable Precision)
        // Voltage = 2'b11 (No division), Precision = 4 (Stops halfway)
        // Math: 255 * 128 (Binary 11111111 * 10000000)
        // =========================================================================
        $display("\nTEST 3: High Voltage, Low Precision (Approximate Math)");
        a = 8'd255;
        b = 8'd128; // The MSB is 1, so the largest chunk is calculated first
        precision = 4'd4; // << Asking the hardware to stop halfway through
        dvfs_v_state = 2'b11; 
        
        start = 1;
        #10 start = 0;
        start_time = $time;

        wait(done);
        end_time = $time;
        
        $display("Result: %d (Perfect Answer is 32640)", result);
        $display("Time Taken: %0d ns <-- Notice it finished in half the time compared to Test 1!", (end_time - start_time));

        #50;
        $display("\n--- Simulation Complete ---");
        $finish;
    end

endmodule
