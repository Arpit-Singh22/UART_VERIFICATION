class apb_driver extends uvm_driver#(apb_tx);
	`uvm_component_utils(apb_driver)
	`NEW_COMP

	virtual apb_intf vif;
	apb_tx tx;
	
	function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if (!uvm_config_db#(virtual apb_intf)::get(this, "", "vif", vif))
            `uvm_fatal("NOVIF", "apb_if not found")
    endfunction

	task run_phase(uvm_phase phase);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

	task drive_tx(apb_tx tx);
	endtask
endclass
