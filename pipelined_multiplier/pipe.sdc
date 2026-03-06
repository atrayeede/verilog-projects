# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Sat Jan 10 16:46:53 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design mult_piped_8x8_2sC

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports clk]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {b[7]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[3]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[4]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[5]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[6]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {a[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {y[15]}]
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb2]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb1]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb4]
