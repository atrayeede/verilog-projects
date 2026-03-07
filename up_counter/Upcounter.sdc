# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Tue Jan 13 20:11:15 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design async_up_counter

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports reset]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports clk]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {count[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {count[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {count[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {count[3]}]
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb2]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb1]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb4]
