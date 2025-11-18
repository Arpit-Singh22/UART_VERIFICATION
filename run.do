vlog list.svh +incdir+C:/uvm-1.2/src
vsim -novopt -suppress 12110 top\
-sv_lib C:/questasim64_2024.1/uvm-1.2/win64/uvm_dpi
add wave -position insertpoint sim:/top/dut/*
run -all
