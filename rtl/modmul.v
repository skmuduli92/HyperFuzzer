/*verilator coverage_off */
/*
 * Really simple modular multiplication.
 *
 * Written Pramod Subramanyan.
 * pramod.subramanyan@gmail.com.
 *
 * See RSA Hardware Implementation by Cetin Kaya Koc (Sec 7.1)
 */


module modmul(clk, rst, start, ready, a, b, n, p);
  parameter W=2048;

  // usual inputs.
  input clk, rst;

  // data inputs.
  input  [W-1:0] a;
  input  [W-1:0] b;
  input  [W-1:0] n;
  output [W-1:0] p;

  // control inputs/outputs.
  input start;
  output ready;

  parameter IDLE = 1'b0, BUSY = 1'b1;
  reg state;

  reg [15:0] i;
  wire [15:0] i_next;

  wire finished_p = (i == (W-1));
  wire state_next_idle = start ? BUSY : IDLE;
  wire state_next_busy = finished_p ? IDLE : BUSY;
  wire state_next = (state == IDLE) ? state_next_idle : state_next_busy;
  wire ready = (state == IDLE);

  reg [W+3:0]  pi; 
  wire [W-1:0] p = pi[W-1:0];

  wire [W+3:0] p2, abi, pi0, pi1, pi1p, pi2, pi2p;

  wire [W+3:0] pi_next = (state == IDLE && state_next == BUSY)  ? 0
                       : (state == BUSY)                        ? pi2p
                       : pi;

  assign p2 = pi << 1;
  assign abi = b[W-1-i] ? {4'b0, a} : 0;
  assign pi0 = p2 + abi;
  assign pi1 = pi0 - {4'b0, n};
  assign pi1p = pi1[W+3] == 0 ? pi1 : pi0;
  assign pi2 = pi1p - {4'b0, n};
  assign pi2p = pi2[W+3] == 0 ? pi2 : pi1p;

  assign i_next = (state == BUSY)                        ? i + 1 
                : (state == IDLE && state_next == BUSY)  ? 0
                : i;

  always @(posedge clk)
  begin
    if (rst) begin
        i           <= 0;
        state       <= IDLE;
        pi          <= 0;
    end
    else begin
        i           <= i_next;
        pi          <= pi_next;
        state       <= state_next;
    end
  end
endmodule
/* verilator coverage_on */
