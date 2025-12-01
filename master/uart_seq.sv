class uart_base_seq extends uvm_sequence#(wb_tx);
	`uvm_object_utils(uart_base_seq)
	`NEW_OBJ
	bit [7:0] data_t;
endclass

class uart_reg_reset_seq extends uart_base_seq;
	`uvm_object_utils(uart_reg_reset_seq)
	`NEW_OBJ

	task body();
		//THR
		`uvm_do_with(req, {req.addr==32'h0; req.wr_rd==0;})
		//IER                         
		`uvm_do_with(req, {req.addr==32'h1; req.wr_rd==0;})
		//FCR                         
		`uvm_do_with(req, {req.addr==32'h2; req.wr_rd==0;})
		//LCR                         
		`uvm_do_with(req, {req.addr==32'h3; req.wr_rd==0;})
		//MCR                         
		`uvm_do_with(req, {req.addr==32'h4; req.wr_rd==0;})
		//LSR                         
		`uvm_do_with(req, {req.addr==32'h5; req.wr_rd==0;})
		//MSR
		`uvm_do_with(req, {req.addr==32'h6; req.wr_rd==0;})
	endtask
endclass

class uart_tx_byte_seq extends uart_base_seq;
	`uvm_object_utils(uart_tx_byte_seq)
	`NEW_OBJ

	task body();
		//LCR        allow access to divisor
		data_t = {1'b0,1'b1, 6'b0};
		`uvm_do_with(req, {req.addr==3; req.wr_rd==1; req.data==data_t;})
		
		//DLL (lsb)
		data_t = 8'h8B;
		`uvm_do_with(req, {req.addr==0; req.wr_rd==1; req.data==data_t;})
		//DLM (msb)
		data_t = 8'h02;
		`uvm_do_with(req, {req.addr==1; req.wr_rd==1; req.data==data_t;})
		//LCR   
		data_t = 8'h03;
		`uvm_do_with(req, {req.addr==3; req.wr_rd==1; req.data==data_t;})
		////IER
		data_t = {4'b0, 4'b1};
		`uvm_do_with(req, {req.addr==1; req.wr_rd==1; req.data==data_t;})

		//FCR
		`uvm_do_with(req, {req.addr==2; req.wr_rd==1; req.data==8'h00;})
		
		//THR
		for(int i=0;i<2;i++) begin `uvm_do_with(req, {req.addr==0; req.wr_rd==1; req.data==i;})
		end
	endtask
endclass
