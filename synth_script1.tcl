set_attribute init_lib_search_path /home/vlsi3/Downloads/scl_pdk/stdlib/fs120/liberty/lib_flow_ss
#set_attribute library {slow.lib fast.lib typical.lib}
set_attribute library tsl18fs120_scl_ss.lib
set_attribute init_hdl_search_path /home/vlsi3/Desktop/rashmi_24EC8030/simple_RAM_model/Simulation
#set_attribute lef_library {gsclib090_macro.lef gsclib090_tech.lef}
set_attribute information_level 6
set myFiles [list ram_model.v]
set basename RamChip
set runname synth_report
read_hdl ${myFiles}
elaborate ${basename}
check_design -unresolved
report timing -lint
set_attribute syn_generic_effort high
set_attribute syn_map_effort high
set_attribute syn_opt_effort high
syn_generic
syn_map
syn_opt
write_hdl >> ram_model_netlist.v
write_sdc >> ram_model.sdc
report_timing >> ram_model_timing.rpt
report_gates >> ram_model_area.rpt
report_power >> ram_model_power.rpt
