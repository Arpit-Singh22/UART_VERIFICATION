class apb_tx extends uvm_sequence_item;

    rand bit        write; 
    rand bit [7:0]  addr;
    rand bit [31:0] data;

    `uvm_object_utils_begin(apb_tx)
		`uvm_field_int(write, UVM_ALL_ON)
		`uvm_field_int(addr, UVM_ALL_ON)
		`uvm_field_int(data, UVM_ALL_ON)
    `uvm_object_utils_end
	`NEW_OBJ
endclass

