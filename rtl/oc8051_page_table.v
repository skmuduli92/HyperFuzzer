
/*
 * Page Table Module
 * Contains page table registers and illegal access registers
 *
 * Written by Samuel Miller
 */

`include "oc8051_timescale.v"

`include "oc8051_defines.v"
/*verilator coverage_off */
module oc8051_page_table (clk, rst, dpc_ot,
	selected_port,
	selected_proc,
	pt_wr,
	xram_wr,
	xram_stb,
	wr_en,
	rd_en,
	pt_addr_range,
	ia_addr_range,
	pt_stb,
	pt_ack,
	ia_stb,
	ia_ack,
	xram_addr,
	xram_data_in,
	pt_data_out,
	ia_data_out,
	priv_lvl
);

input wire clk, rst, pt_wr, xram_wr, xram_stb, priv_lvl, pt_stb, ia_stb;
input wire [15:0] dpc_ot;
input wire [15:0] xram_addr;
input wire [7:0] xram_data_in;
input wire [2:0] selected_port;
input wire selected_proc;

output wire wr_en, rd_en, pt_addr_range, ia_addr_range, pt_ack, ia_ack;
output wire [7:0] pt_data_out, ia_data_out;

// Page table registers, broken up into bytes for easy indexing.
reg [7:0] wr_enabled [31:0];
reg [7:0] rd_enabled [31:0];

// Internal wires to keep track of address range and what set of regs is being used.
wire pt_in_wr_range, pt_in_rd_range, pt_wr_reg_use, pt_rd_reg_use;
wire ia_addr_rwn, ia_addr_hi, ia_addr_lo, ia_addr_src;
wire [7:0] data_out_wr, data_out_rd;

// Possible ranges for addresses involving pt registers.
localparam PT_WR_ADDR_START  = 16'hff80;
localparam PT_WR_ADDR_END    = 16'hff9f;
localparam PT_RD_ADDR_START  = 16'hffa0;
localparam PT_RD_ADDR_END    = 16'hffbf;
localparam IA_ADDR_RWN       = 16'hffc0;
localparam IA_ADDR_HI		 = 16'hffc1;
localparam IA_ADDR_LO		 = 16'hffc2;
localparam IA_ADDR_SRC       = 16'hffc3;
localparam IA_PC_HI          = 16'hffc4;
localparam IA_PC_LO          = 16'hffc5;

// Find the range of the addresses (or that it isn't in the page table ranges).
assign pt_in_wr_range = ((xram_addr >= PT_WR_ADDR_START) && (xram_addr <= PT_WR_ADDR_END));
assign pt_in_rd_range = ((xram_addr >= PT_RD_ADDR_START) && (xram_addr <= PT_RD_ADDR_END));
assign pt_addr_range  = (pt_in_wr_range || pt_in_rd_range);

// Find out if the illegal access registers are being accessed.
assign ia_addr_rwn = (xram_addr == IA_ADDR_RWN);
assign ia_addr_hi  = (xram_addr == IA_ADDR_HI);
assign ia_addr_lo  = (xram_addr == IA_ADDR_LO);
assign ia_addr_src = (xram_addr == IA_ADDR_SRC);
assign ia_pc_hi    = (xram_addr == IA_PC_HI);
assign ia_pc_lo    = (xram_addr == IA_PC_LO);
assign ia_addr_range = (ia_addr_rwn || ia_addr_hi || ia_addr_lo || ia_addr_src || ia_pc_hi || ia_pc_lo);

// Figure out if page table reg should be read/written to, and if so, which section (wr_en or rd_en).
assign pt_wr_reg_use = priv_lvl && pt_stb && pt_in_wr_range;
assign pt_rd_reg_use = priv_lvl && pt_stb && pt_in_rd_range;

// Figure out which data set (wr_en or rd_en) to read from.
assign pt_data_out = pt_in_wr_range ? data_out_wr :
			  		 pt_in_rd_range ? data_out_rd : 8'h00;

// Allow reads and writes only to enabled pages.
assign wr_en = wr_enabled[xram_addr[15:11]][xram_addr[10:8]];
assign rd_en = rd_enabled[xram_addr[15:11]][xram_addr[10:8]];
assign pt_ack = pt_stb && pt_addr_range;

// Assign the output data to the corresponding 8-bit register of page table.
assign data_out_wr = pt_wr_reg_use ? wr_enabled[xram_addr[4:0]] : 8'h00;
assign data_out_rd = pt_rd_reg_use ? rd_enabled[xram_addr[4:0]] : 8'h00;

// Update page table.
integer i;
always @(posedge clk)
begin
    if (rst) begin
        for (i=0; i < 32; i+=1) begin
            wr_enabled[i] <= 8'hff;
            rd_enabled[i] <= 8'hff;
        end
    end
    else begin
        if (pt_wr && pt_wr_reg_use) begin
            wr_enabled[xram_addr[4:0]] <= xram_data_in;
        end
        else if (pt_wr && pt_rd_reg_use) begin
        	rd_enabled[xram_addr[4:0]] <= xram_data_in;
        end
    end
end

// ia_access_reg value for proc0 access.
localparam PROC0_IA = 3'd5;

// For ia's last illegal access address and type of access.
reg [15:0]  ia_addr_reg;
reg [1:0]   ia_rwn_reg;
reg [2:0]   illegal_src;
reg [15:0]  pc_ia_reg;

// Type of illegal access.
wire illegal_wr = (xram_stb && xram_wr && !wr_en);
wire illegal_rd = (xram_stb && !xram_wr && !rd_en);

// Port or proc currently holding the memarbiter.
wire accesser = (selected_port != 3'b000) ? selected_port :
                (selected_proc == 1'b0)   ? PROC0_IA      : selected_port;

wire [15:0] ia_reg_next = (illegal_wr || illegal_rd) ? xram_addr : ia_addr_reg;
wire [2:0]  ia_src_next = (illegal_wr || illegal_rd) ? accesser  : illegal_src;

assign ia_data_out = ia_addr_rwn ? {6'b000000, ia_rwn_reg} :
					 ia_addr_lo  ? ia_addr_reg[7:0]        :
                 	 ia_addr_hi  ? ia_addr_reg[15:8]       :
                   	 ia_addr_src ? {5'b00000, illegal_src} :
                   	 ia_pc_lo    ? pc_ia_reg[7:0]          : pc_ia_reg[15:8];

assign ia_ack = (ia_stb && ia_addr_range);

// Update illegal access registers.
always @(posedge clk)
begin
    if (rst) begin
        ia_addr_reg          <= 16'h0000;
        ia_rwn_reg           <= 2'b00;
        illegal_src          <= 3'b000;
        pc_ia_reg            <= 16'h0000;
    end
    else begin
        ia_addr_reg <= ia_reg_next;
        illegal_src <= ia_src_next;

        // When illegal access occurs, pull pc corresponding to executed instruction from dpc_ot.
        if ((illegal_wr || illegal_rd) && (accesser == 3'b000)) begin
            pc_ia_reg <= dpc_ot;
        end

        // If illegal write, store 1. If illegal read, store 2.
     	if (illegal_wr) begin
     		ia_rwn_reg <= 2'b01;
       	end
       	else if (illegal_rd) begin
       		ia_rwn_reg <= 2'b10;
       	end
    end
end

endmodule
/* verilator coverage_on */
