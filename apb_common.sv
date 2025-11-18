`define NEW_COMP \
    function new(string name="uart_env", uvm_component parent=null); \
        super.new(name, parent); \
    endfunction

`define NEW_OBJ \
	function new(string name="apb_tx"); \
		super.new(name); \
	endfunction

`define UART_TEST(TESTNAME, SEQ) \
	class TESTNAME extends base_test; \
		`uvm_component_utils(TESTNAME) \
		`NEW_COMP \
					\
		task run_phase(uvm_phase phase); \
			SEQ seq = SEQ::type_id::create($sformatf(SEQ));	\
			phase.raise_objection(this); \
			seq.start(env.agent.sqr); \
			phase.phase_done.set_drain_time(this, 100); \
			phase.drop_objection(this); \
		endtask \
	endclass
