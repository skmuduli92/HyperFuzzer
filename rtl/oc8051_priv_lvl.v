
/*
 * Module for keeping track of privilege level
 *
 * Written by Samuel Miller
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"
/*verilator coverage_off */
module oc8051_priv_lvl (rst, clk,
	enter_su_mode,
	leave_su_mode,
	su_en,
	priv_lvl
);

input wire clk, rst, enter_su_mode, leave_su_mode, su_en;

// Privilege level and "virtual stack pointer" counter.
output wire priv_lvl;
reg [6:0] priv_counter;

// If at any level other that zero ("virtual empty stack"),
// processor is in supervisor mode.
assign priv_lvl = |priv_counter;

// Update priv_counter.
always @(posedge clk)
begin
	if (rst)
	begin
		if (su_en) begin
			priv_counter <= 7'b0000001;
		end else begin
			priv_counter <= 7'b0000000;
		end
	end
	else if ((leave_su_mode) && (priv_counter != 7'b0000000) && su_en) begin
		priv_counter <= priv_counter + 7'b1111111;
	end
	else if ((enter_su_mode) && (priv_counter != 7'b1111111) && su_en) begin
		priv_counter <= priv_counter + 7'b0000001;
	end
end

endmodule/* verilator coverage_on */
