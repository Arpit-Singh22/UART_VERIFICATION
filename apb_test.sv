class base_test extends uvm_test;
    `uvm_component_utils(base_test)
	`NEW_COMP

    apb_env env;

    function void build_phase(uvm_phase phase);
        env = apb_env::type_id::create("env", this);
    endfunction
endclass

`UART_TEST(uart_reset_test, uart_reset_seq)

