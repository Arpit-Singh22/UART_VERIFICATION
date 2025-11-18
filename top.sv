module top;
    logic clk;
    logic rst_n;

    apb_intf pif(clk, rst_n);

    always #5 clk = ~clk;

    initial begin
		clk = 0;
        rst_n = 0;
        repeat(3) @(posedge clk) rst_n = 1;
    end

    // DUT Instantiation (Correct Ports)
    uart_16550 dut (
        .PCLK    (clk),
        .PRESETn (rst_n),
        .PADDR   (pif.PADDR),
        .PWDATA  (pif.PWDATA),
        .PRDATA  (pif.PRDATA),
        .PWRITE  (pif.PWRITE),
        .PENABLE (pif.PENABLE),
        .PSEL    (pif.PSEL),
        .PREADY  (pif.PREADY),
        .PSLVERR (pif.PSLVERR),

        .IRQ     (pif.IRQ),

        .TXD     (pif.TXD),
        .RXD     (pif.RXD),

        .nRTS    (pif.nRTS),
        .nDTR    (pif.nDTR),
        .nOUT1   (pif.nOUT1),
        .nOUT2   (pif.nOUT2),

        .nCTS    (pif.nCTS),
        .nDSR    (pif.nDSR),
        .nDCD    (pif.nDCD),
        .nRI     (pif.nRI),

        .baud_o  (pif.baud_o)
    );

    initial begin
        uvm_config_db#(virtual apb_intf)::set(null, "*", "vif", pif);
        run_test("uart_reset_test");
    end
endmodule

