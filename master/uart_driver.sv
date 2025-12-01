class uart_driver extends uvm_driver#(wb_tx);
	virtual wb_interface vif;
	`uvm_component_utils(uart_driver)
	`NEW_COMP
	
	function void build();
		if(!uvm_config_db#(virtual wb_interface)::get(this, "","vif", vif))
			`uvm_error("INTFERR", "inteface handle error in driver")
	endfunction

	task run_phase(uvm_phase phase);
		wait (vif.wb_rst_i == 0);
		forever begin
			seq_item_port.get_next_item(req);
			drive_tx(req);
			req.print();
			seq_item_port.item_done();
		end
	endtask

		task drive_tx(wb_tx tx);
			@(posedge vif.wb_clk_i);
			vif.wb_addr_i = tx.addr;
			vif.wb_we_i  = tx.wr_rd;
			vif.wb_sel_i = 4'b0001;
			vif.wb_stb_i = 1'b1;
			vif.wb_cyc_i = 1'b1;

			if (tx.wr_rd == 1) vif.wb_dat_i = tx.data;
			wait (vif.wb_ack_o == 1'b1);
			if(tx.wr_rd == 0 ) tx.data = vif.wb_dat_o;

			@(posedge vif.wb_clk_i);
			vif.wb_stb_i = 0; 
			vif.wb_cyc_i = 0; 

			@(posedge vif.wb_clk_i);
			vif.wb_addr_i = 0; 
			vif.wb_dat_i = 0;
			vif.wb_sel_i = 0; 
	endtask	
endclass
