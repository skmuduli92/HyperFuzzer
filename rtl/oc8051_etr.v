/*
 * Ecall Target Register for storing location to jump during Ecall
 *
 * Written by Samuel Miller
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"
/*verilator coverage_off */
module oc8051_etr (rst, clk,
	wr,
	wr_bit,
	wr_addr,
	data_in,
	etr,
	priv_lvl
);

input wire clk, rst, wr, wr_bit, priv_lvl;
input wire [7:0] wr_addr, data_in;
output wire [15:0] etr;

reg [15:0] etr_reg;

// Holds the value of what etr is about to be changed to.
wire [15:0] etr_next =
    (priv_lvl && wr && !wr_bit && (wr_addr == `OC8051_SFR_ETR_LO)) ? {etr_reg[15:8], data_in} :
    (priv_lvl && wr && !wr_bit && (wr_addr == `OC8051_SFR_ETR_HI)) ? {data_in, etr_reg[7:0]}  :
    etr_reg;

// If etr is changing, set to 1, else set to 0.
wire etr_c = (priv_lvl && wr && !wr_bit &&
			 ((wr_addr == `OC8051_SFR_ETR_LO) || (wr_addr == `OC8051_SFR_ETR_HI)));

// If etr is changing, change it to the new value from etr_next, else keep it the same as etr_reg.
assign etr = etr_c ? etr_next : etr_reg;

// Update etr_reg.
always @(posedge clk)
begin
	if (rst)
	begin
		etr_reg <= 16'h0000;
	end
	else if (etr_c)
	begin
        etr_reg <= etr_next;
	end
end

endmodule
/* verilator coverage_on */
