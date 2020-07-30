
/*
 * Module for arbitrating between two processing cores
 *
 * Written by Samuel Miller (adapted from memarbiter)
 */


`include "oc8051_timescale.v"

`include "oc8051_defines.v"

/*verilator coverage_off */
module oc8051_procarbiter(
	clk,
	rst,
	selected_proc,
	// proc A
	stb_A,
	wr_A,
	ack_A,
	addr_A,
	data_in_A,
	data_out_A,
	priv_lvl_A,
	dpc_ot_A,
	// proc B
	stb_B,
	ack_B,
	wr_B,
	addr_B,
	data_in_B,
	data_out_B,
	priv_lvl_B,
	dpc_ot_B,
	// proc in control
	stb,
	wr,
	ack,
	addr,
	data_in,
	data_out,
	priv_lvl,
	dpc_ot
);

input            clk;
input            rst;
output           selected_proc;

// proc A
input            stb_A;
input            wr_A;
output           ack_A;
input [15:0]     addr_A;
input [7:0]      data_in_A;
output [7:0]     data_out_A;
input            priv_lvl_A;
input [15:0]     dpc_ot_A;

// proc B
input            stb_B;
input            wr_B;
output           ack_B;
input [15:0]     addr_B;
input [7:0]      data_in_B;
output [7:0]     data_out_B;
input            priv_lvl_B;
input [15:0]     dpc_ot_B;

// Proc selected controls these.
output           stb;
output           wr;
input            ack;
output [15:0]    addr;
output [7:0]     data_in;
input [7:0]      data_out;
output           priv_lvl;
output [15:0]    dpc_ot;

localparam PROC_A = 1'b1;
localparam PROC_B = 1'b0;

// Whether arbiter is active or is waiting for more requests.
reg arbiter_state;

// Current holder of arbitration.
reg arbit_holder;

wire stb = (selected_proc == PROC_A) ? stb_A : stb_B;

wire wr = (selected_proc == PROC_A) ? wr_A : wr_B;

wire [15:0] addr = (selected_proc == PROC_A) ? addr_A : addr_B;

wire data_in = (selected_proc == PROC_A) ? data_in_A : data_in_B;

wire ack_A = (selected_proc == PROC_A) ? ack : 1'b0;
wire ack_B = (selected_proc == PROC_B) ? ack : 1'b0;

wire [7:0] data_out_A = data_out;
wire [7:0] data_out_B = data_out;

wire priv_lvl = (selected_proc == PROC_A) ? priv_lvl_A : priv_lvl_B;

wire [15:0] dpc_ot = (selected_proc == PROC_A) ? dpc_ot_A : dpc_ot_B;

localparam STATE_INUSE = 1'b1;
localparam STATE_IDLE  = 1'b0;

// The next state of the arbiter is idle if it gets an ack, inuse otherwise.
wire arbiter_state_inuse_next = ack ? STATE_IDLE : STATE_INUSE;

// If currently idle and a request is made, enter inuse state.
wire arbiter_state_idle_next  =
        ((stb_A || stb_B) && !ack) ? STATE_INUSE : STATE_IDLE;

// Next state of the arbiter.
wire arbiter_state_next =
        (arbiter_state == STATE_IDLE)  ? arbiter_state_idle_next  :
        (arbiter_state == STATE_INUSE) ? arbiter_state_inuse_next : 1'bX;

// Select new winner for arbitration if currently idle but won't be idle in next cycle.
wire arbit_select_winner = (arbiter_state == STATE_IDLE) && (arbiter_state_next == STATE_INUSE);

// Selection of winner of Arbitration.
`ifdef OC8051_FAIR_PROCARBIT
	// If both strobes are high and proc_A is already in control, give control to proc_B.
	wire arbit_winner = (stb_A && stb_B && (arbit_holder == PROC_A)) || (!stb_A && stb_B) ? PROC_B : PROC_A;
`endif

`ifndef OC8051_FAIR_PROCARBIT
	// Proc A gets priority in ties.
	wire arbit_winner = (!stb_A && stb_B) ? PROC_B : PROC_A;
`endif


// Next holder of arbitration.
wire arbit_holder_next = arbit_select_winner ? arbit_winner : arbit_holder;

// If idle, selected proc is current cycle winner.
// If in use, selected proc is current holder
assign #1 selected_proc = (arbiter_state == STATE_IDLE) ? arbit_winner : arbit_holder;

// Update arbiter_state and arbit_holder.
always @(posedge clk)
begin
    if (rst) begin
        arbiter_state   <= STATE_IDLE;
        arbit_holder    <= PROC_A;
    end
    else begin
        arbiter_state   <= arbiter_state_next;
        arbit_holder    <= arbit_holder_next;
    end
end

endmodule
/* verilator coverage_on */
