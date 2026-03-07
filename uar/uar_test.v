module mytest_tb;
        reg   clk, gl_reset, dIn;
        wire  [7:0] dOut;
        wire  dReady, dError;

        reg [7:0] inWord;

        uar mod1 (dOut, dReady, dError, clk, gl_reset, dIn);

        always #5 clk = ~clk;

        initial begin

             #0
             clk = 0;
             gl_reset = 1;
             inWord = 0;
             dIn = 1;
             #10
             gl_reset = 0;

             #80
             repeat (4) begin
                  // start of cycle

                  inWord = {$random} /2 % 128;
                  dIn = 1;

                  #80
                  dIn = 0;
                  #80
                  $display ("inWord = %b", inWord, $time);
                  repeat (8) begin
                       dIn    <= inWord[0];
                       inWord <= inWord >> 1;
                       #80;
                       end
                  $display ("outWord = %b (%b %b)", dOut, dReady, dError);
                  end
             // error condition 1
             dIn = 1;
             #80
             dIn = 0;
             #800
             $display ("outWord = %b (%b %b)", dOut, dReady, dError);
             $finish;
             end
        endmodule
