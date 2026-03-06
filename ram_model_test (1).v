module RamChip_tb;

    // Parameters
    parameter ADDR_SIZE = 4; // Testing with 4-bit address (16 locations)
    parameter WORD_SIZE = 8; // Testing with 8-bit data

    // Inputs (Reg in TB)
    reg [ADDR_SIZE-1:0] Address;
    reg CS, WE, OE;
    
    // Bidirectional Data Bus
    wire [WORD_SIZE-1:0] Data;
    reg [WORD_SIZE-1:0] Data_reg; // Internal reg to drive the inout bus

    // Instantiate the Unit Under Test (UUT)
    RamChip #(
        .AddressSize(ADDR_SIZE),
        .WordSize(WORD_SIZE)
    ) uut (
        .Address(Address),
        .Data(Data),
        .CS(CS),
        .WE(WE),
        .OE(OE)
    );

    // Continuous assignment for bidirectional bus:
    // Drive 'Data' with 'Data_reg' only when WE is active (0) and OE is inactive (1)
    assign Data = (!CS && !WE) ? Data_reg : {WORD_SIZE{1'bz}};

    initial begin
        // Initialize Signals (Signals are Active Low based on your code logic)
        CS = 1; WE = 1; OE = 1;
        Address = 0;
        Data_reg = 0;

        $display("Starting RamChip Test...");
        #10;

        // --- Task 1: Write Data to Address 4 ---
        $display("Writing 8'hA5 to Address 4");
        CS = 0; WE = 0; OE = 1;    // Enable Chip and Write
        Address = 4;
        Data_reg = 8'hA5;
        #10;
        CS = 1; WE = 1;           // Disable
        #10;

        // --- Task 2: Read Data from Address 4 ---
        $display("Reading from Address 4");
        CS = 0; WE = 1; OE = 0;    // Enable Chip and Output
        Address = 4;
        #5;
        $display("Data Read: %h (Expected A5)", Data);
        #5;
        CS = 1; OE = 1;
        #10;

        // --- Task 3: Trigger Error (OE and WE both active) ---
        $display("Testing Error Condition (OE and WE low)...");
        CS = 0; WE = 0; OE = 0; 
        #10;
        
        $display("Test Complete.");
        $finish;
    end

endmodule
