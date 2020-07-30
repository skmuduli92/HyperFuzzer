
//`include "oc8051_timesacle.v"
/*verilator coverage_off */
module mem_wr (
  clk,
  rst,
  wr,
  addr,
  data_in,
  data_out,
  ack,
  stb,
  in_addr_range,
  xram_addr,
  xram_data_out,
  xram_data_in,
  xram_ack,
  xram_stb,
  xram_wr,
  memwr_state,
  memwr_rdaddr,
  memwr_wraddr,
  memwr_len,
  memwr_step
);

input clk, rst, wr,stb;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;
output in_addr_range;

// to XRAM
output [15:0] xram_addr;
output [7:0] xram_data_out;
input [7:0] xram_data_in;
input xram_ack;
output xram_stb;
output xram_wr;

// verif output
output [1:0] memwr_state;
output [15:0] memwr_rdaddr, memwr_wraddr, memwr_len;
output memwr_step;


// FIRST ADDRESS ALLOCATED TO THIS UNIT.
localparam MEMWR_ADDR_START = 16'hf9f0;
// see also MEMWR_ADDR_END.

// The addresses of the registers.
localparam MEMWR_REG_START     = 16'hf9f0; // 1 byte
localparam MEMWR_REG_STATE     = 16'hf9f1; // 1 byte
localparam MEMWR_REG_RD_ADDR   = 16'hf9f2; // 2 bytes
localparam MEMWR_REG_WR_ADDR   = 16'hf9f4; // 2 bytes
localparam MEMWR_REG_LEN       = 16'hf9f6; // 2 bytes
localparam MEMWR_REG_BUFF_ADDR = 16'hf9f8; // 2 bytes  // index in memwr buffer
localparam MEMWR_REG_MODE      = 16'hf9f9; // 1 byte   // bit 0=rd_en, bit 1=wr_en

// END OF THE ADDRESS RANGE ALLOCATED TO THIS UNIT.
localparam MEMWR_ADDR_END = 16'hfa00;
// see also MEMWR_ADDR_START.

// response to the xiommu module.
wire in_addr_range = addr >= MEMWR_ADDR_START && addr < MEMWR_ADDR_END;
wire ack = stb && in_addr_range;

// state register.
reg [1:0]  memwr_reg_state;
wire [1:0] memwr_state = memwr_reg_state;

// states
localparam STATE_IDLE       = 2'b00;
localparam STATE_READ_DATA  = 2'b01;
localparam STATE_WRITE_DATA = 2'b10;

// state predicates
wire state_idle       = memwr_reg_state == STATE_IDLE;
wire state_read_data  = memwr_reg_state == STATE_READ_DATA;
wire state_write_data = memwr_reg_state == STATE_WRITE_DATA;

// register selector predicates
wire sel_reg_start = addr == MEMWR_REG_START;
wire sel_reg_state = addr == MEMWR_REG_STATE;
wire sel_reg_rd_addr = {addr[15:1],1'b0} == MEMWR_REG_RD_ADDR;
wire sel_reg_wr_addr = {addr[15:1],1'b0} == MEMWR_REG_WR_ADDR;
wire sel_reg_len = {addr[15:1],1'b0} == MEMWR_REG_LEN;
wire wren = wr && state_idle;

wire start_op = sel_reg_start && data_in[0] && stb && wren;
wire write_only = start_op && data_in[1]; // skip read stage

// compute next state
wire [1:0] state_next;

wire [1:0] state_next_idle;
wire [1:0] state_next_read_data;
wire [1:0] state_next_write_data;

assign state_next =
  state_idle       ? state_next_idle       :
  state_read_data  ? state_next_read_data  :
  state_write_data ? state_next_write_data : 2'bx;

wire memwr_step = memwr_reg_state != state_next;

// Go to the read data state if we get a start signal.
assign state_next_idle = write_only ? STATE_WRITE_DATA :
                         start_op   ? STATE_READ_DATA  : STATE_IDLE;
// We will continue to be in the read data state until all the data is read.
assign state_next_read_data = read_last_byte_acked ? STATE_WRITE_DATA : STATE_READ_DATA;
// We will leave the write data state when we are finished writing into the XRAM.
assign state_next_write_data = finished    ? STATE_IDLE : STATE_WRITE_DATA;

// Keeping track of the number of bytes processed.
reg [15:0] reg_bytes_written;
reg [15:0] reg_bytes_read;
wire [15:0] bytes_read_next;
wire [15:0] bytes_written_next;
assign bytes_read_next =
  state_idle                  ? 16'b0              :
  state_read_data && xram_ack ? reg_bytes_read + 1 : reg_bytes_read;
assign bytes_written_next =
  state_idle                   ? 16'b0              :
  state_write_data && xram_ack ? reg_bytes_written + 1 : reg_bytes_written;

// Are we reading last byte?
wire read_last_byte = bytes_read_next == memwr_reg_len || xram_data_in === 8'hxx;
wire read_last_byte_acked = read_last_byte && xram_ack;

// Writing logic.
wire writing_last_byte = bytes_written_next == reg_bytes_read || xram_data_out === 8'hxx;
wire write_last_byte_acked = writing_last_byte && xram_ack;

// Are we done writing?
wire finished = write_last_byte_acked;


reg [7:0] block [0:'hffff];

wire [7:0] data_out_state, data_out_rd_addr, data_out_wr_addr, data_out_len;

// allow the processor to read the current state.
assign data_out_state = {6'd0, memwr_reg_state};

wire [7:0] data_out;
assign data_out = sel_reg_state     ? data_out_state
                : sel_reg_rd_addr   ? data_out_rd_addr
                : sel_reg_wr_addr   ? data_out_wr_addr
                : sel_reg_len       ? data_out_len
                : 8'd0;

// rd address register.
wire [15:0] memwr_reg_rd_addr;
reg2byte memwr_reg_rd_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_rd_addr),
    .wr         (sel_reg_rd_addr && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_rd_addr),
    .reg_out    (memwr_reg_rd_addr)
);

// wr address register.
wire [15:0] memwr_reg_wr_addr;
reg2byte wr_addr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_wr_addr),
    .wr         (sel_reg_wr_addr && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_wr_addr),
    .reg_out    (memwr_reg_wr_addr)
);

// length register.
wire [15:0] memwr_reg_len;
reg2byte reg_len_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_len),
    .wr         (sel_reg_len && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (data_out_len),
    .reg_out    (memwr_reg_len)
);

wire [15:0] memwr_rdaddr = memwr_reg_rd_addr;
wire [15:0] memwr_wraddr = memwr_reg_wr_addr;
wire [15:0] memwr_len = memwr_reg_len;

wire [64:0] buffout = {block[7], block[6], block[5], block[4], block[3], block[2], block[1], block[0]};

// XRAM interface.
assign xram_addr = state_read_data  ? memwr_reg_rd_addr + reg_bytes_read :
                   state_write_data ? memwr_reg_wr_addr + reg_bytes_written: 16'bx;

assign xram_stb = state_read_data || state_write_data;
assign xram_wr = state_write_data;
wire [7:0] xram_data_out = state_write_data ? block[reg_bytes_written] : 8'b0;



// Registers.
// always @(posedge clk)
// begin
//     if (rst) begin
//         memwr_reg_state   <= STATE_IDLE;
//         reg_bytes_written <= 16'b0;
// 	    reg_bytes_read    <= 16'b0;
//     end else
//     begin
//       	loaded            <= 1'b0;
//         memwr_reg_state   <= state_next;
//         reg_bytes_written <= bytes_written_next;
//         reg_bytes_read    <= bytes_read_next;
//         if(state_read_data && xram_ack) begin
//           block[reg_bytes_read] <= xram_data_in;
//         end
//     end
// end

//loading prog.hex
always @(posedge clk)
begin
     if (rst) begin
       memwr_reg_state   <= STATE_IDLE;
       reg_bytes_written <= 16'b0;
       reg_bytes_read    <= 16'b0;
     end

    else begin
        memwr_reg_state   <= state_next;
        reg_bytes_written <= bytes_written_next;
	reg_bytes_read    <= bytes_read_next;
	if(state_read_data && xram_ack) begin
	    block[reg_bytes_read] <= xram_data_in;
	end
    end
end

endmodule
/* verilator coverage_on */
