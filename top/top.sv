module top;
	logic clk,rst;

	wb_intf pif(clk,rst);

	uart_top dut(	
	.wb_clk_i(pif.clk),
	.wb_rst_i(pif.wb_rst_i),
	.wb_adr_i(pif.wb_addr_i),
	.wb_dat_i(pif.wb_dat_i),
	.wb_dat_o(pif.wb_dat_o),
	.wb_we_i(pif.wb_we_i),
	.wb_stb_i(pif.wb_stb_i),
	.wb_cyc_i(pif.wb_cyc_i),
	.wb_ack_o(pif.wb_ack_o),
	.wb_sel_i(pif.wb_sel_i),
	.int_o(pif.int_o),

	.stx_pad_o(pif.stx_pad_o),
	.srx_pad_i(pif.srx_pad_i),
	.rts_pad_o(pif.rts_pad_o),
	.cts_pad_i(pif.cts_pad_i),
	.dtr_pad_o(pif.dtr_pad_o),
	.dsr_pad_i(pif.dsr_pad_i),
	.ri_pad_i(pif.ri_pad_i),
	.dcd_pad_i(pif.dcd_pad_i),
	.baud_o(pif.baud_o)
	);
	always #5 clk=~clk;
	initial begin
		clk=0;
		rst=0;
		repeat(3) @(posedge clk);
		rst=1;
		//uvm_test("base_test");
		#1000 $finish;
	end
endmodule
