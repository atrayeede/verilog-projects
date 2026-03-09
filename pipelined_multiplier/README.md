# 8-bit Pipelined Multiplier

## Design Overview

This module implements an efficient pipelined approach to 8-bit binary multiplication.

-Multiplication of each bit is carried out at every step.
-This makes the process of multiplication more efficient.
-The input digits are checked for their sign.
-If they're positive (MSB is 0) they're multiplied as is, but if they're negative (MSB is 1) they're first subtracted from 2 raised to the power of 7 (128) and then multiplied.
-The result is also checked for its sign and if negative it's subtracted from 32768 to make the answer positive (2's complement).

## Synthesis Reports

| Metric           | Value       |
| :--------------- | :---------- |
| **Timing Slack** | 0ps         |
| **Total Area**   | 14729.000   |
| **Total Power**  | 3.07939e-03 |
