onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /top/dut/wb_clk_i
add wave -noupdate /top/dut/wb_rst_i
add wave -noupdate /top/dut/wb_adr_i
add wave -noupdate /top/dut/wb_dat_i
add wave -noupdate /top/dut/wb_dat_o
add wave -noupdate /top/dut/wb_we_i
add wave -noupdate /top/dut/wb_stb_i
add wave -noupdate /top/dut/wb_cyc_i
add wave -noupdate /top/dut/wb_sel_i
add wave -noupdate /top/dut/wb_ack_o
add wave -noupdate /top/dut/int_o
add wave -noupdate /top/dut/srx_pad_i
add wave -noupdate /top/dut/stx_pad_o
add wave -noupdate /top/dut/rts_pad_o
add wave -noupdate /top/dut/cts_pad_i
add wave -noupdate /top/dut/dtr_pad_o
add wave -noupdate /top/dut/dsr_pad_i
add wave -noupdate /top/dut/ri_pad_i
add wave -noupdate /top/dut/dcd_pad_i
add wave -noupdate /top/dut/baud_o
add wave -noupdate -expand -group REGS /top/dut/ier
add wave -noupdate -expand -group REGS /top/dut/iir
add wave -noupdate -expand -group REGS /top/dut/fcr
add wave -noupdate -expand -group REGS /top/dut/mcr
add wave -noupdate -expand -group REGS /top/dut/lcr
add wave -noupdate -expand -group REGS /top/dut/msr
add wave -noupdate -expand -group REGS /top/dut/lsr
add wave -noupdate /top/dut/wb_dat8_i
add wave -noupdate /top/dut/wb_dat8_o
add wave -noupdate /top/dut/wb_dat32_o
add wave -noupdate /top/dut/wb_adr_int
add wave -noupdate /top/dut/we_o
add wave -noupdate /top/dut/re_o
add wave -noupdate /top/dut/rf_count
add wave -noupdate /top/dut/tf_count
add wave -noupdate /top/dut/tstate
add wave -noupdate /top/dut/rstate
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {3529 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {310800 ps}
