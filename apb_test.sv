class test_lib extends uvm_test;
    `uvm_component_utils(test_lib)
	`NEW_COMP

    apb_env env;

    function void build_phase(uvm_phase phase);
        env = apb_env::type_id::create("env", this);
    endfunction

    task run_phase(uvm_phase phase);
        base_seq seq= base_seq::type_id::create("seq");
        phase.raise_objection(this);
        seq.start(env.agent.sqr);
		phase.phase_done.set_drain_time(this,100);
        phase.drop_objection(this);
    endtask

endclass

