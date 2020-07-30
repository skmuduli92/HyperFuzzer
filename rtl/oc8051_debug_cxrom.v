/*verilator coverage_off */
module oc8051_debug_cxrom(
    clk,
    rst,
    word_in,
    cxrom_addr,
    pc1,
    pc2,
    cxrom_data_out,
    op_valid,
    op0_out,
    op1_out,
    op2_out
);
    input clk, rst;
    input [15:0] cxrom_addr;
    input [31:0] word_in;
    input [15:0] pc1;
    input [15:0] pc2;

    output [31:0] cxrom_data_out;
    output op_valid;
    output [7:0] op0_out;
    output [7:0] op1_out;
    output [7:0] op2_out;

    wire [15:0] addr;
    wire [31:0] cxrom_data_out;

    `include "../bench/rom/aes_test.v"

    assign addr = cxrom_addr;
    assign cxrom_data_out = data_out;

    localparam ROMSIZE = 386;

    wire [15:0] pc10 = pc1;
    wire [15:0] pc11 = pc1 + 1;
    wire [15:0] pc12 = pc1 + 2;
    wire [15:0] pc13 = pc1 + 3;
    wire pc1_valid = (pc10 < ROMSIZE) && (pc11 < ROMSIZE) && (pc12 < ROMSIZE) && (pc13 < ROMSIZE);

    wire [15:0] pc20 = pc2;
    wire [15:0] pc21 = pc2 + 1;
    wire [15:0] pc22 = pc2 + 2;
    wire [15:0] pc23 = pc2 + 3;
    wire pc2_valid = (pc20 < ROMSIZE) && (pc21 < ROMSIZE) && (pc22 < ROMSIZE) && (pc23 < ROMSIZE);

    assign op_valid = pc1_valid && pc2_valid;
    assign op0_out = pc10 < ROMSIZE ? buff[pc10] : 8'b0;
    assign op1_out = pc11 < ROMSIZE ? buff[pc11] : 8'b0;
    assign op2_out = pc12 < ROMSIZE ? buff[pc12] : 8'b0;

endmodule
/* verilator coverage_on */
