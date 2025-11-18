interface apb_intf (input logic PCLK, PRESETn);

    logic [31:0] PADDR;
    logic [31:0] PWDATA;
    logic [31:0] PRDATA;
    logic PWRITE;
    logic PENABLE;
    logic PSEL;
    logic PREADY;
    logic PSLVERR;

    // UART pins
    logic TXD;
    logic RXD;

    logic nRTS;
    logic nDTR;
    logic nOUT1;
    logic nOUT2;

    logic nCTS;
    logic nDSR;
    logic nDCD;
    logic nRI;

    logic IRQ;
    logic baud_o;

endinterface

