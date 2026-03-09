# Universal Asynchronous Receiver (UAR)

## Design Overview

This module acts as the receiving end of a UART interface, unpacking serial bit streams into parallel bytes.

-The UAR receives 8 bits of data input serially and outputs the byte parallelly.
-It takes 8 clock cycles of send 1 bit.
-So, it takes 8\*9 bits (including stop bit) = 72 clock cycles to send 1 byte of data.
-The 4-bit shift register shift_reg is set to 0 if the value of reset or gl_reset (global reset) is 1, that is, a new start bit is detected.
-The shift_reg slides each bit to the left and the first bit of the input data is input at the LSB of shift_reg.
-It triggers valid only when it sees a specific pattern: a 1 followed by two 0s.
-This helps filter out random noise during data transfer.
-At positive edge of clock cycle if enable is 0 then counter (count-reg) is set to 0, as soon as enable is set to 1, count-reg starts incrementing by 1.
-Now each8 checks the value of each bit at the 7th clock cycle (to filter out random noise at the edges of transmission, the bit is sampled during the middle of data transfer).
-count72 checks if the entire byte has been received.
-count8 tells the shift register to input a bit every 8 cycles, except when the counter hits 72.
-This prevents the receiver from trying to sample a 10th bit that doesn't exist after the transmission is finished.
-The serial in parallel out shift register takes a bit as input serially after 8 clock cycles and outputs it parallelly after 72 clock cycles.
-If value of reset is 1 then the error flags dReady and dError are set to 0.
-The stop bit has to be high (1) to signify that the transmission has been successful.
-Hence dReady as 1 and dError as 0 signifies that the data transmission has worked right.
-Else it flags an error.
-Running acts as the enable input for the counter and start-detect modules.

## Synthesis Reports

| Metric           | Value       |
| :--------------- | :---------- |
| **Timing Slack** | 2655ps      |
| **Total Area**   | 2232.750    |
| **Total Power**  | 3.28805e-04 |
