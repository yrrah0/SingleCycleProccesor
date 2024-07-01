onerror {quit -f}
vlib work
vlog -work work SingleCycle.vo
vlog -work work SingleCycle.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate work.fullAdder_vlg_vec_tst
vcd file -direction SingleCycle.msim.vcd
vcd add -internal fullAdder_vlg_vec_tst/*
vcd add -internal fullAdder_vlg_vec_tst/i1/*
add wave /*
run -all
