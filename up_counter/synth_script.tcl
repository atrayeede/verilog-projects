set_attribute init_lib_search_path /home/vlsi3/Downloads/scl_pdk/stdlib/fs120/liberty/lib_flow_ss
#set_attribute library {slow.lib fast.lib typical.lib}
set_attribute library tsl18fs120_scl_ss.lib
set_attribute init_hdl_search_path /home/vlsi3/Desktop/rashmi_24EC8030/4-BitUpCounter/Simulation
#set_attribute lef_library {gsclib090_macro.lef gsclib090_tech.lef}
set_attribute information_level 6
set myFiles [list upCount.v]
set basename async_up_counter
set myClk clk
set myPeriod_ps 5000
set myInDelay_ns 1
set myOutDelay_ns 1
set runname synth_report
read_hdl ${myFiles}
elaborate ${basename}
set clock [define_clock -period ${myPeriod_ps} -name ${myClk} [clock_ports]]
external_delay -input $myInDelay_ns -clock ${myClk} [find / -port ports_in/*]
external_delay -output $myOutDelay_ns -clock ${myClk} [find / -port ports_out/*]
dc::set_clock_transition .1 $myClk
check_design -unresolved
report timing -lint
set_attribute syn_generic_effort high
set_attribute syn_map_effort high
set_attribute syn_opt_effort high
syn_generic
syn_map
syn_opt
write_hdl >> Upcounter_netlist.v
write_sdc >> Upcounter.sdc
report_timing >> Upcounter_timing.rpt
report_gates >> Upcounter_area.rpt
report_power >> Upcounter_power.rpt
