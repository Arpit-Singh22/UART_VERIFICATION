class uart_env extends uvm_env;
	`uvm_component_utils(uart_env)
	`NEW_COMP
	uart_agent agent;

	function void build();
		agent = uart_agent::type_id::create("agent", this);
	endfunction
endclass
