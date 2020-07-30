
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 external data ram                                      ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   external data ram                                          ////
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
// Revision 1.4  2002/10/17 18:53:04  simont
// added parameter DELAY
//
// Revision 1.3  2002/09/30 17:34:01  simont
// prepared header
//
//

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on
/*verilator coverage_off */

module oc8051_xram (clk, rst, wr, wr_en, addr, data_in, data_out, ack, stb, rd_en);
//
// external data ram for simulation. part of oc8051_tb
// it's tehnology dependent
//
// clk          (in)  clock
// addr         (in)  addres
// data_in      (out) data input
// data_out     (in)  data output
// wr           (in)  write
// ack          (out) acknowlage
// stb          (in)  strobe
//

parameter DELAY=1;


input clk, wr, wr_en, stb, rst, rd_en;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;

reg ackw, ackr;
reg [7:0] data_out;
reg [2:0] cnt;

wire [12:0] encoded_data_in;
wire [12:0] encoded_data_out;
wire [7:0]  decoded_data;
wire [7:0]  mux_data_in;
wire [7:0]  mux_data_out;

oc8051_ecc_enc ecc_enc_i(
    .d_i    (data_in),
    .q_o    (encoded_data_in)
);

assign encoded_data_out = {ecc[addr0], buff[addr0]};

oc8051_ecc_dec ecc_dec_i(
    .d_i    (encoded_data_out),
    .q_o    (decoded_data)
);
assign mux_data_in  = addr0 < 16'd8192 ? encoded_data_in[7:0] : data_in;
assign mux_data_out = addr0 < 16'd8192 ? decoded_data : buff[addr0];

//
// buffer
reg [7:0] buff [65535:0];  // 64kb
reg [4:0] ecc  [8191 :0];  // 5kb of ECC
//reg [7:0] buff [15:0];  //16b
//reg [7:0] buff [8388607:0];  //8Mb

assign ack =  ackw || ackr;

wire [15:0] addr0 = addr[15:0];

/* verilator lint_off ASSIGNDLY */
//
// writing to ram
always @(posedge clk)
begin
  if (rst)
    ackw <= #1 1'b0;
  else if (wr && wr_en && stb && ((DELAY==3'b000) || (cnt==3'b000))) begin
    buff[addr0] <= #1 mux_data_in;
    if (addr0 < 16'd8192) begin
        ecc [addr0] <= #1 encoded_data_in[12:8];
    end
    ackw <= #1 1'b1;
  end else if (wr && stb && ((DELAY==3'b000) || (cnt==3'b000))) begin
    ackw <= #1 1'b1;
  end else ackw <= #1 1'b0;
end

always @(posedge clk)
  if (rst)
    ackr <= #1 1'b0;
  else if (rd_en && stb && !wr && ((DELAY==3'b000) || (cnt==3'b000))) begin
    data_out <= #1 /* buff[addr0]; */ mux_data_out;
    ackr <= #1 1'b1;
  end else if (stb && !wr && ((DELAY==3'b000) || (cnt==3'b000))) begin
    ackr <= #1 1'b1;
    data_out <= #1 8'h00;
  end else begin
    ackr <= #1 1'b0;
    data_out <= #1 8'h00;
  end
integer i;
always @(posedge clk)
begin
  if (rst) begin
    cnt <= #1 DELAY;
    for (i=0; i < 65536; i+=1) begin
      buff[i] = 8'h00;
    end
  end else if (cnt==3'b000)
    cnt <= #1 DELAY;
  else if (stb)
    cnt <= #1 cnt - 3'b001;
  else cnt <= #1 DELAY;
end
/* verilator lint_on ASSIGNDLY */


endmodule
/* verilator coverage_on */
