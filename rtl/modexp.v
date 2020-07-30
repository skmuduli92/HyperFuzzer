/*verilator coverage_off */
module modexp(clk, rst, start, ready, m, e, n, c);
  parameter [15:0] W = 2048;
  
  input clk, rst;

  input  [W-1:0] m;
  input  [W-1:0] e;
  input  [W-1:0] n;  
  output [W-1:0] c;  // c = M^e mod n

  input start;
  output ready;

  localparam IDLE  = 3'b000;
  localparam BUSY1 = 3'b001;
  localparam WAIT1 = 3'b010;
  localparam BUSY2 = 3'b011;
  localparam WAIT2 = 3'b100;

  reg[2:0] state;

  reg [15:0] i;
  wire [15:0] i_next;

  reg [W-1:0] c;
  wire [W-1:0] c_next;
  wire [W-1:0] p;
  wire [W-1:0] sq;

  wire sq_ready;
  wire sq_start;
  wire m_ready;
  wire m_start;

  wire state_idle = state == IDLE;
  wire state_busy1 = state == BUSY1;
  wire state_wait1 = state == WAIT1;
  wire state_busy2 = state == BUSY2;
  wire state_wait2 = state == WAIT2;

  wire ei = e[i[10:0]];

  wire [2:0] state_next_idle = start ? BUSY1 : IDLE;

  wire [2:0] state_next_busy1 = m == 0 ? IDLE
                              : (c == 1 && ei == 0) ? BUSY1
                              : WAIT1;

  wire [2:0] state_next_wait1 = !sq_ready ? WAIT1
                              : ei ? BUSY2
                              : (i == 0) ? IDLE
                              : BUSY1;

  wire [2:0] state_next_wait2 = !m_ready ? WAIT2
                              : (i == 0) ? IDLE
                              : BUSY1;

  wire [2:0] state_next = state_idle? state_next_idle
                        : state_busy1 ? state_next_busy1
                        : state_wait1 ? state_next_wait1
                        : state_busy2 ? WAIT2
                        : state_next_wait2;

  wire ready = (state == IDLE);

  modmul #(.W(W)) square(
    .clk        (clk),
    .rst        (rst),
    .start      (sq_start),
    .ready      (sq_ready),
    .a          (c),
    .b          (c),
    .n          (n),
    .p          (sq)
  );

  modmul #(.W(W)) mult(
    .clk        (clk),
    .rst        (rst),
    .start      (m_start),
    .ready      (m_ready),
    .a          (c),
    .b          (m),
    .n          (n),
    .p          (p)
  );

  wire next_busy = state_next == BUSY1;

  assign i_next = (state_idle && next_busy) ? W-2
                : (next_busy) ? i-1
                : i;

  assign c_next = m == 0 ? 0
                : (state_idle && next_busy) ? (e[W-1] ? m : 1)
                : (sq_ready && state_wait1) ? sq
                : (m_ready && state_wait2) ? p
                : c;

  assign sq_start = state == BUSY1;
  assign m_start = state == BUSY2;

  always @(posedge clk)
  begin
    if (rst) begin
      i         <= W-1;
      state     <= IDLE;
      c         <= 1;
    end
    else begin
      i         <= i_next;
      state     <= state_next;
      c         <= c_next;
    end
  end
endmodule
/* verilator coverage_on */
