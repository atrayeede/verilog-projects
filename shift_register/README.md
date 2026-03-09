# 8-bit Bidirectional Shift Register

## Design Overview

This module handles both serial and parallel data movement in multiple directions.

-The purpose of a bidirectional shift register is to shift data (bits) on a single register both in left and right directions.
-At the positive edge of the clock the 8-bit bidirectional shift register checks two conditions, if Enable (EN) is 0 or Write (WR) is 0.
-If EN is 0, the data bit (SI) serially enters the most significant bit (MSB) of the register shift_reg.
-The previous data gets shifted by one position to the right and the data at the least significant bit (LSB) of shift_reg is pushed serially into SO as the output.
-If WR is 0, the data gets pushed parallelly onto shift_reg and hence acts as a parallel input output.
-If both EN and WR are 0 then we print an error message as both pins cannot be active simultaneously.

## Synthesis Reports

| Metric           | Value       |
| :--------------- | :---------- |
| **Timing Slack** | 3784ps      |
| **Total Area**   | 222.650     |
| **Total Power**  | 3.90955e-05 |
