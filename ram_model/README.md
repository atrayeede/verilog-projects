# Simple RAM Model

## Design Overview

This module implements a basic RAM architecture with conditional read/write functionality.

-CS (chip select): if its value is 1 the pin is disabled.
-WE (write enable): data is saved in memory.
-OE (output enable): data is displayed as output from memory.
-The RAM model checks if the Chip Select (CS) and Write Enable (WE) are 0.
-If they're both 0 then the data is stored at a particular memory location.
-If WE and OE are enabled both at the same time then the system throws an error.

## Synthesis Reports

| Metric           | Value         |
| :--------------- | :------------ |
| **Timing Slack** | UNCONSTRAINED |
| **Total Area**   | 175.610       |
| **Total Power**  | 5.07361e-06   |
