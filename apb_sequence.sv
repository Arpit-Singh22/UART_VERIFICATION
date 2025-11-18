class base_seq extends uvm_sequence#(apb_tx);
	`uvm_object_utils(base_seq)
	`NEW_OBJ
endclass

class uart_reset_seq extends base_seq;
	`uvm_object_utils(uart_reset_seq)
	`NEW_OBJ
	 bit [31:0] data_t;

	task body();
		//IER => 0
		`uvm_do_with(req, {req.addr==32'h04;req.write==1'b0;})

		//IIR => 0
		`uvm_do_with(req, {req.addr==32'h08;req.write==1'b0;})
		//LCR
		`uvm_do_with(req, {req.addr==32'h0c;req.write==1'b0;})
		//MCR
		`uvm_do_with(req, {req.addr==32'h10;req.write==1'b0;})
		//LSR
		`uvm_do_with(req, {req.addr==32'h14;req.write==1'b0;})
		//MSR
		`uvm_do_with(req, {req.addr==32'h18;req.write==1'b0;})
		//SCR
		`uvm_do_with(req, {req.addr==32'h1C;req.write==1'b0;})
		//DLL
		`uvm_do_with(req, {req.addr==32'h20;req.write==1'b0;})
		//DLH
		`uvm_do_with(req, {req.addr==32'h24;req.write==1'b0;})
		//REVID1
		`uvm_do_with(req, {req.addr==32'h28;req.write==1'b0;})
		//REVID2
		`uvm_do_with(req, {req.addr==32'h2C;req.write==1'b0;})
		//PWREMU_MGMT
		`uvm_do_with(req, {req.addr==32'h30;req.write==1'b0;})
		//MDR
		`uvm_do_with(req, {req.addr==32'h34;req.write==1'b0;})
	endtask
endclass

class uart_reg_rw_seq extends base_seq;
	`uvm_object_utils(uart_reg_rw_seq)
	`NEW_OBJ

endclass
