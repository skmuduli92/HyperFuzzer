
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 top level test bench                                   ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   top level test bench.                                      ////
////                                                              ////
////  To Do:                                                      ////
////   nothing                                                    ////
////                                                              ////
////  Author(s):                                                  ////
////      - Simon Teran, simont@opencores.org                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
////                                                              ////
//// Copyright (C) 2000 Authors and OPENCORES.ORG                 ////
////                                                              ////
//// This source file may be used and distributed without         ////
//// restriction provided that this copyright statement is not    ////
//// removed from the file and that any derivative work contains  ////
//// the original copyright notice and the associated disclaimer. ////
////                                                              ////
//// This source file is free software; you can redistribute it   ////
//// and/or modify it under the terms of the GNU Lesser General   ////
//// Public License as published by the Free Software Foundation; ////
//// either version 2.1 of the License, or (at your option) any   ////
//// later version.                                               ////
////                                                              ////
//// This source is distributed in the hope that it will be       ////
//// useful, but WITHOUT ANY WARRANTY; without even the implied   ////
//// warranty of MERCHANTABILITY or FITNESS FOR A PARTICULAR      ////
//// PURPOSE.  See the GNU Lesser General Public License for more ////
//// details.                                                     ////
////                                                              ////
//// You should have received a copy of the GNU Lesser General    ////
//// Public License along with this source; if not, download it   ////
//// from http://www.opencores.org/lgpl.shtml                     ////
////                                                              ////
//////////////////////////////////////////////////////////////////////
//
// CVS Revision History
//
// $Log: not supported by cvs2svn $
// Revision 1.15  2003/06/05 17:14:27  simont
// Change test monitor from ports to external data memory.
//
// Revision 1.14  2003/06/05 12:54:38  simont
// remove dumpvars.
//
// Revision 1.13  2003/06/05 11:13:39  simont
// add FREQ paremeter.
//
// Revision 1.12  2003/04/16 09:55:56  simont
// add support for external rom from xilinx ramb4
//
// Revision 1.11  2003/04/10 12:45:06  simont
// defines for pherypherals added
//
// Revision 1.10  2003/04/03 19:20:55  simont
// Remove instruction cache and wb_interface
//
// Revision 1.9  2003/04/02 15:08:59  simont
// rename signals
//
// Revision 1.8  2003/01/13 14:35:25  simont
// remove wb_bus_mon
//
// Revision 1.7  2002/10/28 16:43:12  simont
// add module oc8051_wb_iinterface
//
// Revision 1.6  2002/10/24 13:36:53  simont
// add instruction cache and DELAY parameters for external ram, rom
//
// Revision 1.5  2002/10/17 19:00:50  simont
// add external rom
//
// Revision 1.4  2002/09/30 17:33:58  simont
// prepared header
//
//

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on
`include "oc8051_defines.v"
/*verilator coverage_off */

module oc8051_tb;


//parameter FREQ  = 20000; // frequency in kHz
//parameter FREQ  = 12000; // frequency in kHz

parameter DELAY = 50; // 500000/FREQ;

reg  rst, clk;
reg  [7:0] p0_in, p1_in, p2_in;
wire [15:0] ext_addr, iadr_o;
wire write, write_xram, write_uart, txd, rxd, int_uart, int0, int1, t0, t1, bit_out, stb_o, ack_i;
wire ack_xram, ack_uart, cyc_o, iack_i, istb_o, icyc_o, t2, t2ex;
wire [7:0] data_in, data_out, p0_out, p1_out, p2_out, p3_out, data_out_uart, data_out_xram, p3_in;
wire wbi_err_i, wbd_err_i;
wire priv_lvl;

/*verilator coverage_on */
wire [15:0] dpc_ot;
/*verilator coverage_off */
`ifdef OC8051_XILINX_RAMB
  reg  [31:0] idat_i;
`else
  wire [31:0] idat_i;
`endif

///
/// buffer for test vectors
///
//
// buffer
reg [23:0] buff [0:255];
wire [0:1] ea = 2'b11;

integer num;

assign wbd_err_i = 1'b0;
assign wbi_err_i = 1'b0;

// external code rom.
wire [15:0] cxrom_addr;
wire [31:0] cxrom_data_out;

oc8051_cxrom oc8051_cxrom1(
        .clk                ( clk            ),
        .rst                ( rst            ),
        .cxrom_addr         ( cxrom_addr     ),
        .cxrom_data_out     ( cxrom_data_out )
);


oc8051_symbolic_cxrom oc8051_symbolic_cxrom1 (
    .clk                  ( clk            ),
    .rst                  ( rst            )
//    .cxrom_addr           ( cxrom_addr     ),
//    .cxrom_data_out       ( cxrom_data_out )
);


//
// oc8051 controller
//
oc8051_top oc8051_top_1(.wb_rst_i(rst), .wb_clk_i(clk),
         .int0_i(int0), .int1_i(int1),

         .wbd_dat_i(data_in), .wbd_we_o(write), .wbd_dat_o(data_out),
         .wbd_adr_o(ext_addr), .wbd_err_i(wbd_err_i),
         .wbd_ack_i(ack_i), .wbd_stb_o(stb_o), .wbd_cyc_o(cyc_o),

         .wbi_adr_o(iadr_o), .wbi_stb_o(istb_o), .wbi_ack_i(iack_i),
         .wbi_cyc_o(icyc_o), .wbi_dat_i(idat_i), .wbi_err_i(wbi_err_i),

         .cxrom_addr            ( cxrom_addr     ),
         .cxrom_data_out        ( cxrom_data_out ),

         .priv_lvl              ( priv_lvl       ),
         .dpc_ot                ( dpc_ot         ),

  `ifdef OC8051_PROC1_SU_EN
         .su_en(1'b1),
  `endif

  `ifndef OC8051_PROC1_SU_EN
         .su_en(1'b0),
  `endif

  `ifdef OC8051_PORTS

   `ifdef OC8051_PORT0
         .p0_i(p0_in),
         .p0_o(p0_out),
   `endif

   `ifdef OC8051_PORT1
         .p1_i(p1_in),
         .p1_o(p1_out),
   `endif

   `ifdef OC8051_PORT2
         .p2_i(p2_in),
         .p2_o(p2_out),
   `endif

   `ifdef OC8051_PORT3
         .p3_i(p3_in),
         .p3_o(p3_out),
   `endif
  `endif


   `ifdef OC8051_UART
         .rxd_i(rxd), .txd_o(txd),
   `endif

   `ifdef OC8051_TC01
         .t0_i(t0), .t1_i(t1),
   `endif

   `ifdef OC8051_TC2
         .t2_i(t2), .t2ex_i(t2ex),
   `endif

         .ea_in(ea[0]));


  // termination fsms
    `ifdef OC8051_PORTS
        wire done, done0, done1, done2, done3;
        assign done = done0 && done1 && done2 && done3;
        // port 0
        `ifdef OC8051_PORT0
            termination_fsm tfsm0(
                .clk        (clk),
                .rst        (rst),
                .pout       (p0_out),
                .finished   (done0)
            );
        `else
            assign done0 = 0;
        `endif
        // port 1
        `ifdef OC8051_PORT1
            termination_fsm tfsm1(
                .clk        (clk),
                .rst        (rst),
                .pout       (p1_out),
                .finished   (done1)
            );
        `else
            assign done1 = 0;
        `endif
        // port 2
        `ifdef OC8051_PORT2
            termination_fsm tfsm2(
                .clk        (clk),
                .rst        (rst),
                .pout       (p2_out),
                .finished   (done2)
            );
        `else
            assign done2 = 0;
        `endif
        // port 3
        `ifdef OC8051_PORT3
            termination_fsm tfsm3(
                .clk        (clk),
                .rst        (rst),
                .pout       (p3_out),
                .finished   (done3)
            );
        `else
            assign done3 = 0;
        `endif
    `else
        wire done = 0;
    `endif

    always @(posedge done)
    begin
        $display("time ",$time, ": Read DONE signal on ports 0-3");
        #10 $finish;
    end

wire [15:0] proc0_addr;
wire [7:0] proc0_data_out;
wire [7:0] proc0_data_in;
wire proc0_stb, proc0_wr, proc0_ack;

fsm_writer fsm_writer_i(
    .clk(clk),
    .rst(rst),
    .addr(proc0_addr),
    .data_out(proc0_data_out),
    .data_in(proc0_data_in),
    .stb(proc0_stb),
    .wr(proc0_wr),
    .ack(proc0_ack)
);
wire [7:0] data_ignore;
wire ignore;
//
// external data ram
//

oc8051_xiommu oc8051_xiommu1 (.clk(clk), .rst(rst),
  .proc0_ack(proc0_ack),
  .proc0_stb(proc0_stb),
  .proc0_wr(proc0_wr),
  .proc0_addr(proc0_addr),
  .proc0_data_in(proc0_data_out),
  .proc0_data_out(proc0_data_in),

  .proc1_ack(ack_xram),
  .proc1_stb(stb_o),
  .proc1_wr(write_xram),
  .proc1_addr(ext_addr),
  .proc1_data_in(data_out),
  .proc1_data_out(data_out_xram),
  .priv_lvl0(priv_lvl),
  .priv_lvl1(1'b0),
  .dpc_ot0(dpc_ot),
  .dpc_ot1(16'b0)

);




`ifdef OC8051_SERIAL

//
// test programs with serial interface
//
oc8051_serial oc8051_serial1(.clk(clk), .rst(rst), .rxd(txd), .txd(rxd));

defparam oc8051_serial1.FREQ  = FREQ;
//defparam oc8051_serial1.BRATE = 9.6;
defparam oc8051_serial1.BRATE = 4.8;


`else

//
// external uart
//
oc8051_uart_test oc8051_uart_test1(.clk(clk), .rst(rst), .addr(ext_addr[7:0]), .wr(write_uart),
                  .wr_bit(p3_out[0]), .data_in(data_out), .data_out(data_out_uart), .bit_out(bit_out), .rxd(txd),
                  .txd(rxd), .ow(p3_out[1]), .intr(int_uart), .stb(stb_o), .ack(ack_uart));


`endif


//
//
//



assign write_xram = p3_out[7] & write;
assign write_uart = !p3_out[7] & write;
assign data_in = p3_out[7] ? data_out_xram : data_out_uart;
assign ack_i = p3_out[7] ? ack_xram : ack_uart;
assign p3_in = {6'h0, bit_out, int_uart};
assign t0 = p3_out[5];
assign t1 = p3_out[6];

assign int0 = p3_out[3];
assign int1 = p3_out[4];
assign t2 = p3_out[5];
assign t2ex = p3_out[2];

// For simulation only.
`ifdef OC8051_SIMULATION
initial
begin
    $dumpvars;
    clk = 0;
    rst = 1;
    #1000;
    rst = 0;
end

always
begin
    #5 clk = !clk;
end
`endif

endmodule

module termination_fsm(clk, rst, pout, finished);
    input clk;
    input rst;
    input [7:0] pout;
    output finished;

    reg [1:0] state;
    localparam STATE_INIT       = 2'd0;
    localparam STATE_DE_FOUND   = 2'd1;
    localparam STATE_AD_FOUND   = 2'd2;
    localparam STATE_00_FOUND   = 2'd3;

    assign finished = (state == STATE_00_FOUND);

    wire [1:0] state_init_next = (pout == 8'hDE) ? STATE_DE_FOUND : STATE_INIT;
    wire [1:0] state_de_next = (pout == 8'hDE) ? STATE_DE_FOUND :
                               (pout == 8'hAD) ? STATE_AD_FOUND : STATE_INIT;
    wire [1:0] state_ad_next = (pout == 8'hAD) ? STATE_AD_FOUND :
                               (pout == 8'h00) ? STATE_00_FOUND : STATE_INIT;
    wire [1:0] state_00_next = STATE_00_FOUND;

    always @(posedge clk)
    begin
        if (rst) begin
            state <= STATE_INIT;
        end
        else begin
            case (state)
                STATE_INIT      : state <= state_init_next;
                STATE_DE_FOUND  : state <= state_de_next;
                STATE_AD_FOUND  : state <= state_ad_next;
                STATE_00_FOUND  : state <= state_00_next;
                default         : state <= STATE_INIT;
            endcase
        end
    end
endmodule

module fsm_writer(clk, rst, stb, wr, addr, data_out, data_in, ack);
    input  clk, rst;
    output stb, wr;
    output [15:0] addr;
    output [7:0] data_out;
    input  [7:0] data_in;
    input  ack;

    reg [15:0] buf_addr [15:0];
    reg [7:0]  buf_data [15:0];
    reg [15:0] buf_delay[15:0];

    reg [10:0] ptr;
    reg [14:0] delay;
    reg        finished;

    always @(posedge clk)
    begin
        if (rst) begin
            ptr <= 4'b0;
            delay <= buf_delay[4'b0][15:1];
            finished <= 1'b0;
        end
        else
        begin
            if (finished) begin
                if (delay == 16'b0) begin
                    ptr <= ptr + 4'b1;
                    delay <= buf_delay[ptr + 4'b1][15:1];
                    if (buf_delay[ptr][0] == 1'b1) begin
                        buf_addr[ptr] <= buf_addr[ptr] + 16'b1;
                    end
                    finished <= 1'b0;
                end
                else begin
                    delay <= delay - 14'b1;
                end
            end
            else begin
                finished <= ack;
            end
        end
    end
    assign stb = !finished;
    assign addr = buf_addr[ptr];
    assign data_out = buf_data[ptr];
    assign wr = !finished;
endmodule
    
/* verilator coverage_on */
