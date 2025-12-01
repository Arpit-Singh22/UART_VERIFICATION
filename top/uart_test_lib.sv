class uart_base_test extends uvm_test;
	`uvm_component_utils(uart_base_test)
	`NEW_COMP
	uart_env env;

	function void build();
		env = uart_env::type_id::create("env", this);
	endfunction

	function void end_of_elaboration();
		uvm_top.print_topology();
	endfunction

	endclass

`define UART_TEST(TEST, SEQ)\
class TEST extends uart_base_test;\
	`uvm_component_utils(TEST)\
	`NEW_COMP\
\
	task run_phase(uvm_phase phase);\
		SEQ seq = SEQ::type_id::create("seq");\
		super.run_phase(phase);\
		phase.raise_objection(this);\
		seq.start(env.agent.sqr);\
		phase.phase_done.set_drain_time(this, 10000);\
		phase.drop_objection(this);\
	endtask\
endclass

`UART_TEST(uart_reg_reset_test, uart_reg_reset_seq )
`UART_TEST(uart_tx_byte_test, uart_tx_byte_seq )
