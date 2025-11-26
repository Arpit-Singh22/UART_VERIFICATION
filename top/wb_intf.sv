interface wb_interface(input wb_clk_i,wb_rst_i);
	bit [4:0] wb_addr_i;
	bit [3:0] wb_sel_i;
	bit [7:0] wb_dat_i;
	bit [7:0] wb_dat_o;
	bit 	  wb_we_i;
	bit		  wb_stb_i;
	bit		  wb_cyc_i;
	bit		  wb_ack_o;
	bit		  int_o;
	bit		  baud_o;

	bit stx_pad_o;
	bit	srx_pad_i;
    bit rts_pad_o;
    bit cts_pad_i;
    bit dtr_pad_o;
    bit dsr_pad_i;
    bit ri_pad_i;
    bit dcd_pad_i;
endinterface
