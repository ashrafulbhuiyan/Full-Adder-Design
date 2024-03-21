#set_db lib_search_path ../../lib/
#set_db hdl_search_path ../../rtl/
set_db library slow_vdd1v0_basicCells_hvt.lib
read_hdl full_adder.v
elaborate
#read_sdc ../constraints/alu.g
read_sdc full_adder.g
synthesize -to_mapped -effort high
write_hdl > full_adder_netlist.v
write_sdc > full_adder_ckt.sdc
report_timing > fa_timing.rep
report_area > fa_area.rep
report_power > fa_power.rep
