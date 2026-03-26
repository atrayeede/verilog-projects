# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Fri Mar 20 18:51:39 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design dvfs_tunable_multiplier

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk_in]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {dvfs_v_state[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {dvfs_v_state[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[3]}]
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
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports start]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports clk_in]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports done]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[15]}]
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb2]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb1]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb4]
# ####################################################################

#  Created by Genus(TM) Synthesis Solution 21.14-s082_1 on Sun Mar 22 20:31:07 IST 2026

# ####################################################################

set sdc_version 2.0

set_units -capacitance 1000fF
set_units -time 1000ps

# Set the current design
current_design dvfs_tunable_multiplier

create_clock -name "clk" -period 5.0 -waveform {0.0 2.5} [get_ports clk_in]
set_clock_transition 0.1 [get_clocks clk]
set_clock_gating_check -setup 0.0 
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {dvfs_v_state[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {dvfs_v_state[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[0]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[1]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[2]}]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {precision[3]}]
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
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports start]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports rst]
set_input_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports clk_in]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports done]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[0]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[1]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[2]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[3]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[4]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[5]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[6]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[7]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[8]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[9]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[10]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[11]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[12]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[13]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[14]}]
set_output_delay -clock [get_clocks clk] -add_delay 0.001 [get_ports {result[15]}]
set_wire_load_mode "enclosed"
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb2]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb1]
set_dont_use true [get_lib_cells tsl18fs120_scl_ss/slbhb4]
