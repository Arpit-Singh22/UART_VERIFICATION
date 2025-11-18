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
		@(posedge vif.PCLK);
		vif.PADDR  = tx.addr;
		vif.PWDATA = tx.data;
		vif.PWRITE = tx.write;
		vif.PENABLE = 1;
		vif.PSEL   	= 1;
		
		wait (vif.PREADY == 1);
		@(posedge vif.PCLK);
		vif.PADDR  = 0; 
		vif.PWDATA = 0; 
		vif.PWRITE = 0; 
	endtask
endclass
