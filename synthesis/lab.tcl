remove_design -all
set search_path {../lib}
set target_library {lsi_10k.db}
set link_library "* lsi_10k.db"

analyze -format verilog {../rtl/top.v ../rtl/fifo.v ../rtl/fsm.v ../rtl/register.v ../rtl/synchoniser.v}

elaborate router_top

link

check_design

current_design  router_top

compile_ultra

write_file -f verilog -hier -output router_netlist.v
