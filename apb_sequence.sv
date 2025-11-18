class base_seq extends uvm_sequence#(apb_tx);
	`uvm_object_utils(base_seq)
	`NEW_OBJ

	task body_phase(uvm_phase phase);
		`uvm_do(req)
	endtask
endclass
