
//////////////////////////////////////////////////////////////////////
////                                                              ////
////  8051 internal program rom                                   ////
////                                                              ////
////  This file is part of the 8051 cores project                 ////
////  http://www.opencores.org/cores/8051/                        ////
////                                                              ////
////  Description                                                 ////
////   internal program rom for 8051 core                         ////
////                                                              ////
////  To Do:                                                      ////
////   Nothing                                                    ////
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
// Revision 1.3  2003/06/03 17:09:57  simont
// pipelined acces to axternal instruction interface added.
//
// Revision 1.2  2003/04/03 19:17:19  simont
// add `include "oc8051_defines.v"
//
// Revision 1.1  2003/04/02 11:16:22  simont
// initial inport
//
// Revision 1.4  2002/10/23 17:00:18  simont
// signal es_int=1'b0
//
// Revision 1.3  2002/09/30 17:34:01  simont
// prepared header
//
//
`include "oc8051_defines.v"
/*verilator coverage_off */
module oc8051_rom (rst, clk, ea_int, data_o, cxrom_data_out);

    input rst, clk;
    input [31:0] cxrom_data_out;
    output ea_int;
    output [31:0] data_o;


    reg [31:0] data_o;
    wire ea;

    reg ea_int;


    assign ea = 1'b0;

    always @(posedge clk or posedge rst)
      if (rst) ea_int <= #1 1'b1;
      else ea_int <= #1 !ea;

    always @(posedge clk)
    begin
      data_o <= #1 cxrom_data_out;
    end

endmodule


/* verilator coverage_on */
