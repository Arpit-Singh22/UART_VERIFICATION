`include "uvm_pkg.sv"
import uvm_pkg::*;
`include "../common/uart_common.sv"
`include "../top/wb_intf.sv"
`include "../rtl/uart_top.v"

`include "../master/wb_tx.sv"
`include "../master/uart_seq.sv"
`include "../master/uart_sqr.sv"
`include "../master/uart_driver.sv"
`include "../master/uart_agent.sv"

`include "../top/uart_env.sv"
`include "../top/uart_test_lib.sv"
`include "../top/top.sv"
