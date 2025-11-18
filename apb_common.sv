`define NEW_COMP \
    function new(string name="uart_env", uvm_component parent=null); \
        super.new(name, parent); \
    endfunction

`define NEW_OBJ \
	function new(string name="apb_tx"); \
		super.new(name); \
	endfunction

