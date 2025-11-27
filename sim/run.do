vlog list.svh +incdir+C:/uvm-1.2/src \
+define+UART_HAS_BAUDRATE_OUTPUT 
vsim -novopt -suppress 12110 top \
-sv_lib C:/questasim64_2024.1/uvm-1.2/win64/uvm_dpi
add wave -r sim:/top/dut/*
#do wave.do
run -all
