
`include "oc8051_defines.v"

/*verilator coverage_off */
module oc8051_decoder (
  op_cur,
  bit_addr,
  comp_sel,
  pc_wr, pc_sel,
  rmw
);

input [7:0] op_cur;


output bit_addr, pc_wr, rmw;
output [1:0] comp_sel;
output [2:0] pc_sel;

reg rmw;
reg wr,  bit_addr, pc_wr;
reg [1:0] comp_sel;
reg [2:0] ram_wr_sel, ram_rd_sel, pc_sel;

//
// op           instruction buffer
reg  [7:0] op;
reg  [2:0] ram_rd_sel_r;

reg stb_i;



//
// main block
// unregisterd outputs
always @(op_cur)
begin
    /* verilator lint_off CASEX */
    casex (op_cur)
      `OC8051_ACALL :begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_Y;
          pc_sel = `OC8051_PIS_I11;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_AJMP : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_Y;
          pc_sel = `OC8051_PIS_I11;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_ADD_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ADDC_R : begin
         ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_CJNE_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_DEC_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_DJNZ_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_INC_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_DR : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_RD : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_SUBB_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XCH_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XRL_R : begin
          ram_rd_sel = `OC8051_RRS_RN;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end

//op_code [7:1]
      `OC8051_ADD_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ADDC_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_CJNE_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_DEC_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_INC_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_ID : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_DI : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOVX_IA : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MOVX_AI :begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_SUBB_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XCH_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XCHD :begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XRL_I : begin
          ram_rd_sel = `OC8051_RRS_I;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end

//op_code [7:0]
      `OC8051_ADD_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ADDC_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_C : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_DD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_DC : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ANL_B : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_ANL_NB : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_CJNE_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_CJNE_C : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_CLR_B : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_CPL_B : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_DEC_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_DIV : begin
          ram_rd_sel = `OC8051_RRS_B;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_DJNZ_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_INC_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_INC_DP : begin
          ram_rd_sel = `OC8051_RRS_DPTR;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_JB : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_SO2;
          comp_sel =  `OC8051_CSS_BIT;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b1;
        end
      `OC8051_JBC : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_BIT;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b1;
        end
/*          `OC8051_JC : begin
          ram_rd_sel = `OC8051_RRS_PSW;
          pc_wr = eq;
          pc_sel = `OC8051_PIS_SO1;
          comp_sel =  `OC8051_CSS_CY;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end*/
      `OC8051_JMP_D : begin
          ram_rd_sel = `OC8051_RRS_DPTR;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end

      `OC8051_JNB : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_SO2;
          comp_sel =  `OC8051_CSS_BIT;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b1;
        end
/*          `OC8051_JNC : begin
          ram_rd_sel = `OC8051_RRS_PSW;
          pc_wr = !eq;
          pc_sel = `OC8051_PIS_SO1;
          comp_sel =  `OC8051_CSS_CY;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_JNZ : begin
          ram_rd_sel = `OC8051_RRS_ACC;
          pc_wr = !eq;
          pc_sel = `OC8051_PIS_SO1;
          comp_sel =  `OC8051_CSS_AZ;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_JZ : begin
          ram_rd_sel = `OC8051_RRS_ACC;
          pc_wr = eq;
          pc_sel = `OC8051_PIS_SO1;
          comp_sel =  `OC8051_CSS_AZ;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end*/
      `OC8051_LCALL :begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_Y;
          pc_sel = `OC8051_PIS_I16;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_LJMP : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_Y;
          pc_sel = `OC8051_PIS_I16;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_DD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_MOV_BC : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_MOV_CB : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_MOVC_DP :begin
          ram_rd_sel = `OC8051_RRS_DPTR;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MOVC_PC : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MOVX_PA : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MOVX_AP : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_MUL : begin
          ram_rd_sel = `OC8051_RRS_B;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_AD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_CD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_ORL_B : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_ORL_NB : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
      `OC8051_POP : begin
          ram_rd_sel = `OC8051_RRS_SP;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_PUSH : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_RET : begin
          ram_rd_sel = `OC8051_RRS_SP;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_RETI : begin
          ram_rd_sel = `OC8051_RRS_SP;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end
      `OC8051_SETB_B : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b1;
        end
/*          `OC8051_SJMP : begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_Y;
          pc_sel = `OC8051_PIS_SO1;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b0;
          bit_addr = 1'b0;
        end*/
      `OC8051_SUBB_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XCH_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XRL_D : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XRL_AD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      `OC8051_XRL_CD : begin
          ram_rd_sel = `OC8051_RRS_D;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_Y;
          stb_i = 1'b1;
          bit_addr = 1'b0;
        end
      default: begin
          ram_rd_sel = `OC8051_RRS_DC;
          pc_wr = `OC8051_PCW_N;
          pc_sel = `OC8051_PIS_DC;
          comp_sel =  `OC8051_CSS_DC;
          rmw = `OC8051_RMW_N;
          stb_i = 1'b1;
          bit_addr = 1'b0;
       end
    endcase
end

endmodule
/* verilator coverage_on */
