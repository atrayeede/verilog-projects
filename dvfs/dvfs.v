`timescale 1ns / 1ps

module dvfs_tunable_multiplier #(parameter WIDTH = 8) (
    input wire clk_in,          // High-speed system clock
    input wire rst,
    input wire start,
    input wire [WIDTH-1:0] a,
    input wire [WIDTH-1:0] b,
    input wire [3:0] precision, 
    input wire [1:0] dvfs_v_state, // 00=Ultra-Low Voltage, 01=Low, 10=Medium, 11=High Voltage
    output reg [2*WIDTH-1:0] result,
    output reg done
);

    // --- FREQUENCY DIVIDER REGISTERS ---
    reg [2:0] div_counter;
    wire clk_en; // Acts as our divided, voltage-scaled clock

    // --- MULTIPLIER REGISTERS ---
    reg [WIDTH-1:0] b_reg;
    reg [2*WIDTH-1:0] shifted_a;
    reg [3:0] cycle_count;
    reg state; // 0 = IDLE, 1 = COMPUTE

    // =========================================================================
    // BLOCK 1: THE PROGRAMMABLE FREQUENCY DIVIDER
    // Simulates the oscillator slowing down as the voltage drops.
    // =========================================================================
    
    // A simple free-running counter to track the high-speed system clock
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            div_counter <= 0;
        end else begin
            div_counter <= div_counter + 1;
        end
    end

    // The multiplexer that selects the division ratio based on the voltage state
    assign clk_en = (dvfs_v_state == 2'b11) ? 1'b1 :                              // High V: No division (runs at full speed)
                    (dvfs_v_state == 2'b10) ? (div_counter[0] == 1'b1) :          // Med V: Divide by 2
                    (dvfs_v_state == 2'b01) ? (div_counter[1:0] == 2'b11) :       // Low V: Divide by 4
                                              (div_counter[2:0] == 3'b111);       // Ultra-Low V: Divide by 8

    // =========================================================================
    // BLOCK 2: THE MULTIPLIER LOGIC
    // Now gated by the frequency divider (clk_en) instead of running raw.
    // =========================================================================
    
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            result <= 0;
            done <= 0;
            state <= 0;
            cycle_count <= 0;
        end else if (clk_en) begin // << THE MATH ONLY HAPPENS ON THE DIVIDED CLOCK PULSE
            
            case (state)
                0: begin // IDLE
                    done <= 0;
                    if (start) begin
                        result <= 0;
                        b_reg <= b;
                        shifted_a <= { {WIDTH{1'b0}}, a } << (WIDTH - 1);
                        cycle_count <= 0;
                        state <= 1;
                    end
                end
                
                1: begin // COMPUTE
                    if (cycle_count < precision && cycle_count < WIDTH) begin
                        if (b_reg[WIDTH - 1 - cycle_count]) begin
                            result <= result + shifted_a;
                        end
                        shifted_a <= shifted_a >> 1;
                        cycle_count <= cycle_count + 1;
                    end else begin
                        done <= 1;
                        state <= 0;
                    end
                end
            endcase
            
        end // end of clk_en block
    end
endmodule
