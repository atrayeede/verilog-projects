# 4-bit Asynchronous Up Counter

## Design Overview

This is a ripple counter design where clock signals cascade through the flip-flop stages.

- It counts pulses in an upward sequence eg.0, 1, 2, 3....
  -The clock signal is not shared by all flip-flops.
  -Instead, the output of one flip-flop serves as the clock for the next one.
  -Every time a clock pulse is received the output toggles (0 changes to 1 and 1 changes to 0).
  -The state change only occurs when the clock changes from high to low.
  -If reset is 1 then the state changes to 0 regardless of the clock signal.
  -Each stage uses the output of the previous stage as its clock.
  -tff[0] is the LSB and toggles upon the signals of the external clock. tff[1] uses the signals of tff[0] as its clock that is, it changes its state when tff[0] falls from 1 to 0, and so on.

## Synthesis Reports

| Metric           | Value       |
| :--------------- | :---------- |
| **Timing Slack** | 1895ps      |
| **Total Area**   | 294.790     |
| **Total Power**  | 1.29075e-05 |
