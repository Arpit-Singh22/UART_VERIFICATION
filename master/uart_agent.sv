class uart_agent extends uvm_agent;
	`uvm_component_utils(uart_agent)
	`NEW_COMP
	uart_sqr	sqr;
	uart_driver drv;

	function void build();
		sqr = uart_sqr::type_id::create("sqr", this);
		drv = uart_driver::type_id::create("drv", this);
	endfunction

	function void connect();
		drv.seq_item_port.connect(sqr.seq_item_export);
	endfunction
endclass
