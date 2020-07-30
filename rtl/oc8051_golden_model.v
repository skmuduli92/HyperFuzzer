/*verilator coverage_off */
module oc8051_golden_model(
  clk,
  rst,
  step,
  RD_ROM_0_ADDR,
  RD_ROM_1_ADDR,
  RD_ROM_2_ADDR,
  ACC,
  ACC_next,
  P2,
  P2_next,
  P0,
  P0_next,
  B,
  B_next,
  P1,
  P1_next,
  XRAM_ADDR,
  XRAM_ADDR_next,
  P3,
  P3_next,
  SP,
  SP_next,
  PC,
  PC_next,
  XRAM_DATA_OUT,
  XRAM_DATA_OUT_next,
  DPL,
  DPL_next,
  PSW,
  PSW_next,
  DPH,
  DPH_next,
  IRAM_full,
  SBUF,
  SBUF_next,
  SCON,
  SCON_next,
  PCON,
  PCON_next,
  TCON,
  TCON_next,
  TL0,
  TL0_next,
  TL1,
  TL1_next,
  TH0,
  TH0_next,
  TH1,
  TH1_next,
  TMOD,
  TMOD_next,
  IE,
  IE_next,
  IP,
  IP_next,
  XRAM_DATA_IN,
  P0IN,
  P1IN,
  P2IN,
  P3IN,
  RD_ROM_0,
  RD_ROM_1,
  RD_ROM_2
);
output [15:0] RD_ROM_0_ADDR;
output [15:0] RD_ROM_1_ADDR;
output [15:0] RD_ROM_2_ADDR;
output [7:0] ACC;
output [7:0] ACC_next;
output [7:0] P2;
output [7:0] P2_next;
output [7:0] P0;
output [7:0] P0_next;
output [7:0] B;
output [7:0] B_next;
output [7:0] P1;
output [7:0] P1_next;
output [15:0] XRAM_ADDR;
output [15:0] XRAM_ADDR_next;
output [7:0] P3;
output [7:0] P3_next;
output [7:0] SP;
output [7:0] SP_next;
output [15:0] PC;
output [15:0] PC_next;
output [7:0] XRAM_DATA_OUT;
output [7:0] XRAM_DATA_OUT_next;
output [7:0] DPL;
output [7:0] DPL_next;
output [7:0] PSW;
output [7:0] PSW_next;
output [7:0] DPH;
output [7:0] DPH_next;
output [127:0] IRAM_full;
output [7:0] SBUF;
output [7:0] SBUF_next;
output [7:0] SCON;
output [7:0] SCON_next;
output [7:0] PCON;
output [7:0] PCON_next;
output [7:0] TCON;
output [7:0] TCON_next;
output [7:0] TL0;
output [7:0] TL0_next;
output [7:0] TL1;
output [7:0] TL1_next;
output [7:0] TH0;
output [7:0] TH0_next;
output [7:0] TH1;
output [7:0] TH1_next;
output [7:0] TMOD;
output [7:0] TMOD_next;
output [7:0] IE;
output [7:0] IE_next;
output [7:0] IP;
output [7:0] IP_next;

input clk, rst, step;
input [7:0] XRAM_DATA_IN;
input [7:0] P0IN;
input [7:0] P1IN;
input [7:0] P2IN;
input [7:0] P3IN;
input [7:0] RD_ROM_0;
input [7:0] RD_ROM_1;
input [7:0] RD_ROM_2;

reg [7:0] ACC;
reg [7:0] B;
reg [7:0] DPH;
reg [7:0] DPL;
reg [7:0] IE;
reg [7:0] IP;
reg [7:0] P0;
reg [7:0] P0INREG;
reg [7:0] P1;
reg [7:0] P1INREG;
reg [7:0] P2;
reg [7:0] P2INREG;
reg [7:0] P3;
reg [7:0] P3INREG;
reg [15:0] PC;
reg [7:0] PCON;
reg [7:0] PSW;
reg [7:0] SBUF;
reg [7:0] SCON;
reg [7:0] SP;
reg [7:0] TCON;
reg [7:0] TH0;
reg [7:0] TH1;
reg [7:0] TL0;
reg [7:0] TL1;
reg [7:0] TMOD;
reg [15:0] XRAM_ADDR;
reg [7:0] XRAM_DATA_OUT;

wire [7:0] ACC_03;
wire [7:0] ACC_04;
wire [7:0] ACC_05;
wire [7:0] ACC_10;
wire [7:0] ACC_13;
wire [7:0] ACC_14;
wire [7:0] ACC_15;
wire [7:0] ACC_23;
wire [7:0] ACC_24;
wire [7:0] ACC_25;
wire [7:0] ACC_26;
wire [7:0] ACC_27;
wire [7:0] ACC_28;
wire [7:0] ACC_29;
wire [7:0] ACC_2a;
wire [7:0] ACC_2b;
wire [7:0] ACC_2c;
wire [7:0] ACC_2d;
wire [7:0] ACC_2e;
wire [7:0] ACC_2f;
wire [7:0] ACC_33;
wire [7:0] ACC_34;
wire [7:0] ACC_35;
wire [7:0] ACC_36;
wire [7:0] ACC_37;
wire [7:0] ACC_38;
wire [7:0] ACC_39;
wire [7:0] ACC_3a;
wire [7:0] ACC_3b;
wire [7:0] ACC_3c;
wire [7:0] ACC_3d;
wire [7:0] ACC_3e;
wire [7:0] ACC_3f;
wire [7:0] ACC_43;
wire [7:0] ACC_44;
wire [7:0] ACC_45;
wire [7:0] ACC_46;
wire [7:0] ACC_47;
wire [7:0] ACC_48;
wire [7:0] ACC_49;
wire [7:0] ACC_4a;
wire [7:0] ACC_4b;
wire [7:0] ACC_4c;
wire [7:0] ACC_4d;
wire [7:0] ACC_4e;
wire [7:0] ACC_4f;
wire [7:0] ACC_53;
wire [7:0] ACC_54;
wire [7:0] ACC_55;
wire [7:0] ACC_56;
wire [7:0] ACC_57;
wire [7:0] ACC_58;
wire [7:0] ACC_59;
wire [7:0] ACC_5a;
wire [7:0] ACC_5b;
wire [7:0] ACC_5c;
wire [7:0] ACC_5d;
wire [7:0] ACC_5e;
wire [7:0] ACC_5f;
wire [7:0] ACC_62;
wire [7:0] ACC_63;
wire [7:0] ACC_64;
wire [7:0] ACC_65;
wire [7:0] ACC_66;
wire [7:0] ACC_67;
wire [7:0] ACC_68;
wire [7:0] ACC_69;
wire [7:0] ACC_6a;
wire [7:0] ACC_6b;
wire [7:0] ACC_6c;
wire [7:0] ACC_6d;
wire [7:0] ACC_6e;
wire [7:0] ACC_6f;
wire [7:0] ACC_74;
wire [7:0] ACC_75;
wire [7:0] ACC_83;
wire [7:0] ACC_84;
wire [7:0] ACC_85;
wire [7:0] ACC_86;
wire [7:0] ACC_87;
wire [7:0] ACC_88;
wire [7:0] ACC_89;
wire [7:0] ACC_8a;
wire [7:0] ACC_8b;
wire [7:0] ACC_8c;
wire [7:0] ACC_8d;
wire [7:0] ACC_8e;
wire [7:0] ACC_8f;
wire [7:0] ACC_92;
wire [7:0] ACC_93;
wire [7:0] ACC_94;
wire [7:0] ACC_95;
wire [7:0] ACC_96;
wire [7:0] ACC_97;
wire [7:0] ACC_98;
wire [7:0] ACC_99;
wire [7:0] ACC_9a;
wire [7:0] ACC_9b;
wire [7:0] ACC_9c;
wire [7:0] ACC_9d;
wire [7:0] ACC_9e;
wire [7:0] ACC_9f;
wire [7:0] ACC_a4;
wire [7:0] ACC_b2;
wire [7:0] ACC_c2;
wire [7:0] ACC_c4;
wire [7:0] ACC_c5;
wire [7:0] ACC_c6;
wire [7:0] ACC_c7;
wire [7:0] ACC_c8;
wire [7:0] ACC_c9;
wire [7:0] ACC_ca;
wire [7:0] ACC_cb;
wire [7:0] ACC_cc;
wire [7:0] ACC_cd;
wire [7:0] ACC_ce;
wire [7:0] ACC_cf;
wire [7:0] ACC_d0;
wire [7:0] ACC_d2;
wire [7:0] ACC_d4;
wire [7:0] ACC_d5;
wire [7:0] ACC_d6;
wire [7:0] ACC_d7;
wire [7:0] ACC_e0;
wire [7:0] ACC_e2;
wire [7:0] ACC_e3;
wire [7:0] ACC_e4;
wire [7:0] ACC_e5;
wire [7:0] ACC_e6;
wire [7:0] ACC_e7;
wire [7:0] ACC_e8;
wire [7:0] ACC_e9;
wire [7:0] ACC_ea;
wire [7:0] ACC_eb;
wire [7:0] ACC_ec;
wire [7:0] ACC_ed;
wire [7:0] ACC_ee;
wire [7:0] ACC_ef;
wire [7:0] ACC_f4;
wire [7:0] ACC_next;
wire [7:0] B_05;
wire [7:0] B_10;
wire [7:0] B_15;
wire [7:0] B_42;
wire [7:0] B_43;
wire [7:0] B_52;
wire [7:0] B_53;
wire [7:0] B_62;
wire [7:0] B_63;
wire [7:0] B_75;
wire [7:0] B_84;
wire [7:0] B_85;
wire [7:0] B_86;
wire [7:0] B_87;
wire [7:0] B_88;
wire [7:0] B_89;
wire [7:0] B_8a;
wire [7:0] B_8b;
wire [7:0] B_8c;
wire [7:0] B_8d;
wire [7:0] B_8e;
wire [7:0] B_8f;
wire [7:0] B_92;
wire [7:0] B_a4;
wire [7:0] B_b2;
wire [7:0] B_c2;
wire [7:0] B_c5;
wire [7:0] B_d0;
wire [7:0] B_d2;
wire [7:0] B_d5;
wire [7:0] B_f5;
wire [7:0] B_next;
wire [7:0] DPH_05;
wire [7:0] DPH_15;
wire [7:0] DPH_42;
wire [7:0] DPH_43;
wire [7:0] DPH_52;
wire [7:0] DPH_53;
wire [7:0] DPH_62;
wire [7:0] DPH_63;
wire [7:0] DPH_75;
wire [7:0] DPH_85;
wire [7:0] DPH_86;
wire [7:0] DPH_87;
wire [7:0] DPH_88;
wire [7:0] DPH_89;
wire [7:0] DPH_8a;
wire [7:0] DPH_8b;
wire [7:0] DPH_8c;
wire [7:0] DPH_8d;
wire [7:0] DPH_8e;
wire [7:0] DPH_8f;
wire [7:0] DPH_90;
wire [7:0] DPH_a3;
wire [7:0] DPH_c5;
wire [7:0] DPH_d0;
wire [7:0] DPH_d5;
wire [7:0] DPH_f5;
wire [7:0] DPH_next;
wire [7:0] DPL_05;
wire [7:0] DPL_15;
wire [7:0] DPL_42;
wire [7:0] DPL_43;
wire [7:0] DPL_52;
wire [7:0] DPL_53;
wire [7:0] DPL_62;
wire [7:0] DPL_63;
wire [7:0] DPL_75;
wire [7:0] DPL_85;
wire [7:0] DPL_86;
wire [7:0] DPL_87;
wire [7:0] DPL_88;
wire [7:0] DPL_89;
wire [7:0] DPL_8a;
wire [7:0] DPL_8b;
wire [7:0] DPL_8c;
wire [7:0] DPL_8d;
wire [7:0] DPL_8e;
wire [7:0] DPL_8f;
wire [7:0] DPL_90;
wire [7:0] DPL_a3;
wire [7:0] DPL_c5;
wire [7:0] DPL_d0;
wire [7:0] DPL_d5;
wire [7:0] DPL_f5;
wire [7:0] DPL_next;
wire [7:0] IE_next;
wire [7:0] IP_next;
wire [7:0] P0_05;
wire [7:0] P0_10;
wire [7:0] P0_15;
wire [7:0] P0_42;
wire [7:0] P0_43;
wire [7:0] P0_52;
wire [7:0] P0_53;
wire [7:0] P0_62;
wire [7:0] P0_63;
wire [7:0] P0_75;
wire [7:0] P0_85;
wire [7:0] P0_86;
wire [7:0] P0_87;
wire [7:0] P0_88;
wire [7:0] P0_89;
wire [7:0] P0_8a;
wire [7:0] P0_8b;
wire [7:0] P0_8c;
wire [7:0] P0_8d;
wire [7:0] P0_8e;
wire [7:0] P0_8f;
wire [7:0] P0_92;
wire [7:0] P0_b2;
wire [7:0] P0_c2;
wire [7:0] P0_c5;
wire [7:0] P0_d0;
wire [7:0] P0_d2;
wire [7:0] P0_d5;
wire [7:0] P0_f5;
wire [7:0] P0_next;
wire [7:0] P1_05;
wire [7:0] P1_10;
wire [7:0] P1_15;
wire [7:0] P1_42;
wire [7:0] P1_43;
wire [7:0] P1_52;
wire [7:0] P1_53;
wire [7:0] P1_62;
wire [7:0] P1_63;
wire [7:0] P1_75;
wire [7:0] P1_85;
wire [7:0] P1_86;
wire [7:0] P1_87;
wire [7:0] P1_88;
wire [7:0] P1_89;
wire [7:0] P1_8a;
wire [7:0] P1_8b;
wire [7:0] P1_8c;
wire [7:0] P1_8d;
wire [7:0] P1_8e;
wire [7:0] P1_8f;
wire [7:0] P1_92;
wire [7:0] P1_b2;
wire [7:0] P1_c2;
wire [7:0] P1_c5;
wire [7:0] P1_d0;
wire [7:0] P1_d2;
wire [7:0] P1_d5;
wire [7:0] P1_f5;
wire [7:0] P1_next;
wire [7:0] P2_05;
wire [7:0] P2_10;
wire [7:0] P2_15;
wire [7:0] P2_42;
wire [7:0] P2_43;
wire [7:0] P2_52;
wire [7:0] P2_53;
wire [7:0] P2_62;
wire [7:0] P2_63;
wire [7:0] P2_75;
wire [7:0] P2_85;
wire [7:0] P2_86;
wire [7:0] P2_87;
wire [7:0] P2_88;
wire [7:0] P2_89;
wire [7:0] P2_8a;
wire [7:0] P2_8b;
wire [7:0] P2_8c;
wire [7:0] P2_8d;
wire [7:0] P2_8e;
wire [7:0] P2_8f;
wire [7:0] P2_92;
wire [7:0] P2_b2;
wire [7:0] P2_c2;
wire [7:0] P2_c5;
wire [7:0] P2_d0;
wire [7:0] P2_d2;
wire [7:0] P2_d5;
wire [7:0] P2_f5;
wire [7:0] P2_next;
wire [7:0] P3_05;
wire [7:0] P3_10;
wire [7:0] P3_15;
wire [7:0] P3_42;
wire [7:0] P3_43;
wire [7:0] P3_52;
wire [7:0] P3_53;
wire [7:0] P3_62;
wire [7:0] P3_63;
wire [7:0] P3_75;
wire [7:0] P3_85;
wire [7:0] P3_86;
wire [7:0] P3_87;
wire [7:0] P3_88;
wire [7:0] P3_89;
wire [7:0] P3_8a;
wire [7:0] P3_8b;
wire [7:0] P3_8c;
wire [7:0] P3_8d;
wire [7:0] P3_8e;
wire [7:0] P3_8f;
wire [7:0] P3_92;
wire [7:0] P3_b2;
wire [7:0] P3_c2;
wire [7:0] P3_c5;
wire [7:0] P3_d0;
wire [7:0] P3_d2;
wire [7:0] P3_d5;
wire [7:0] P3_f5;
wire [7:0] P3_next;
wire [7:0] PCON_next;
wire [15:0] PC_00;
wire [15:0] PC_01;
wire [15:0] PC_02;
wire [15:0] PC_03;
wire [15:0] PC_04;
wire [15:0] PC_05;
wire [15:0] PC_06;
wire [15:0] PC_07;
wire [15:0] PC_08;
wire [15:0] PC_09;
wire [15:0] PC_0a;
wire [15:0] PC_0b;
wire [15:0] PC_0c;
wire [15:0] PC_0d;
wire [15:0] PC_0e;
wire [15:0] PC_0f;
wire [15:0] PC_10;
wire [15:0] PC_11;
wire [15:0] PC_12;
wire [15:0] PC_13;
wire [15:0] PC_14;
wire [15:0] PC_15;
wire [15:0] PC_16;
wire [15:0] PC_17;
wire [15:0] PC_18;
wire [15:0] PC_19;
wire [15:0] PC_1a;
wire [15:0] PC_1b;
wire [15:0] PC_1c;
wire [15:0] PC_1d;
wire [15:0] PC_1e;
wire [15:0] PC_1f;
wire [15:0] PC_20;
wire [15:0] PC_21;
wire [15:0] PC_22;
wire [15:0] PC_23;
wire [15:0] PC_24;
wire [15:0] PC_25;
wire [15:0] PC_26;
wire [15:0] PC_27;
wire [15:0] PC_28;
wire [15:0] PC_29;
wire [15:0] PC_2a;
wire [15:0] PC_2b;
wire [15:0] PC_2c;
wire [15:0] PC_2d;
wire [15:0] PC_2e;
wire [15:0] PC_2f;
wire [15:0] PC_30;
wire [15:0] PC_31;
wire [15:0] PC_32;
wire [15:0] PC_33;
wire [15:0] PC_34;
wire [15:0] PC_35;
wire [15:0] PC_36;
wire [15:0] PC_37;
wire [15:0] PC_38;
wire [15:0] PC_39;
wire [15:0] PC_3a;
wire [15:0] PC_3b;
wire [15:0] PC_3c;
wire [15:0] PC_3d;
wire [15:0] PC_3e;
wire [15:0] PC_3f;
wire [15:0] PC_40;
wire [15:0] PC_41;
wire [15:0] PC_42;
wire [15:0] PC_43;
wire [15:0] PC_44;
wire [15:0] PC_45;
wire [15:0] PC_46;
wire [15:0] PC_47;
wire [15:0] PC_48;
wire [15:0] PC_49;
wire [15:0] PC_4a;
wire [15:0] PC_4b;
wire [15:0] PC_4c;
wire [15:0] PC_4d;
wire [15:0] PC_4e;
wire [15:0] PC_4f;
wire [15:0] PC_50;
wire [15:0] PC_51;
wire [15:0] PC_52;
wire [15:0] PC_53;
wire [15:0] PC_54;
wire [15:0] PC_55;
wire [15:0] PC_56;
wire [15:0] PC_57;
wire [15:0] PC_58;
wire [15:0] PC_59;
wire [15:0] PC_5a;
wire [15:0] PC_5b;
wire [15:0] PC_5c;
wire [15:0] PC_5d;
wire [15:0] PC_5e;
wire [15:0] PC_5f;
wire [15:0] PC_60;
wire [15:0] PC_61;
wire [15:0] PC_62;
wire [15:0] PC_63;
wire [15:0] PC_64;
wire [15:0] PC_65;
wire [15:0] PC_66;
wire [15:0] PC_67;
wire [15:0] PC_68;
wire [15:0] PC_69;
wire [15:0] PC_6a;
wire [15:0] PC_6b;
wire [15:0] PC_6c;
wire [15:0] PC_6d;
wire [15:0] PC_6e;
wire [15:0] PC_6f;
wire [15:0] PC_70;
wire [15:0] PC_71;
wire [15:0] PC_72;
wire [15:0] PC_73;
wire [15:0] PC_74;
wire [15:0] PC_75;
wire [15:0] PC_76;
wire [15:0] PC_77;
wire [15:0] PC_78;
wire [15:0] PC_79;
wire [15:0] PC_7a;
wire [15:0] PC_7b;
wire [15:0] PC_7c;
wire [15:0] PC_7d;
wire [15:0] PC_7e;
wire [15:0] PC_7f;
wire [15:0] PC_80;
wire [15:0] PC_81;
wire [15:0] PC_82;
wire [15:0] PC_83;
wire [15:0] PC_84;
wire [15:0] PC_85;
wire [15:0] PC_86;
wire [15:0] PC_87;
wire [15:0] PC_88;
wire [15:0] PC_89;
wire [15:0] PC_8a;
wire [15:0] PC_8b;
wire [15:0] PC_8c;
wire [15:0] PC_8d;
wire [15:0] PC_8e;
wire [15:0] PC_8f;
wire [15:0] PC_90;
wire [15:0] PC_91;
wire [15:0] PC_92;
wire [15:0] PC_93;
wire [15:0] PC_94;
wire [15:0] PC_95;
wire [15:0] PC_96;
wire [15:0] PC_97;
wire [15:0] PC_98;
wire [15:0] PC_99;
wire [15:0] PC_9a;
wire [15:0] PC_9b;
wire [15:0] PC_9c;
wire [15:0] PC_9d;
wire [15:0] PC_9e;
wire [15:0] PC_9f;
wire [15:0] PC_a0;
wire [15:0] PC_a1;
wire [15:0] PC_a2;
wire [15:0] PC_a3;
wire [15:0] PC_a4;
wire [15:0] PC_a5;
wire [15:0] PC_a6;
wire [15:0] PC_a7;
wire [15:0] PC_a8;
wire [15:0] PC_a9;
wire [15:0] PC_aa;
wire [15:0] PC_ab;
wire [15:0] PC_ac;
wire [15:0] PC_ad;
wire [15:0] PC_ae;
wire [15:0] PC_af;
wire [15:0] PC_b0;
wire [15:0] PC_b1;
wire [15:0] PC_b2;
wire [15:0] PC_b3;
wire [15:0] PC_b4;
wire [15:0] PC_b5;
wire [15:0] PC_b6;
wire [15:0] PC_b7;
wire [15:0] PC_b8;
wire [15:0] PC_b9;
wire [15:0] PC_ba;
wire [15:0] PC_bb;
wire [15:0] PC_bc;
wire [15:0] PC_bd;
wire [15:0] PC_be;
wire [15:0] PC_bf;
wire [15:0] PC_c0;
wire [15:0] PC_c1;
wire [15:0] PC_c2;
wire [15:0] PC_c3;
wire [15:0] PC_c4;
wire [15:0] PC_c5;
wire [15:0] PC_c6;
wire [15:0] PC_c7;
wire [15:0] PC_c8;
wire [15:0] PC_c9;
wire [15:0] PC_ca;
wire [15:0] PC_cb;
wire [15:0] PC_cc;
wire [15:0] PC_cd;
wire [15:0] PC_ce;
wire [15:0] PC_cf;
wire [15:0] PC_d0;
wire [15:0] PC_d1;
wire [15:0] PC_d2;
wire [15:0] PC_d3;
wire [15:0] PC_d4;
wire [15:0] PC_d5;
wire [15:0] PC_d6;
wire [15:0] PC_d7;
wire [15:0] PC_d8;
wire [15:0] PC_d9;
wire [15:0] PC_da;
wire [15:0] PC_db;
wire [15:0] PC_dc;
wire [15:0] PC_dd;
wire [15:0] PC_de;
wire [15:0] PC_df;
wire [15:0] PC_e0;
wire [15:0] PC_e1;
wire [15:0] PC_e2;
wire [15:0] PC_e3;
wire [15:0] PC_e4;
wire [15:0] PC_e5;
wire [15:0] PC_e6;
wire [15:0] PC_e7;
wire [15:0] PC_e8;
wire [15:0] PC_e9;
wire [15:0] PC_ea;
wire [15:0] PC_eb;
wire [15:0] PC_ec;
wire [15:0] PC_ed;
wire [15:0] PC_ee;
wire [15:0] PC_ef;
wire [15:0] PC_f0;
wire [15:0] PC_f1;
wire [15:0] PC_f2;
wire [15:0] PC_f3;
wire [15:0] PC_f4;
wire [15:0] PC_f5;
wire [15:0] PC_f6;
wire [15:0] PC_f7;
wire [15:0] PC_f8;
wire [15:0] PC_f9;
wire [15:0] PC_fa;
wire [15:0] PC_fb;
wire [15:0] PC_fc;
wire [15:0] PC_fd;
wire [15:0] PC_fe;
wire [15:0] PC_ff;
wire [15:0] PC_next;
wire [7:0] PSW_00;
wire [7:0] PSW_01;
wire [7:0] PSW_02;
wire [7:0] PSW_03;
wire [7:0] PSW_04;
wire [7:0] PSW_05;
wire [7:0] PSW_06;
wire [7:0] PSW_07;
wire [7:0] PSW_08;
wire [7:0] PSW_09;
wire [7:0] PSW_0a;
wire [7:0] PSW_0b;
wire [7:0] PSW_0c;
wire [7:0] PSW_0d;
wire [7:0] PSW_0e;
wire [7:0] PSW_0f;
wire [7:0] PSW_10;
wire [7:0] PSW_11;
wire [7:0] PSW_12;
wire [7:0] PSW_13;
wire [7:0] PSW_14;
wire [7:0] PSW_15;
wire [7:0] PSW_16;
wire [7:0] PSW_17;
wire [7:0] PSW_18;
wire [7:0] PSW_19;
wire [7:0] PSW_1a;
wire [7:0] PSW_1b;
wire [7:0] PSW_1c;
wire [7:0] PSW_1d;
wire [7:0] PSW_1e;
wire [7:0] PSW_1f;
wire [7:0] PSW_20;
wire [7:0] PSW_21;
wire [7:0] PSW_22;
wire [7:0] PSW_23;
wire [7:0] PSW_24;
wire [7:0] PSW_25;
wire [7:0] PSW_26;
wire [7:0] PSW_27;
wire [7:0] PSW_28;
wire [7:0] PSW_29;
wire [7:0] PSW_2a;
wire [7:0] PSW_2b;
wire [7:0] PSW_2c;
wire [7:0] PSW_2d;
wire [7:0] PSW_2e;
wire [7:0] PSW_2f;
wire [7:0] PSW_30;
wire [7:0] PSW_31;
wire [7:0] PSW_32;
wire [7:0] PSW_33;
wire [7:0] PSW_34;
wire [7:0] PSW_35;
wire [7:0] PSW_36;
wire [7:0] PSW_37;
wire [7:0] PSW_38;
wire [7:0] PSW_39;
wire [7:0] PSW_3a;
wire [7:0] PSW_3b;
wire [7:0] PSW_3c;
wire [7:0] PSW_3d;
wire [7:0] PSW_3e;
wire [7:0] PSW_3f;
wire [7:0] PSW_40;
wire [7:0] PSW_41;
wire [7:0] PSW_42;
wire [7:0] PSW_43;
wire [7:0] PSW_44;
wire [7:0] PSW_45;
wire [7:0] PSW_46;
wire [7:0] PSW_47;
wire [7:0] PSW_48;
wire [7:0] PSW_49;
wire [7:0] PSW_4a;
wire [7:0] PSW_4b;
wire [7:0] PSW_4c;
wire [7:0] PSW_4d;
wire [7:0] PSW_4e;
wire [7:0] PSW_4f;
wire [7:0] PSW_50;
wire [7:0] PSW_51;
wire [7:0] PSW_52;
wire [7:0] PSW_53;
wire [7:0] PSW_54;
wire [7:0] PSW_55;
wire [7:0] PSW_56;
wire [7:0] PSW_57;
wire [7:0] PSW_58;
wire [7:0] PSW_59;
wire [7:0] PSW_5a;
wire [7:0] PSW_5b;
wire [7:0] PSW_5c;
wire [7:0] PSW_5d;
wire [7:0] PSW_5e;
wire [7:0] PSW_5f;
wire [7:0] PSW_60;
wire [7:0] PSW_61;
wire [7:0] PSW_62;
wire [7:0] PSW_63;
wire [7:0] PSW_64;
wire [7:0] PSW_65;
wire [7:0] PSW_66;
wire [7:0] PSW_67;
wire [7:0] PSW_68;
wire [7:0] PSW_69;
wire [7:0] PSW_6a;
wire [7:0] PSW_6b;
wire [7:0] PSW_6c;
wire [7:0] PSW_6d;
wire [7:0] PSW_6e;
wire [7:0] PSW_6f;
wire [7:0] PSW_70;
wire [7:0] PSW_71;
wire [7:0] PSW_72;
wire [7:0] PSW_73;
wire [7:0] PSW_74;
wire [7:0] PSW_75;
wire [7:0] PSW_76;
wire [7:0] PSW_77;
wire [7:0] PSW_78;
wire [7:0] PSW_79;
wire [7:0] PSW_7a;
wire [7:0] PSW_7b;
wire [7:0] PSW_7c;
wire [7:0] PSW_7d;
wire [7:0] PSW_7e;
wire [7:0] PSW_7f;
wire [7:0] PSW_80;
wire [7:0] PSW_81;
wire [7:0] PSW_82;
wire [7:0] PSW_83;
wire [7:0] PSW_84;
wire [7:0] PSW_85;
wire [7:0] PSW_86;
wire [7:0] PSW_87;
wire [7:0] PSW_88;
wire [7:0] PSW_89;
wire [7:0] PSW_8a;
wire [7:0] PSW_8b;
wire [7:0] PSW_8c;
wire [7:0] PSW_8d;
wire [7:0] PSW_8e;
wire [7:0] PSW_8f;
wire [7:0] PSW_90;
wire [7:0] PSW_91;
wire [7:0] PSW_92;
wire [7:0] PSW_93;
wire [7:0] PSW_94;
wire [7:0] PSW_95;
wire [7:0] PSW_96;
wire [7:0] PSW_97;
wire [7:0] PSW_98;
wire [7:0] PSW_99;
wire [7:0] PSW_9a;
wire [7:0] PSW_9b;
wire [7:0] PSW_9c;
wire [7:0] PSW_9d;
wire [7:0] PSW_9e;
wire [7:0] PSW_9f;
wire [7:0] PSW_a0;
wire [7:0] PSW_a1;
wire [7:0] PSW_a2;
wire [7:0] PSW_a3;
wire [7:0] PSW_a4;
wire [7:0] PSW_a5;
wire [7:0] PSW_a6;
wire [7:0] PSW_a7;
wire [7:0] PSW_a8;
wire [7:0] PSW_a9;
wire [7:0] PSW_aa;
wire [7:0] PSW_ab;
wire [7:0] PSW_ac;
wire [7:0] PSW_ad;
wire [7:0] PSW_ae;
wire [7:0] PSW_af;
wire [7:0] PSW_b0;
wire [7:0] PSW_b1;
wire [7:0] PSW_b2;
wire [7:0] PSW_b3;
wire [7:0] PSW_b4;
wire [7:0] PSW_b5;
wire [7:0] PSW_b6;
wire [7:0] PSW_b7;
wire [7:0] PSW_b8;
wire [7:0] PSW_b9;
wire [7:0] PSW_ba;
wire [7:0] PSW_bb;
wire [7:0] PSW_bc;
wire [7:0] PSW_bd;
wire [7:0] PSW_be;
wire [7:0] PSW_bf;
wire [7:0] PSW_c0;
wire [7:0] PSW_c1;
wire [7:0] PSW_c2;
wire [7:0] PSW_c3;
wire [7:0] PSW_c4;
wire [7:0] PSW_c5;
wire [7:0] PSW_c6;
wire [7:0] PSW_c7;
wire [7:0] PSW_c8;
wire [7:0] PSW_c9;
wire [7:0] PSW_ca;
wire [7:0] PSW_cb;
wire [7:0] PSW_cc;
wire [7:0] PSW_cd;
wire [7:0] PSW_ce;
wire [7:0] PSW_cf;
wire [7:0] PSW_d0;
wire [7:0] PSW_d1;
wire [7:0] PSW_d2;
wire [7:0] PSW_d3;
wire [7:0] PSW_d4;
wire [7:0] PSW_d5;
wire [7:0] PSW_d6;
wire [7:0] PSW_d7;
wire [7:0] PSW_d8;
wire [7:0] PSW_d9;
wire [7:0] PSW_da;
wire [7:0] PSW_db;
wire [7:0] PSW_dc;
wire [7:0] PSW_dd;
wire [7:0] PSW_de;
wire [7:0] PSW_df;
wire [7:0] PSW_e0;
wire [7:0] PSW_e1;
wire [7:0] PSW_e2;
wire [7:0] PSW_e3;
wire [7:0] PSW_e4;
wire [7:0] PSW_e5;
wire [7:0] PSW_e6;
wire [7:0] PSW_e7;
wire [7:0] PSW_e8;
wire [7:0] PSW_e9;
wire [7:0] PSW_ea;
wire [7:0] PSW_eb;
wire [7:0] PSW_ec;
wire [7:0] PSW_ed;
wire [7:0] PSW_ee;
wire [7:0] PSW_ef;
wire [7:0] PSW_f0;
wire [7:0] PSW_f1;
wire [7:0] PSW_f2;
wire [7:0] PSW_f3;
wire [7:0] PSW_f4;
wire [7:0] PSW_f5;
wire [7:0] PSW_f6;
wire [7:0] PSW_f7;
wire [7:0] PSW_f8;
wire [7:0] PSW_f9;
wire [7:0] PSW_fa;
wire [7:0] PSW_fb;
wire [7:0] PSW_fc;
wire [7:0] PSW_fd;
wire [7:0] PSW_fe;
wire [7:0] PSW_ff;
wire [7:0] PSW_next;
wire [7:0] RD_IRAM_0;
wire [7:0] RD_IRAM_0_ADDR;
wire [7:0] RD_IRAM_1;
wire [7:0] RD_IRAM_1_ADDR;
wire [7:0] RD_ROM_0;
wire [15:0] RD_ROM_0_ADDR;
wire [7:0] RD_ROM_1;
wire [15:0] RD_ROM_1_ADDR;
wire [7:0] RD_ROM_2;
wire [15:0] RD_ROM_2_ADDR;
wire [7:0] SBUF_next;
wire [7:0] SCON_next;
wire [7:0] SP_05;
wire [7:0] SP_11;
wire [7:0] SP_12;
wire [7:0] SP_15;
wire [7:0] SP_22;
wire [7:0] SP_31;
wire [7:0] SP_32;
wire [7:0] SP_42;
wire [7:0] SP_43;
wire [7:0] SP_51;
wire [7:0] SP_52;
wire [7:0] SP_53;
wire [7:0] SP_62;
wire [7:0] SP_63;
wire [7:0] SP_71;
wire [7:0] SP_75;
wire [7:0] SP_85;
wire [7:0] SP_86;
wire [7:0] SP_87;
wire [7:0] SP_88;
wire [7:0] SP_89;
wire [7:0] SP_8a;
wire [7:0] SP_8b;
wire [7:0] SP_8c;
wire [7:0] SP_8d;
wire [7:0] SP_8e;
wire [7:0] SP_8f;
wire [7:0] SP_91;
wire [7:0] SP_b1;
wire [7:0] SP_c0;
wire [7:0] SP_c5;
wire [7:0] SP_d0;
wire [7:0] SP_d1;
wire [7:0] SP_d5;
wire [7:0] SP_f1;
wire [7:0] SP_f5;
wire [7:0] SP_next;
wire [7:0] TCON_next;
wire [7:0] TH0_next;
wire [7:0] TH1_next;
wire [7:0] TL0_next;
wire [7:0] TL1_next;
wire [7:0] TMOD_next;
wire [3:0] WR_ADDR_0_IRAM;
wire [3:0] WR_ADDR_1_IRAM;
wire WR_COND_0_IRAM;
wire WR_COND_1_IRAM;
wire [7:0] WR_DATA_0_IRAM;
wire [7:0] WR_DATA_1_IRAM;
wire [15:0] XRAM_ADDR_00;
wire [15:0] XRAM_ADDR_01;
wire [15:0] XRAM_ADDR_02;
wire [15:0] XRAM_ADDR_03;
wire [15:0] XRAM_ADDR_04;
wire [15:0] XRAM_ADDR_05;
wire [15:0] XRAM_ADDR_06;
wire [15:0] XRAM_ADDR_07;
wire [15:0] XRAM_ADDR_08;
wire [15:0] XRAM_ADDR_09;
wire [15:0] XRAM_ADDR_0a;
wire [15:0] XRAM_ADDR_0b;
wire [15:0] XRAM_ADDR_0c;
wire [15:0] XRAM_ADDR_0d;
wire [15:0] XRAM_ADDR_0e;
wire [15:0] XRAM_ADDR_0f;
wire [15:0] XRAM_ADDR_10;
wire [15:0] XRAM_ADDR_11;
wire [15:0] XRAM_ADDR_12;
wire [15:0] XRAM_ADDR_13;
wire [15:0] XRAM_ADDR_14;
wire [15:0] XRAM_ADDR_15;
wire [15:0] XRAM_ADDR_16;
wire [15:0] XRAM_ADDR_17;
wire [15:0] XRAM_ADDR_18;
wire [15:0] XRAM_ADDR_19;
wire [15:0] XRAM_ADDR_1a;
wire [15:0] XRAM_ADDR_1b;
wire [15:0] XRAM_ADDR_1c;
wire [15:0] XRAM_ADDR_1d;
wire [15:0] XRAM_ADDR_1e;
wire [15:0] XRAM_ADDR_1f;
wire [15:0] XRAM_ADDR_20;
wire [15:0] XRAM_ADDR_21;
wire [15:0] XRAM_ADDR_22;
wire [15:0] XRAM_ADDR_23;
wire [15:0] XRAM_ADDR_24;
wire [15:0] XRAM_ADDR_25;
wire [15:0] XRAM_ADDR_26;
wire [15:0] XRAM_ADDR_27;
wire [15:0] XRAM_ADDR_28;
wire [15:0] XRAM_ADDR_29;
wire [15:0] XRAM_ADDR_2a;
wire [15:0] XRAM_ADDR_2b;
wire [15:0] XRAM_ADDR_2c;
wire [15:0] XRAM_ADDR_2d;
wire [15:0] XRAM_ADDR_2e;
wire [15:0] XRAM_ADDR_2f;
wire [15:0] XRAM_ADDR_30;
wire [15:0] XRAM_ADDR_31;
wire [15:0] XRAM_ADDR_32;
wire [15:0] XRAM_ADDR_33;
wire [15:0] XRAM_ADDR_34;
wire [15:0] XRAM_ADDR_35;
wire [15:0] XRAM_ADDR_36;
wire [15:0] XRAM_ADDR_37;
wire [15:0] XRAM_ADDR_38;
wire [15:0] XRAM_ADDR_39;
wire [15:0] XRAM_ADDR_3a;
wire [15:0] XRAM_ADDR_3b;
wire [15:0] XRAM_ADDR_3c;
wire [15:0] XRAM_ADDR_3d;
wire [15:0] XRAM_ADDR_3e;
wire [15:0] XRAM_ADDR_3f;
wire [15:0] XRAM_ADDR_40;
wire [15:0] XRAM_ADDR_41;
wire [15:0] XRAM_ADDR_42;
wire [15:0] XRAM_ADDR_43;
wire [15:0] XRAM_ADDR_44;
wire [15:0] XRAM_ADDR_45;
wire [15:0] XRAM_ADDR_46;
wire [15:0] XRAM_ADDR_47;
wire [15:0] XRAM_ADDR_48;
wire [15:0] XRAM_ADDR_49;
wire [15:0] XRAM_ADDR_4a;
wire [15:0] XRAM_ADDR_4b;
wire [15:0] XRAM_ADDR_4c;
wire [15:0] XRAM_ADDR_4d;
wire [15:0] XRAM_ADDR_4e;
wire [15:0] XRAM_ADDR_4f;
wire [15:0] XRAM_ADDR_50;
wire [15:0] XRAM_ADDR_51;
wire [15:0] XRAM_ADDR_52;
wire [15:0] XRAM_ADDR_53;
wire [15:0] XRAM_ADDR_54;
wire [15:0] XRAM_ADDR_55;
wire [15:0] XRAM_ADDR_56;
wire [15:0] XRAM_ADDR_57;
wire [15:0] XRAM_ADDR_58;
wire [15:0] XRAM_ADDR_59;
wire [15:0] XRAM_ADDR_5a;
wire [15:0] XRAM_ADDR_5b;
wire [15:0] XRAM_ADDR_5c;
wire [15:0] XRAM_ADDR_5d;
wire [15:0] XRAM_ADDR_5e;
wire [15:0] XRAM_ADDR_5f;
wire [15:0] XRAM_ADDR_60;
wire [15:0] XRAM_ADDR_61;
wire [15:0] XRAM_ADDR_62;
wire [15:0] XRAM_ADDR_63;
wire [15:0] XRAM_ADDR_64;
wire [15:0] XRAM_ADDR_65;
wire [15:0] XRAM_ADDR_66;
wire [15:0] XRAM_ADDR_67;
wire [15:0] XRAM_ADDR_68;
wire [15:0] XRAM_ADDR_69;
wire [15:0] XRAM_ADDR_6a;
wire [15:0] XRAM_ADDR_6b;
wire [15:0] XRAM_ADDR_6c;
wire [15:0] XRAM_ADDR_6d;
wire [15:0] XRAM_ADDR_6e;
wire [15:0] XRAM_ADDR_6f;
wire [15:0] XRAM_ADDR_70;
wire [15:0] XRAM_ADDR_71;
wire [15:0] XRAM_ADDR_72;
wire [15:0] XRAM_ADDR_73;
wire [15:0] XRAM_ADDR_74;
wire [15:0] XRAM_ADDR_75;
wire [15:0] XRAM_ADDR_76;
wire [15:0] XRAM_ADDR_77;
wire [15:0] XRAM_ADDR_78;
wire [15:0] XRAM_ADDR_79;
wire [15:0] XRAM_ADDR_7a;
wire [15:0] XRAM_ADDR_7b;
wire [15:0] XRAM_ADDR_7c;
wire [15:0] XRAM_ADDR_7d;
wire [15:0] XRAM_ADDR_7e;
wire [15:0] XRAM_ADDR_7f;
wire [15:0] XRAM_ADDR_80;
wire [15:0] XRAM_ADDR_81;
wire [15:0] XRAM_ADDR_82;
wire [15:0] XRAM_ADDR_83;
wire [15:0] XRAM_ADDR_84;
wire [15:0] XRAM_ADDR_85;
wire [15:0] XRAM_ADDR_86;
wire [15:0] XRAM_ADDR_87;
wire [15:0] XRAM_ADDR_88;
wire [15:0] XRAM_ADDR_89;
wire [15:0] XRAM_ADDR_8a;
wire [15:0] XRAM_ADDR_8b;
wire [15:0] XRAM_ADDR_8c;
wire [15:0] XRAM_ADDR_8d;
wire [15:0] XRAM_ADDR_8e;
wire [15:0] XRAM_ADDR_8f;
wire [15:0] XRAM_ADDR_90;
wire [15:0] XRAM_ADDR_91;
wire [15:0] XRAM_ADDR_92;
wire [15:0] XRAM_ADDR_93;
wire [15:0] XRAM_ADDR_94;
wire [15:0] XRAM_ADDR_95;
wire [15:0] XRAM_ADDR_96;
wire [15:0] XRAM_ADDR_97;
wire [15:0] XRAM_ADDR_98;
wire [15:0] XRAM_ADDR_99;
wire [15:0] XRAM_ADDR_9a;
wire [15:0] XRAM_ADDR_9b;
wire [15:0] XRAM_ADDR_9c;
wire [15:0] XRAM_ADDR_9d;
wire [15:0] XRAM_ADDR_9e;
wire [15:0] XRAM_ADDR_9f;
wire [15:0] XRAM_ADDR_a0;
wire [15:0] XRAM_ADDR_a1;
wire [15:0] XRAM_ADDR_a2;
wire [15:0] XRAM_ADDR_a3;
wire [15:0] XRAM_ADDR_a4;
wire [15:0] XRAM_ADDR_a5;
wire [15:0] XRAM_ADDR_a6;
wire [15:0] XRAM_ADDR_a7;
wire [15:0] XRAM_ADDR_a8;
wire [15:0] XRAM_ADDR_a9;
wire [15:0] XRAM_ADDR_aa;
wire [15:0] XRAM_ADDR_ab;
wire [15:0] XRAM_ADDR_ac;
wire [15:0] XRAM_ADDR_ad;
wire [15:0] XRAM_ADDR_ae;
wire [15:0] XRAM_ADDR_af;
wire [15:0] XRAM_ADDR_b0;
wire [15:0] XRAM_ADDR_b1;
wire [15:0] XRAM_ADDR_b2;
wire [15:0] XRAM_ADDR_b3;
wire [15:0] XRAM_ADDR_b4;
wire [15:0] XRAM_ADDR_b5;
wire [15:0] XRAM_ADDR_b6;
wire [15:0] XRAM_ADDR_b7;
wire [15:0] XRAM_ADDR_b8;
wire [15:0] XRAM_ADDR_b9;
wire [15:0] XRAM_ADDR_ba;
wire [15:0] XRAM_ADDR_bb;
wire [15:0] XRAM_ADDR_bc;
wire [15:0] XRAM_ADDR_bd;
wire [15:0] XRAM_ADDR_be;
wire [15:0] XRAM_ADDR_bf;
wire [15:0] XRAM_ADDR_c0;
wire [15:0] XRAM_ADDR_c1;
wire [15:0] XRAM_ADDR_c2;
wire [15:0] XRAM_ADDR_c3;
wire [15:0] XRAM_ADDR_c4;
wire [15:0] XRAM_ADDR_c5;
wire [15:0] XRAM_ADDR_c6;
wire [15:0] XRAM_ADDR_c7;
wire [15:0] XRAM_ADDR_c8;
wire [15:0] XRAM_ADDR_c9;
wire [15:0] XRAM_ADDR_ca;
wire [15:0] XRAM_ADDR_cb;
wire [15:0] XRAM_ADDR_cc;
wire [15:0] XRAM_ADDR_cd;
wire [15:0] XRAM_ADDR_ce;
wire [15:0] XRAM_ADDR_cf;
wire [15:0] XRAM_ADDR_d0;
wire [15:0] XRAM_ADDR_d1;
wire [15:0] XRAM_ADDR_d2;
wire [15:0] XRAM_ADDR_d3;
wire [15:0] XRAM_ADDR_d4;
wire [15:0] XRAM_ADDR_d5;
wire [15:0] XRAM_ADDR_d6;
wire [15:0] XRAM_ADDR_d7;
wire [15:0] XRAM_ADDR_d8;
wire [15:0] XRAM_ADDR_d9;
wire [15:0] XRAM_ADDR_da;
wire [15:0] XRAM_ADDR_db;
wire [15:0] XRAM_ADDR_dc;
wire [15:0] XRAM_ADDR_dd;
wire [15:0] XRAM_ADDR_de;
wire [15:0] XRAM_ADDR_df;
wire [15:0] XRAM_ADDR_e0;
wire [15:0] XRAM_ADDR_e1;
wire [15:0] XRAM_ADDR_e2;
wire [15:0] XRAM_ADDR_e3;
wire [15:0] XRAM_ADDR_e4;
wire [15:0] XRAM_ADDR_e5;
wire [15:0] XRAM_ADDR_e6;
wire [15:0] XRAM_ADDR_e7;
wire [15:0] XRAM_ADDR_e8;
wire [15:0] XRAM_ADDR_e9;
wire [15:0] XRAM_ADDR_ea;
wire [15:0] XRAM_ADDR_eb;
wire [15:0] XRAM_ADDR_ec;
wire [15:0] XRAM_ADDR_ed;
wire [15:0] XRAM_ADDR_ee;
wire [15:0] XRAM_ADDR_ef;
wire [15:0] XRAM_ADDR_f0;
wire [15:0] XRAM_ADDR_f1;
wire [15:0] XRAM_ADDR_f2;
wire [15:0] XRAM_ADDR_f3;
wire [15:0] XRAM_ADDR_f4;
wire [15:0] XRAM_ADDR_f5;
wire [15:0] XRAM_ADDR_f6;
wire [15:0] XRAM_ADDR_f7;
wire [15:0] XRAM_ADDR_f8;
wire [15:0] XRAM_ADDR_f9;
wire [15:0] XRAM_ADDR_fa;
wire [15:0] XRAM_ADDR_fb;
wire [15:0] XRAM_ADDR_fc;
wire [15:0] XRAM_ADDR_fd;
wire [15:0] XRAM_ADDR_fe;
wire [15:0] XRAM_ADDR_ff;
wire [15:0] XRAM_ADDR_next;
wire [7:0] XRAM_DATA_OUT_00;
wire [7:0] XRAM_DATA_OUT_01;
wire [7:0] XRAM_DATA_OUT_02;
wire [7:0] XRAM_DATA_OUT_03;
wire [7:0] XRAM_DATA_OUT_04;
wire [7:0] XRAM_DATA_OUT_05;
wire [7:0] XRAM_DATA_OUT_06;
wire [7:0] XRAM_DATA_OUT_07;
wire [7:0] XRAM_DATA_OUT_08;
wire [7:0] XRAM_DATA_OUT_09;
wire [7:0] XRAM_DATA_OUT_0a;
wire [7:0] XRAM_DATA_OUT_0b;
wire [7:0] XRAM_DATA_OUT_0c;
wire [7:0] XRAM_DATA_OUT_0d;
wire [7:0] XRAM_DATA_OUT_0e;
wire [7:0] XRAM_DATA_OUT_0f;
wire [7:0] XRAM_DATA_OUT_10;
wire [7:0] XRAM_DATA_OUT_11;
wire [7:0] XRAM_DATA_OUT_12;
wire [7:0] XRAM_DATA_OUT_13;
wire [7:0] XRAM_DATA_OUT_14;
wire [7:0] XRAM_DATA_OUT_15;
wire [7:0] XRAM_DATA_OUT_16;
wire [7:0] XRAM_DATA_OUT_17;
wire [7:0] XRAM_DATA_OUT_18;
wire [7:0] XRAM_DATA_OUT_19;
wire [7:0] XRAM_DATA_OUT_1a;
wire [7:0] XRAM_DATA_OUT_1b;
wire [7:0] XRAM_DATA_OUT_1c;
wire [7:0] XRAM_DATA_OUT_1d;
wire [7:0] XRAM_DATA_OUT_1e;
wire [7:0] XRAM_DATA_OUT_1f;
wire [7:0] XRAM_DATA_OUT_20;
wire [7:0] XRAM_DATA_OUT_21;
wire [7:0] XRAM_DATA_OUT_22;
wire [7:0] XRAM_DATA_OUT_23;
wire [7:0] XRAM_DATA_OUT_24;
wire [7:0] XRAM_DATA_OUT_25;
wire [7:0] XRAM_DATA_OUT_26;
wire [7:0] XRAM_DATA_OUT_27;
wire [7:0] XRAM_DATA_OUT_28;
wire [7:0] XRAM_DATA_OUT_29;
wire [7:0] XRAM_DATA_OUT_2a;
wire [7:0] XRAM_DATA_OUT_2b;
wire [7:0] XRAM_DATA_OUT_2c;
wire [7:0] XRAM_DATA_OUT_2d;
wire [7:0] XRAM_DATA_OUT_2e;
wire [7:0] XRAM_DATA_OUT_2f;
wire [7:0] XRAM_DATA_OUT_30;
wire [7:0] XRAM_DATA_OUT_31;
wire [7:0] XRAM_DATA_OUT_32;
wire [7:0] XRAM_DATA_OUT_33;
wire [7:0] XRAM_DATA_OUT_34;
wire [7:0] XRAM_DATA_OUT_35;
wire [7:0] XRAM_DATA_OUT_36;
wire [7:0] XRAM_DATA_OUT_37;
wire [7:0] XRAM_DATA_OUT_38;
wire [7:0] XRAM_DATA_OUT_39;
wire [7:0] XRAM_DATA_OUT_3a;
wire [7:0] XRAM_DATA_OUT_3b;
wire [7:0] XRAM_DATA_OUT_3c;
wire [7:0] XRAM_DATA_OUT_3d;
wire [7:0] XRAM_DATA_OUT_3e;
wire [7:0] XRAM_DATA_OUT_3f;
wire [7:0] XRAM_DATA_OUT_40;
wire [7:0] XRAM_DATA_OUT_41;
wire [7:0] XRAM_DATA_OUT_42;
wire [7:0] XRAM_DATA_OUT_43;
wire [7:0] XRAM_DATA_OUT_44;
wire [7:0] XRAM_DATA_OUT_45;
wire [7:0] XRAM_DATA_OUT_46;
wire [7:0] XRAM_DATA_OUT_47;
wire [7:0] XRAM_DATA_OUT_48;
wire [7:0] XRAM_DATA_OUT_49;
wire [7:0] XRAM_DATA_OUT_4a;
wire [7:0] XRAM_DATA_OUT_4b;
wire [7:0] XRAM_DATA_OUT_4c;
wire [7:0] XRAM_DATA_OUT_4d;
wire [7:0] XRAM_DATA_OUT_4e;
wire [7:0] XRAM_DATA_OUT_4f;
wire [7:0] XRAM_DATA_OUT_50;
wire [7:0] XRAM_DATA_OUT_51;
wire [7:0] XRAM_DATA_OUT_52;
wire [7:0] XRAM_DATA_OUT_53;
wire [7:0] XRAM_DATA_OUT_54;
wire [7:0] XRAM_DATA_OUT_55;
wire [7:0] XRAM_DATA_OUT_56;
wire [7:0] XRAM_DATA_OUT_57;
wire [7:0] XRAM_DATA_OUT_58;
wire [7:0] XRAM_DATA_OUT_59;
wire [7:0] XRAM_DATA_OUT_5a;
wire [7:0] XRAM_DATA_OUT_5b;
wire [7:0] XRAM_DATA_OUT_5c;
wire [7:0] XRAM_DATA_OUT_5d;
wire [7:0] XRAM_DATA_OUT_5e;
wire [7:0] XRAM_DATA_OUT_5f;
wire [7:0] XRAM_DATA_OUT_60;
wire [7:0] XRAM_DATA_OUT_61;
wire [7:0] XRAM_DATA_OUT_62;
wire [7:0] XRAM_DATA_OUT_63;
wire [7:0] XRAM_DATA_OUT_64;
wire [7:0] XRAM_DATA_OUT_65;
wire [7:0] XRAM_DATA_OUT_66;
wire [7:0] XRAM_DATA_OUT_67;
wire [7:0] XRAM_DATA_OUT_68;
wire [7:0] XRAM_DATA_OUT_69;
wire [7:0] XRAM_DATA_OUT_6a;
wire [7:0] XRAM_DATA_OUT_6b;
wire [7:0] XRAM_DATA_OUT_6c;
wire [7:0] XRAM_DATA_OUT_6d;
wire [7:0] XRAM_DATA_OUT_6e;
wire [7:0] XRAM_DATA_OUT_6f;
wire [7:0] XRAM_DATA_OUT_70;
wire [7:0] XRAM_DATA_OUT_71;
wire [7:0] XRAM_DATA_OUT_72;
wire [7:0] XRAM_DATA_OUT_73;
wire [7:0] XRAM_DATA_OUT_74;
wire [7:0] XRAM_DATA_OUT_75;
wire [7:0] XRAM_DATA_OUT_76;
wire [7:0] XRAM_DATA_OUT_77;
wire [7:0] XRAM_DATA_OUT_78;
wire [7:0] XRAM_DATA_OUT_79;
wire [7:0] XRAM_DATA_OUT_7a;
wire [7:0] XRAM_DATA_OUT_7b;
wire [7:0] XRAM_DATA_OUT_7c;
wire [7:0] XRAM_DATA_OUT_7d;
wire [7:0] XRAM_DATA_OUT_7e;
wire [7:0] XRAM_DATA_OUT_7f;
wire [7:0] XRAM_DATA_OUT_80;
wire [7:0] XRAM_DATA_OUT_81;
wire [7:0] XRAM_DATA_OUT_82;
wire [7:0] XRAM_DATA_OUT_83;
wire [7:0] XRAM_DATA_OUT_84;
wire [7:0] XRAM_DATA_OUT_85;
wire [7:0] XRAM_DATA_OUT_86;
wire [7:0] XRAM_DATA_OUT_87;
wire [7:0] XRAM_DATA_OUT_88;
wire [7:0] XRAM_DATA_OUT_89;
wire [7:0] XRAM_DATA_OUT_8a;
wire [7:0] XRAM_DATA_OUT_8b;
wire [7:0] XRAM_DATA_OUT_8c;
wire [7:0] XRAM_DATA_OUT_8d;
wire [7:0] XRAM_DATA_OUT_8e;
wire [7:0] XRAM_DATA_OUT_8f;
wire [7:0] XRAM_DATA_OUT_90;
wire [7:0] XRAM_DATA_OUT_91;
wire [7:0] XRAM_DATA_OUT_92;
wire [7:0] XRAM_DATA_OUT_93;
wire [7:0] XRAM_DATA_OUT_94;
wire [7:0] XRAM_DATA_OUT_95;
wire [7:0] XRAM_DATA_OUT_96;
wire [7:0] XRAM_DATA_OUT_97;
wire [7:0] XRAM_DATA_OUT_98;
wire [7:0] XRAM_DATA_OUT_99;
wire [7:0] XRAM_DATA_OUT_9a;
wire [7:0] XRAM_DATA_OUT_9b;
wire [7:0] XRAM_DATA_OUT_9c;
wire [7:0] XRAM_DATA_OUT_9d;
wire [7:0] XRAM_DATA_OUT_9e;
wire [7:0] XRAM_DATA_OUT_9f;
wire [7:0] XRAM_DATA_OUT_a0;
wire [7:0] XRAM_DATA_OUT_a1;
wire [7:0] XRAM_DATA_OUT_a2;
wire [7:0] XRAM_DATA_OUT_a3;
wire [7:0] XRAM_DATA_OUT_a4;
wire [7:0] XRAM_DATA_OUT_a5;
wire [7:0] XRAM_DATA_OUT_a6;
wire [7:0] XRAM_DATA_OUT_a7;
wire [7:0] XRAM_DATA_OUT_a8;
wire [7:0] XRAM_DATA_OUT_a9;
wire [7:0] XRAM_DATA_OUT_aa;
wire [7:0] XRAM_DATA_OUT_ab;
wire [7:0] XRAM_DATA_OUT_ac;
wire [7:0] XRAM_DATA_OUT_ad;
wire [7:0] XRAM_DATA_OUT_ae;
wire [7:0] XRAM_DATA_OUT_af;
wire [7:0] XRAM_DATA_OUT_b0;
wire [7:0] XRAM_DATA_OUT_b1;
wire [7:0] XRAM_DATA_OUT_b2;
wire [7:0] XRAM_DATA_OUT_b3;
wire [7:0] XRAM_DATA_OUT_b4;
wire [7:0] XRAM_DATA_OUT_b5;
wire [7:0] XRAM_DATA_OUT_b6;
wire [7:0] XRAM_DATA_OUT_b7;
wire [7:0] XRAM_DATA_OUT_b8;
wire [7:0] XRAM_DATA_OUT_b9;
wire [7:0] XRAM_DATA_OUT_ba;
wire [7:0] XRAM_DATA_OUT_bb;
wire [7:0] XRAM_DATA_OUT_bc;
wire [7:0] XRAM_DATA_OUT_bd;
wire [7:0] XRAM_DATA_OUT_be;
wire [7:0] XRAM_DATA_OUT_bf;
wire [7:0] XRAM_DATA_OUT_c0;
wire [7:0] XRAM_DATA_OUT_c1;
wire [7:0] XRAM_DATA_OUT_c2;
wire [7:0] XRAM_DATA_OUT_c3;
wire [7:0] XRAM_DATA_OUT_c4;
wire [7:0] XRAM_DATA_OUT_c5;
wire [7:0] XRAM_DATA_OUT_c6;
wire [7:0] XRAM_DATA_OUT_c7;
wire [7:0] XRAM_DATA_OUT_c8;
wire [7:0] XRAM_DATA_OUT_c9;
wire [7:0] XRAM_DATA_OUT_ca;
wire [7:0] XRAM_DATA_OUT_cb;
wire [7:0] XRAM_DATA_OUT_cc;
wire [7:0] XRAM_DATA_OUT_cd;
wire [7:0] XRAM_DATA_OUT_ce;
wire [7:0] XRAM_DATA_OUT_cf;
wire [7:0] XRAM_DATA_OUT_d0;
wire [7:0] XRAM_DATA_OUT_d1;
wire [7:0] XRAM_DATA_OUT_d2;
wire [7:0] XRAM_DATA_OUT_d3;
wire [7:0] XRAM_DATA_OUT_d4;
wire [7:0] XRAM_DATA_OUT_d5;
wire [7:0] XRAM_DATA_OUT_d6;
wire [7:0] XRAM_DATA_OUT_d7;
wire [7:0] XRAM_DATA_OUT_d8;
wire [7:0] XRAM_DATA_OUT_d9;
wire [7:0] XRAM_DATA_OUT_da;
wire [7:0] XRAM_DATA_OUT_db;
wire [7:0] XRAM_DATA_OUT_dc;
wire [7:0] XRAM_DATA_OUT_dd;
wire [7:0] XRAM_DATA_OUT_de;
wire [7:0] XRAM_DATA_OUT_df;
wire [7:0] XRAM_DATA_OUT_e0;
wire [7:0] XRAM_DATA_OUT_e1;
wire [7:0] XRAM_DATA_OUT_e2;
wire [7:0] XRAM_DATA_OUT_e3;
wire [7:0] XRAM_DATA_OUT_e4;
wire [7:0] XRAM_DATA_OUT_e5;
wire [7:0] XRAM_DATA_OUT_e6;
wire [7:0] XRAM_DATA_OUT_e7;
wire [7:0] XRAM_DATA_OUT_e8;
wire [7:0] XRAM_DATA_OUT_e9;
wire [7:0] XRAM_DATA_OUT_ea;
wire [7:0] XRAM_DATA_OUT_eb;
wire [7:0] XRAM_DATA_OUT_ec;
wire [7:0] XRAM_DATA_OUT_ed;
wire [7:0] XRAM_DATA_OUT_ee;
wire [7:0] XRAM_DATA_OUT_ef;
wire [7:0] XRAM_DATA_OUT_f0;
wire [7:0] XRAM_DATA_OUT_f1;
wire [7:0] XRAM_DATA_OUT_f2;
wire [7:0] XRAM_DATA_OUT_f3;
wire [7:0] XRAM_DATA_OUT_f4;
wire [7:0] XRAM_DATA_OUT_f5;
wire [7:0] XRAM_DATA_OUT_f6;
wire [7:0] XRAM_DATA_OUT_f7;
wire [7:0] XRAM_DATA_OUT_f8;
wire [7:0] XRAM_DATA_OUT_f9;
wire [7:0] XRAM_DATA_OUT_fa;
wire [7:0] XRAM_DATA_OUT_fb;
wire [7:0] XRAM_DATA_OUT_fc;
wire [7:0] XRAM_DATA_OUT_fd;
wire [7:0] XRAM_DATA_OUT_fe;
wire [7:0] XRAM_DATA_OUT_ff;
wire [7:0] XRAM_DATA_OUT_next;
wire [7:0] n0001;
wire n0002;
wire [7:0] n0003;
wire n0004;
wire [2:0] n0005;
wire [1:0] n0006;
wire [7:0] n0007;
wire [7:0] n0008;
wire n0009;
wire [2:0] n0010;
wire [7:0] n0011;
wire [7:0] n0012;
wire n0013;
wire [7:0] n0014;
wire n0015;
wire [7:0] n0016;
wire n0017;
wire [2:0] n0018;
wire [7:0] n0019;
wire [7:0] n0020;
wire n0021;
wire [2:0] n0022;
wire [7:0] n0023;
wire [7:0] n0024;
wire n0025;
wire [2:0] n0026;
wire [7:0] n0027;
wire [7:0] n0028;
wire n0029;
wire [2:0] n0030;
wire [7:0] n0031;
wire [7:0] n0032;
wire n0033;
wire [2:0] n0034;
wire [7:0] n0035;
wire [7:0] n0036;
wire n0037;
wire [2:0] n0038;
wire [7:0] n0039;
wire [7:0] n0040;
wire n0041;
wire [0:0] n0042;
wire [0:0] n0043;
wire n0044;
wire [4:0] n0045;
wire [7:0] n0046;
wire [7:0] n0047;
wire [7:0] n0048;
wire [7:0] n0049;
wire [7:0] n0050;
wire [7:0] n0051;
wire n0052;
wire [7:0] n0053;
wire n0054;
wire [7:0] n0055;
wire n0056;
wire [7:0] n0057;
wire n0058;
wire [7:0] n0059;
wire n0060;
wire [7:0] n0061;
wire n0062;
wire [7:0] n0063;
wire n0064;
wire [7:0] n0065;
wire n0066;
wire [7:0] n0067;
wire n0068;
wire [7:0] n0069;
wire n0070;
wire [7:0] n0071;
wire n0072;
wire n0073;
wire [7:0] n0074;
wire n0075;
wire [7:0] n0076;
wire n0077;
wire [7:0] n0078;
wire n0079;
wire [7:0] n0080;
wire n0081;
wire [7:0] n0082;
wire n0083;
wire [7:0] n0084;
wire n0085;
wire [7:0] n0086;
wire n0087;
wire [7:0] n0088;
wire n0089;
wire [7:0] n0090;
wire n0091;
wire [7:0] n0092;
wire n0093;
wire [7:0] n0094;
wire n0095;
wire [7:0] n0096;
wire n0097;
wire [7:0] n0098;
wire n0099;
wire [7:0] n0100;
wire n0101;
wire [7:0] n0102;
wire n0103;
wire [7:0] n0104;
wire n0105;
wire [7:0] n0106;
wire n0107;
wire [7:0] n0108;
wire n0109;
wire [7:0] n0110;
wire n0111;
wire [7:0] n0112;
wire n0113;
wire [7:0] n0114;
wire n0115;
wire [7:0] n0116;
wire n0117;
wire [7:0] n0118;
wire n0119;
wire [7:0] n0120;
wire n0121;
wire [7:0] n0122;
wire n0123;
wire [7:0] n0124;
wire n0125;
wire [7:0] n0126;
wire n0127;
wire [7:0] n0128;
wire n0129;
wire [7:0] n0130;
wire n0131;
wire [7:0] n0132;
wire n0133;
wire [7:0] n0134;
wire n0135;
wire [7:0] n0136;
wire n0137;
wire [7:0] n0138;
wire n0139;
wire [7:0] n0140;
wire n0141;
wire [7:0] n0142;
wire n0143;
wire [7:0] n0144;
wire n0145;
wire [7:0] n0146;
wire n0147;
wire [7:0] n0148;
wire n0149;
wire [7:0] n0150;
wire n0151;
wire [7:0] n0152;
wire n0153;
wire [7:0] n0154;
wire n0155;
wire [7:0] n0156;
wire n0157;
wire [7:0] n0158;
wire n0159;
wire [7:0] n0160;
wire n0161;
wire [7:0] n0162;
wire n0163;
wire [7:0] n0164;
wire n0165;
wire [7:0] n0166;
wire n0167;
wire [7:0] n0168;
wire n0169;
wire [7:0] n0170;
wire n0171;
wire [7:0] n0172;
wire n0173;
wire [7:0] n0174;
wire n0175;
wire [7:0] n0176;
wire n0177;
wire [7:0] n0178;
wire n0179;
wire [7:0] n0180;
wire n0181;
wire [7:0] n0182;
wire n0183;
wire [7:0] n0184;
wire n0185;
wire [7:0] n0186;
wire n0187;
wire [7:0] n0188;
wire n0189;
wire [7:0] n0190;
wire n0191;
wire [7:0] n0192;
wire n0193;
wire [7:0] n0194;
wire n0195;
wire [7:0] n0196;
wire n0197;
wire [7:0] n0198;
wire n0199;
wire [7:0] n0200;
wire n0201;
wire [7:0] n0202;
wire n0203;
wire [7:0] n0204;
wire n0205;
wire [7:0] n0206;
wire n0207;
wire [7:0] n0208;
wire n0209;
wire [7:0] n0210;
wire n0211;
wire [7:0] n0212;
wire n0213;
wire [7:0] n0214;
wire n0215;
wire [7:0] n0216;
wire n0217;
wire [7:0] n0218;
wire n0219;
wire [7:0] n0220;
wire n0221;
wire [7:0] n0222;
wire n0223;
wire [7:0] n0224;
wire n0225;
wire [7:0] n0226;
wire n0227;
wire [7:0] n0228;
wire n0229;
wire [7:0] n0230;
wire n0231;
wire [7:0] n0232;
wire n0233;
wire [7:0] n0234;
wire n0235;
wire [7:0] n0236;
wire n0237;
wire [7:0] n0238;
wire n0239;
wire [7:0] n0240;
wire n0241;
wire [7:0] n0242;
wire n0243;
wire [7:0] n0244;
wire n0245;
wire [7:0] n0246;
wire n0247;
wire [7:0] n0248;
wire n0249;
wire [7:0] n0250;
wire n0251;
wire [7:0] n0252;
wire n0253;
wire [7:0] n0254;
wire n0255;
wire [7:0] n0256;
wire n0257;
wire [7:0] n0258;
wire n0259;
wire [7:0] n0260;
wire n0261;
wire [7:0] n0262;
wire n0263;
wire [7:0] n0264;
wire n0265;
wire [7:0] n0266;
wire n0267;
wire [7:0] n0268;
wire n0269;
wire [7:0] n0270;
wire n0271;
wire [7:0] n0272;
wire n0273;
wire [7:0] n0274;
wire n0275;
wire [7:0] n0276;
wire n0277;
wire [7:0] n0278;
wire n0279;
wire [7:0] n0280;
wire n0281;
wire [7:0] n0282;
wire n0283;
wire [7:0] n0284;
wire n0285;
wire [7:0] n0286;
wire n0287;
wire [7:0] n0288;
wire n0289;
wire [7:0] n0290;
wire n0291;
wire [7:0] n0292;
wire n0293;
wire [7:0] n0294;
wire n0295;
wire [7:0] n0296;
wire n0297;
wire [7:0] n0298;
wire n0299;
wire [7:0] n0300;
wire n0301;
wire [7:0] n0302;
wire n0303;
wire [7:0] n0304;
wire n0305;
wire [7:0] n0306;
wire n0307;
wire [7:0] n0308;
wire n0309;
wire [7:0] n0310;
wire n0311;
wire [7:0] n0312;
wire n0313;
wire [7:0] n0314;
wire n0315;
wire [7:0] n0316;
wire n0317;
wire [7:0] n0318;
wire n0319;
wire [7:0] n0320;
wire n0321;
wire [7:0] n0322;
wire n0323;
wire [7:0] n0324;
wire n0325;
wire [7:0] n0326;
wire n0327;
wire [7:0] n0328;
wire n0329;
wire [7:0] n0330;
wire n0331;
wire [7:0] n0332;
wire n0333;
wire [7:0] n0334;
wire n0335;
wire [7:0] n0336;
wire n0337;
wire [7:0] n0338;
wire n0339;
wire [7:0] n0340;
wire n0341;
wire [7:0] n0342;
wire n0343;
wire [7:0] n0344;
wire n0345;
wire [7:0] n0346;
wire n0347;
wire [7:0] n0348;
wire n0349;
wire [7:0] n0350;
wire n0351;
wire [7:0] n0352;
wire n0353;
wire [7:0] n0354;
wire n0355;
wire [7:0] n0356;
wire n0357;
wire [7:0] n0358;
wire n0359;
wire [7:0] n0360;
wire n0361;
wire [7:0] n0362;
wire n0363;
wire [7:0] n0364;
wire n0365;
wire [7:0] n0366;
wire n0367;
wire [7:0] n0368;
wire n0369;
wire [7:0] n0370;
wire n0371;
wire [7:0] n0372;
wire n0373;
wire [7:0] n0374;
wire n0375;
wire [7:0] n0376;
wire n0377;
wire [7:0] n0378;
wire n0379;
wire [7:0] n0380;
wire n0381;
wire [7:0] n0382;
wire n0383;
wire [7:0] n0384;
wire n0385;
wire [7:0] n0386;
wire n0387;
wire [7:0] n0388;
wire n0389;
wire [7:0] n0390;
wire [7:0] n0391;
wire [7:0] n0392;
wire [7:0] n0393;
wire [7:0] n0394;
wire [7:0] n0395;
wire [7:0] n0396;
wire [7:0] n0397;
wire [7:0] n0398;
wire [7:0] n0399;
wire [7:0] n0400;
wire [7:0] n0401;
wire [7:0] n0402;
wire [7:0] n0403;
wire [7:0] n0404;
wire [7:0] n0405;
wire [7:0] n0406;
wire [7:0] n0407;
wire [7:0] n0408;
wire [7:0] n0409;
wire [7:0] n0410;
wire [7:0] n0411;
wire [7:0] n0412;
wire [7:0] n0413;
wire [7:0] n0414;
wire [7:0] n0415;
wire [7:0] n0416;
wire [7:0] n0417;
wire [7:0] n0418;
wire [7:0] n0419;
wire [7:0] n0420;
wire [7:0] n0421;
wire [7:0] n0422;
wire [7:0] n0423;
wire [7:0] n0424;
wire [7:0] n0425;
wire [7:0] n0426;
wire [7:0] n0427;
wire [7:0] n0428;
wire [7:0] n0429;
wire [7:0] n0430;
wire [7:0] n0431;
wire [7:0] n0432;
wire [7:0] n0433;
wire [7:0] n0434;
wire [7:0] n0435;
wire [7:0] n0436;
wire [7:0] n0437;
wire [7:0] n0438;
wire [7:0] n0439;
wire [7:0] n0440;
wire [7:0] n0441;
wire [7:0] n0442;
wire [7:0] n0443;
wire [7:0] n0444;
wire [7:0] n0445;
wire [7:0] n0446;
wire [7:0] n0447;
wire [7:0] n0448;
wire [7:0] n0449;
wire [7:0] n0450;
wire [7:0] n0451;
wire [7:0] n0452;
wire [7:0] n0453;
wire [7:0] n0454;
wire [7:0] n0455;
wire [7:0] n0456;
wire [7:0] n0457;
wire [7:0] n0458;
wire [7:0] n0459;
wire [7:0] n0460;
wire [7:0] n0461;
wire [7:0] n0462;
wire [7:0] n0463;
wire [7:0] n0464;
wire [7:0] n0465;
wire [7:0] n0466;
wire [7:0] n0467;
wire [7:0] n0468;
wire [7:0] n0469;
wire [7:0] n0470;
wire [7:0] n0471;
wire [7:0] n0472;
wire [7:0] n0473;
wire [7:0] n0474;
wire [7:0] n0475;
wire [7:0] n0476;
wire [7:0] n0477;
wire [7:0] n0478;
wire [7:0] n0479;
wire [7:0] n0480;
wire [7:0] n0481;
wire [7:0] n0482;
wire [7:0] n0483;
wire [7:0] n0484;
wire [7:0] n0485;
wire [7:0] n0486;
wire [7:0] n0487;
wire [7:0] n0488;
wire [7:0] n0489;
wire [7:0] n0490;
wire [7:0] n0491;
wire [7:0] n0492;
wire [7:0] n0493;
wire [7:0] n0494;
wire [7:0] n0495;
wire [7:0] n0496;
wire [7:0] n0497;
wire [7:0] n0498;
wire [7:0] n0499;
wire [7:0] n0500;
wire [7:0] n0501;
wire [7:0] n0502;
wire [7:0] n0503;
wire [7:0] n0504;
wire [7:0] n0505;
wire [7:0] n0506;
wire [7:0] n0507;
wire [7:0] n0508;
wire [7:0] n0509;
wire [7:0] n0510;
wire [7:0] n0511;
wire [7:0] n0512;
wire [7:0] n0513;
wire [7:0] n0514;
wire [7:0] n0515;
wire [7:0] n0516;
wire [7:0] n0517;
wire [7:0] n0518;
wire [7:0] n0519;
wire [7:0] n0520;
wire [7:0] n0521;
wire [7:0] n0522;
wire [7:0] n0523;
wire [7:0] n0524;
wire [7:0] n0525;
wire [7:0] n0526;
wire [7:0] n0527;
wire [7:0] n0528;
wire [7:0] n0529;
wire [7:0] n0530;
wire [7:0] n0531;
wire [7:0] n0532;
wire [7:0] n0533;
wire [7:0] n0534;
wire [7:0] n0535;
wire [7:0] n0536;
wire [7:0] n0537;
wire [7:0] n0538;
wire [7:0] n0539;
wire [7:0] n0540;
wire [7:0] n0541;
wire [7:0] n0542;
wire [7:0] n0543;
wire [7:0] n0544;
wire [7:0] n0545;
wire [7:0] n0546;
wire [7:0] n0547;
wire [7:0] n0548;
wire [7:0] n0549;
wire [7:0] n0550;
wire [7:0] n0551;
wire [7:0] n0552;
wire [7:0] n0553;
wire [7:0] n0554;
wire [7:0] n0555;
wire [7:0] n0556;
wire [7:0] n0557;
wire [7:0] n0558;
wire [7:0] n0559;
wire [7:0] n0560;
wire [7:0] n0561;
wire [7:0] n0562;
wire [7:0] n0563;
wire [7:0] n0564;
wire [7:0] n0565;
wire [7:0] n0566;
wire [7:0] n0567;
wire [7:0] n0568;
wire [7:0] n0569;
wire [7:0] n0570;
wire [7:0] n0571;
wire [3:0] n0572;
wire [7:0] n0573;
wire [7:0] n0574;
wire [7:0] n0575;
wire [7:0] n0576;
wire [7:0] n0577;
wire [7:0] n0578;
wire [7:0] n0579;
wire [7:0] n0580;
wire [7:0] n0581;
wire [7:0] n0582;
wire [7:0] n0583;
wire [7:0] n0584;
wire [7:0] n0585;
wire [7:0] n0586;
wire [7:0] n0587;
wire [7:0] n0588;
wire [7:0] n0589;
wire [7:0] n0590;
wire [7:0] n0591;
wire [7:0] n0592;
wire [7:0] n0593;
wire [7:0] n0594;
wire [7:0] n0595;
wire [7:0] n0596;
wire [7:0] n0597;
wire [7:0] n0598;
wire [7:0] n0599;
wire [7:0] n0600;
wire [7:0] n0601;
wire [7:0] n0602;
wire [7:0] n0603;
wire [7:0] n0604;
wire [3:0] n0605;
wire [7:0] n0606;
wire [15:0] n0607;
wire n0608;
wire [15:0] n0609;
wire [15:0] n0610;
wire n0611;
wire [15:0] n0612;
wire [15:0] n0613;
wire n0614;
wire [15:0] n0615;
wire n0616;
wire [15:0] n0617;
wire n0618;
wire [15:0] n0619;
wire n0620;
wire [15:0] n0621;
wire n0622;
wire [15:0] n0623;
wire n0624;
wire [15:0] n0625;
wire n0626;
wire [15:0] n0627;
wire n0628;
wire [15:0] n0629;
wire n0630;
wire [15:0] n0631;
wire n0632;
wire [15:0] n0633;
wire n0634;
wire [15:0] n0635;
wire n0636;
wire [15:0] n0637;
wire n0638;
wire [15:0] n0639;
wire n0640;
wire [15:0] n0641;
wire n0642;
wire [15:0] n0643;
wire n0644;
wire [15:0] n0645;
wire n0646;
wire [15:0] n0647;
wire n0648;
wire [15:0] n0649;
wire n0650;
wire [15:0] n0651;
wire n0652;
wire [15:0] n0653;
wire n0654;
wire [15:0] n0655;
wire n0656;
wire [15:0] n0657;
wire n0658;
wire [15:0] n0659;
wire n0660;
wire [15:0] n0661;
wire n0662;
wire [15:0] n0663;
wire n0664;
wire [15:0] n0665;
wire n0666;
wire [15:0] n0667;
wire n0668;
wire [15:0] n0669;
wire n0670;
wire [15:0] n0671;
wire n0672;
wire [15:0] n0673;
wire n0674;
wire [15:0] n0675;
wire n0676;
wire [15:0] n0677;
wire n0678;
wire [15:0] n0679;
wire n0680;
wire [15:0] n0681;
wire n0682;
wire [15:0] n0683;
wire n0684;
wire [15:0] n0685;
wire n0686;
wire [15:0] n0687;
wire n0688;
wire [15:0] n0689;
wire n0690;
wire [15:0] n0691;
wire n0692;
wire [15:0] n0693;
wire n0694;
wire [15:0] n0695;
wire n0696;
wire [15:0] n0697;
wire n0698;
wire [15:0] n0699;
wire n0700;
wire [15:0] n0701;
wire n0702;
wire [15:0] n0703;
wire n0704;
wire [15:0] n0705;
wire n0706;
wire [15:0] n0707;
wire n0708;
wire [15:0] n0709;
wire n0710;
wire [15:0] n0711;
wire n0712;
wire [15:0] n0713;
wire [15:0] n0714;
wire [15:0] n0715;
wire n0716;
wire [15:0] n0717;
wire n0718;
wire [15:0] n0719;
wire n0720;
wire [15:0] n0721;
wire n0722;
wire [15:0] n0723;
wire n0724;
wire [15:0] n0725;
wire n0726;
wire [15:0] n0727;
wire n0728;
wire [15:0] n0729;
wire n0730;
wire [15:0] n0731;
wire n0732;
wire [15:0] n0733;
wire n0734;
wire [15:0] n0735;
wire n0736;
wire [15:0] n0737;
wire n0738;
wire [15:0] n0739;
wire n0740;
wire [15:0] n0741;
wire n0742;
wire [15:0] n0743;
wire n0744;
wire [15:0] n0745;
wire [15:0] n0746;
wire [15:0] n0747;
wire n0748;
wire [15:0] n0749;
wire n0750;
wire [15:0] n0751;
wire n0752;
wire [15:0] n0753;
wire n0754;
wire [15:0] n0755;
wire n0756;
wire [15:0] n0757;
wire n0758;
wire [15:0] n0759;
wire n0760;
wire [15:0] n0761;
wire n0762;
wire [15:0] n0763;
wire n0764;
wire [15:0] n0765;
wire n0766;
wire [15:0] n0767;
wire n0768;
wire [15:0] n0769;
wire n0770;
wire [15:0] n0771;
wire n0772;
wire [15:0] n0773;
wire n0774;
wire [15:0] n0775;
wire n0776;
wire [15:0] n0777;
wire n0778;
wire [15:0] n0779;
wire n0780;
wire [15:0] n0781;
wire n0782;
wire [15:0] n0783;
wire n0784;
wire [15:0] n0785;
wire n0786;
wire [15:0] n0787;
wire n0788;
wire [15:0] n0789;
wire n0790;
wire [15:0] n0791;
wire n0792;
wire [15:0] n0793;
wire n0794;
wire [15:0] n0795;
wire n0796;
wire [15:0] n0797;
wire n0798;
wire [15:0] n0799;
wire n0800;
wire [15:0] n0801;
wire n0802;
wire [15:0] n0803;
wire n0804;
wire [15:0] n0805;
wire n0806;
wire [15:0] n0807;
wire n0808;
wire [15:0] n0809;
wire n0810;
wire [15:0] n0811;
wire n0812;
wire [15:0] n0813;
wire n0814;
wire [15:0] n0815;
wire n0816;
wire [15:0] n0817;
wire n0818;
wire [15:0] n0819;
wire n0820;
wire [15:0] n0821;
wire n0822;
wire [15:0] n0823;
wire n0824;
wire [15:0] n0825;
wire n0826;
wire [15:0] n0827;
wire n0828;
wire [15:0] n0829;
wire n0830;
wire [15:0] n0831;
wire n0832;
wire [15:0] n0833;
wire n0834;
wire [15:0] n0835;
wire n0836;
wire [15:0] n0837;
wire n0838;
wire [15:0] n0839;
wire n0840;
wire [15:0] n0841;
wire n0842;
wire [15:0] n0843;
wire n0844;
wire [15:0] n0845;
wire [15:0] n0846;
wire [15:0] n0847;
wire [15:0] n0848;
wire [15:0] n0849;
wire [15:0] n0850;
wire [15:0] n0851;
wire [15:0] n0852;
wire [15:0] n0853;
wire [15:0] n0854;
wire [15:0] n0855;
wire [15:0] n0856;
wire [15:0] n0857;
wire [15:0] n0858;
wire [15:0] n0859;
wire [15:0] n0860;
wire [15:0] n0861;
wire [15:0] n0862;
wire [15:0] n0863;
wire [15:0] n0864;
wire [15:0] n0865;
wire [15:0] n0866;
wire [15:0] n0867;
wire [15:0] n0868;
wire [15:0] n0869;
wire [15:0] n0870;
wire [15:0] n0871;
wire [15:0] n0872;
wire [15:0] n0873;
wire [15:0] n0874;
wire [15:0] n0875;
wire [15:0] n0876;
wire [15:0] n0877;
wire [15:0] n0878;
wire [15:0] n0879;
wire [15:0] n0880;
wire [15:0] n0881;
wire [15:0] n0882;
wire [15:0] n0883;
wire [15:0] n0884;
wire [15:0] n0885;
wire [15:0] n0886;
wire [15:0] n0887;
wire [15:0] n0888;
wire [15:0] n0889;
wire [15:0] n0890;
wire [15:0] n0891;
wire [15:0] n0892;
wire [15:0] n0893;
wire [15:0] n0894;
wire [15:0] n0895;
wire [15:0] n0896;
wire [15:0] n0897;
wire [15:0] n0898;
wire [15:0] n0899;
wire [15:0] n0900;
wire [15:0] n0901;
wire [15:0] n0902;
wire [15:0] n0903;
wire [15:0] n0904;
wire [15:0] n0905;
wire [15:0] n0906;
wire [15:0] n0907;
wire [15:0] n0908;
wire [15:0] n0909;
wire [15:0] n0910;
wire [15:0] n0911;
wire [15:0] n0912;
wire [15:0] n0913;
wire [15:0] n0914;
wire [15:0] n0915;
wire [15:0] n0916;
wire [15:0] n0917;
wire [15:0] n0918;
wire [15:0] n0919;
wire [15:0] n0920;
wire [15:0] n0921;
wire [15:0] n0922;
wire [15:0] n0923;
wire [15:0] n0924;
wire [15:0] n0925;
wire [15:0] n0926;
wire [15:0] n0927;
wire [15:0] n0928;
wire [15:0] n0929;
wire [15:0] n0930;
wire [15:0] n0931;
wire [15:0] n0932;
wire [15:0] n0933;
wire [15:0] n0934;
wire [15:0] n0935;
wire [15:0] n0936;
wire [15:0] n0937;
wire [15:0] n0938;
wire [15:0] n0939;
wire [15:0] n0940;
wire [15:0] n0941;
wire [15:0] n0942;
wire [15:0] n0943;
wire [15:0] n0944;
wire [15:0] n0945;
wire [15:0] n0946;
wire [15:0] n0947;
wire [15:0] n0948;
wire [15:0] n0949;
wire [15:0] n0950;
wire [15:0] n0951;
wire [15:0] n0952;
wire [15:0] n0953;
wire [15:0] n0954;
wire [15:0] n0955;
wire [15:0] n0956;
wire [15:0] n0957;
wire [15:0] n0958;
wire [15:0] n0959;
wire [15:0] n0960;
wire [15:0] n0961;
wire [15:0] n0962;
wire [15:0] n0963;
wire [15:0] n0964;
wire [15:0] n0965;
wire [15:0] n0966;
wire [15:0] n0967;
wire [15:0] n0968;
wire [15:0] n0969;
wire [15:0] n0970;
wire [15:0] n0971;
wire [15:0] n0972;
wire [15:0] n0973;
wire [15:0] n0974;
wire [15:0] n0975;
wire [15:0] n0976;
wire [15:0] n0977;
wire [15:0] n0978;
wire [15:0] n0979;
wire [15:0] n0980;
wire [15:0] n0981;
wire [15:0] n0982;
wire [15:0] n0983;
wire [15:0] n0984;
wire [15:0] n0985;
wire [15:0] n0986;
wire [15:0] n0987;
wire [15:0] n0988;
wire [15:0] n0989;
wire [15:0] n0990;
wire [15:0] n0991;
wire [15:0] n0992;
wire [15:0] n0993;
wire [15:0] n0994;
wire [15:0] n0995;
wire [15:0] n0996;
wire [15:0] n0997;
wire [15:0] n0998;
wire [15:0] n0999;
wire [15:0] n1000;
wire [7:0] n1001;
wire [6:0] n1002;
wire [0:0] n1003;
wire [0:0] n1004;
wire [0:0] n1005;
wire [0:0] n1006;
wire [0:0] n1007;
wire [0:0] n1008;
wire [0:0] n1009;
wire [0:0] n1010;
wire [0:0] n1011;
wire [0:0] n1012;
wire [0:0] n1013;
wire [0:0] n1014;
wire [0:0] n1015;
wire [0:0] n1016;
wire [0:0] n1017;
wire [7:0] n1018;
wire [4:0] n1019;
wire [23:0] n1020;
wire [2:0] n1021;
wire [7:0] n1022;
wire [15:0] n1023;
wire [15:0] n1024;
wire [7:0] n1025;
wire [0:0] n1026;
wire [0:0] n1027;
wire [0:0] n1028;
wire [0:0] n1029;
wire [0:0] n1030;
wire [0:0] n1031;
wire [0:0] n1032;
wire [0:0] n1033;
wire [0:0] n1034;
wire [0:0] n1035;
wire [0:0] n1036;
wire [0:0] n1037;
wire [0:0] n1038;
wire [0:0] n1039;
wire [0:0] n1040;
wire [7:0] n1041;
wire [7:0] n1042;
wire [0:0] n1043;
wire [0:0] n1044;
wire [0:0] n1045;
wire [0:0] n1046;
wire [0:0] n1047;
wire [0:0] n1048;
wire [0:0] n1049;
wire [0:0] n1050;
wire [0:0] n1051;
wire [0:0] n1052;
wire [0:0] n1053;
wire [0:0] n1054;
wire [0:0] n1055;
wire [0:0] n1056;
wire [0:0] n1057;
wire [7:0] n1058;
wire [7:0] n1059;
wire n1060;
wire [0:0] n1061;
wire n1062;
wire [7:0] n1063;
wire n1064;
wire [7:0] n1065;
wire n1066;
wire n1067;
wire [7:0] n1068;
wire n1069;
wire n1070;
wire n1071;
wire n1072;
wire n1073;
wire n1074;
wire n1075;
wire n1076;
wire [7:0] n1077;
wire n1078;
wire n1079;
wire n1080;
wire n1081;
wire n1082;
wire n1083;
wire n1084;
wire n1085;
wire [7:0] n1086;
wire n1087;
wire [7:0] n1088;
wire [7:0] n1089;
wire [7:0] n1090;
wire [7:0] n1091;
wire [7:0] n1092;
wire [7:0] n1093;
wire [7:0] n1094;
wire [7:0] n1095;
wire [7:0] n1096;
wire [7:0] n1097;
wire [7:0] n1098;
wire [7:0] n1099;
wire [7:0] n1100;
wire [7:0] n1101;
wire [7:0] n1102;
wire [7:0] n1103;
wire [7:0] n1104;
wire [7:0] n1105;
wire [7:0] n1106;
wire [7:0] n1107;
wire [7:0] n1108;
wire [7:0] n1109;
wire [7:0] n1110;
wire [7:0] n1111;
wire [7:0] n1112;
wire [7:0] n1113;
wire [7:0] n1114;
wire [7:0] n1115;
wire [7:0] n1116;
wire [7:0] n1117;
wire [7:0] n1118;
wire [3:0] n1119;
wire [7:0] n1120;
wire [7:0] n1121;
wire [6:0] n1122;
wire [0:0] n1123;
wire [0:0] n1124;
wire [0:0] n1125;
wire [0:0] n1126;
wire [0:0] n1127;
wire [0:0] n1128;
wire [0:0] n1129;
wire [0:0] n1130;
wire [0:0] n1131;
wire [0:0] n1132;
wire [0:0] n1133;
wire [0:0] n1134;
wire [0:0] n1135;
wire [0:0] n1136;
wire [0:0] n1137;
wire [7:0] n1138;
wire [3:0] n1139;
wire [7:0] n1140;
wire [3:0] n1141;
wire [7:0] n1142;
wire [3:0] n1143;
wire [3:0] n1144;
wire [3:0] n1145;
wire [3:0] n1146;
wire [3:0] n1147;
wire [3:0] n1148;
wire [3:0] n1149;
wire n1150;
wire [2:0] n1151;
wire [7:0] n1152;
wire [7:0] n1153;
wire [7:0] n1154;
wire [0:0] n1155;
wire n1156;
wire n1157;
wire n1158;
wire n1159;
wire n1160;
wire n1161;
wire n1162;
wire n1163;
wire n1164;
wire n1165;
wire n1166;
wire [7:0] n1167;
wire [7:0] n1168;
wire [7:0] n1169;
wire [7:0] n1170;
wire [7:0] n1171;
wire [7:0] n1172;
wire [7:0] n1173;
wire [7:0] n1174;
wire [7:0] n1175;
wire [7:0] n1176;
wire [7:0] n1177;
wire [7:0] n1178;
wire [7:0] n1179;
wire [7:0] n1180;
wire [7:0] n1181;
wire [7:0] n1182;
wire [7:0] n1183;
wire [7:0] n1184;
wire [7:0] n1185;
wire [7:0] n1186;
wire [7:0] n1187;
wire [7:0] n1188;
wire [7:0] n1189;
wire [7:0] n1190;
wire [7:0] n1191;
wire [7:0] n1192;
wire [7:0] n1193;
wire [7:0] n1194;
wire [0:0] n1195;
wire n1196;
wire [15:0] n1197;
wire [15:0] n1198;
wire [15:0] n1199;
wire [15:0] n1200;
wire [15:0] n1201;
wire [7:0] n1202;
wire [7:0] n1203;
wire [7:0] n1204;
wire [7:0] n1205;
wire [3:0] n1206;
wire [7:0] n1207;
wire [6:0] n1208;
wire [0:0] n1209;
wire [0:0] n1210;
wire [0:0] n1211;
wire [0:0] n1212;
wire [0:0] n1213;
wire [0:0] n1214;
wire [0:0] n1215;
wire [0:0] n1216;
wire [0:0] n1217;
wire [0:0] n1218;
wire [0:0] n1219;
wire [0:0] n1220;
wire [0:0] n1221;
wire [0:0] n1222;
wire [0:0] n1223;
wire [7:0] n1224;
wire [2:0] n1225;
wire [15:0] n1226;
wire [7:0] n1227;
wire [3:0] n1228;
wire [7:0] n1229;
wire [7:0] n1230;
wire [3:0] n1231;
wire [7:0] n1232;
wire [7:0] n1233;
wire [7:0] n1234;
wire [7:0] n1235;
wire [7:0] n1236;
wire [0:0] n1237;
wire [8:0] n1238;
wire [8:0] n1239;
wire [7:0] n1240;
wire [0:0] n1241;
wire [2:0] n1242;
wire [0:0] n1243;
wire [1:0] n1244;
wire [7:0] n1245;
wire [6:0] n1246;
wire [0:0] n1247;
wire [0:0] n1248;
wire [0:0] n1249;
wire [0:0] n1250;
wire [0:0] n1251;
wire [0:0] n1252;
wire [0:0] n1253;
wire [0:0] n1254;
wire [0:0] n1255;
wire [0:0] n1256;
wire [0:0] n1257;
wire [0:0] n1258;
wire [0:0] n1259;
wire [0:0] n1260;
wire [0:0] n1261;
wire [7:0] n1262;
wire [7:0] n1263;
wire [0:0] n1264;
wire [0:0] n1265;
wire [0:0] n1266;
wire [0:0] n1267;
wire [0:0] n1268;
wire [0:0] n1269;
wire [0:0] n1270;
wire [0:0] n1271;
wire [0:0] n1272;
wire [0:0] n1273;
wire [0:0] n1274;
wire [0:0] n1275;
wire [0:0] n1276;
wire [0:0] n1277;
wire [0:0] n1278;
wire [7:0] n1279;
wire [7:0] n1280;
wire [7:0] n1281;
wire [7:0] n1282;
wire [7:0] n1283;
wire [7:0] n1284;
wire [7:0] n1285;
wire [7:0] n1286;
wire [7:0] n1287;
wire [7:0] n1288;
wire [7:0] n1289;
wire [7:0] n1290;
wire [6:0] n1291;
wire [0:0] n1292;
wire [0:0] n1293;
wire [0:0] n1294;
wire [0:0] n1295;
wire [0:0] n1296;
wire [0:0] n1297;
wire [0:0] n1298;
wire [0:0] n1299;
wire [0:0] n1300;
wire [0:0] n1301;
wire [0:0] n1302;
wire [0:0] n1303;
wire [0:0] n1304;
wire [0:0] n1305;
wire [0:0] n1306;
wire [7:0] n1307;
wire [7:0] n1308;
wire [7:0] n1309;
wire [15:0] n1310;
wire [7:0] n1311;
wire [7:0] n1312;
wire [0:0] n1313;
wire [0:0] n1314;
wire [0:0] n1315;
wire [0:0] n1316;
wire [0:0] n1317;
wire [0:0] n1318;
wire [0:0] n1319;
wire [0:0] n1320;
wire [0:0] n1321;
wire [0:0] n1322;
wire [0:0] n1323;
wire [0:0] n1324;
wire [0:0] n1325;
wire [0:0] n1326;
wire [0:0] n1327;
wire [7:0] n1328;
wire [7:0] n1329;
wire [8:0] n1330;
wire [8:0] n1331;
wire [8:0] n1332;
wire [8:0] n1333;
wire [8:0] n1334;
wire [0:0] n1335;
wire [3:0] n1336;
wire [4:0] n1337;
wire [4:0] n1338;
wire [4:0] n1339;
wire [4:0] n1340;
wire [4:0] n1341;
wire [0:0] n1342;
wire [8:0] n1343;
wire [8:0] n1344;
wire [8:0] n1345;
wire [8:0] n1346;
wire [0:0] n1347;
wire [0:0] n1348;
wire n1349;
wire n1350;
wire [0:0] n1351;
wire [7:0] n1352;
wire [6:0] n1353;
wire [0:0] n1354;
wire [0:0] n1355;
wire [0:0] n1356;
wire [0:0] n1357;
wire [0:0] n1358;
wire [0:0] n1359;
wire [0:0] n1360;
wire [0:0] n1361;
wire [0:0] n1362;
wire [0:0] n1363;
wire [0:0] n1364;
wire [0:0] n1365;
wire [0:0] n1366;
wire [0:0] n1367;
wire [0:0] n1368;
wire [7:0] n1369;
wire [7:0] n1370;
wire [7:0] n1371;
wire [7:0] n1372;
wire [7:0] n1373;
wire [7:0] n1374;
wire [7:0] n1375;
wire [7:0] n1376;
wire [7:0] n1377;
wire [7:0] n1378;
wire [7:0] n1379;
wire [7:0] n1380;
wire [7:0] n1381;
wire [7:0] n1382;
wire [7:0] n1383;
wire [7:0] n1384;
wire [7:0] n1385;
wire [7:0] n1386;
wire [7:0] n1387;
wire [7:0] n1388;
wire [8:0] n1389;
wire [8:0] n1390;
wire [8:0] n1391;
wire [8:0] n1392;
wire [0:0] n1393;
wire [3:0] n1394;
wire [4:0] n1395;
wire [4:0] n1396;
wire [4:0] n1397;
wire [4:0] n1398;
wire [0:0] n1399;
wire [8:0] n1400;
wire [8:0] n1401;
wire [8:0] n1402;
wire [0:0] n1403;
wire [0:0] n1404;
wire n1405;
wire n1406;
wire [0:0] n1407;
wire [7:0] n1408;
wire [6:0] n1409;
wire [0:0] n1410;
wire [0:0] n1411;
wire [0:0] n1412;
wire [0:0] n1413;
wire [0:0] n1414;
wire [0:0] n1415;
wire [0:0] n1416;
wire [0:0] n1417;
wire [0:0] n1418;
wire [0:0] n1419;
wire [0:0] n1420;
wire [0:0] n1421;
wire [0:0] n1422;
wire [0:0] n1423;
wire [0:0] n1424;
wire [7:0] n1425;
wire [7:0] n1426;
wire [8:0] n1427;
wire [8:0] n1428;
wire [8:0] n1429;
wire [0:0] n1430;
wire [3:0] n1431;
wire [4:0] n1432;
wire [4:0] n1433;
wire [4:0] n1434;
wire [0:0] n1435;
wire [8:0] n1436;
wire [8:0] n1437;
wire [8:0] n1438;
wire [0:0] n1439;
wire [0:0] n1440;
wire n1441;
wire n1442;
wire [0:0] n1443;
wire [7:0] n1444;
wire [6:0] n1445;
wire [0:0] n1446;
wire [0:0] n1447;
wire [0:0] n1448;
wire [0:0] n1449;
wire [0:0] n1450;
wire [0:0] n1451;
wire [0:0] n1452;
wire [0:0] n1453;
wire [0:0] n1454;
wire [0:0] n1455;
wire [0:0] n1456;
wire [0:0] n1457;
wire [0:0] n1458;
wire [0:0] n1459;
wire [0:0] n1460;
wire [7:0] n1461;
wire [8:0] n1462;
wire [8:0] n1463;
wire [0:0] n1464;
wire [8:0] n1465;
wire [8:0] n1466;
wire [0:0] n1467;
wire [0:0] n1468;
wire n1469;
wire n1470;
wire [0:0] n1471;
wire [7:0] n1472;
wire [6:0] n1473;
wire [7:0] n1474;
wire [7:0] n1475;
wire [8:0] n1476;
wire [8:0] n1477;
wire [8:0] n1478;
wire [0:0] n1479;
wire [4:0] n1480;
wire [4:0] n1481;
wire [4:0] n1482;
wire [0:0] n1483;
wire [8:0] n1484;
wire [8:0] n1485;
wire [8:0] n1486;
wire [0:0] n1487;
wire [0:0] n1488;
wire n1489;
wire n1490;
wire [0:0] n1491;
wire [7:0] n1492;
wire [6:0] n1493;
wire [0:0] n1494;
wire [0:0] n1495;
wire [0:0] n1496;
wire [0:0] n1497;
wire [0:0] n1498;
wire [0:0] n1499;
wire [0:0] n1500;
wire [0:0] n1501;
wire [0:0] n1502;
wire [0:0] n1503;
wire [0:0] n1504;
wire [0:0] n1505;
wire [0:0] n1506;
wire [0:0] n1507;
wire [0:0] n1508;
wire [7:0] n1509;
wire [4:0] n1510;
wire [4:0] n1511;
wire [0:0] n1512;
wire [7:0] n1513;
wire [6:0] n1514;
wire [7:0] n1515;
wire [8:0] n1516;
wire [8:0] n1517;
wire [0:0] n1518;
wire [8:0] n1519;
wire [8:0] n1520;
wire [0:0] n1521;
wire [0:0] n1522;
wire n1523;
wire n1524;
wire [0:0] n1525;
wire [7:0] n1526;
wire [6:0] n1527;
wire [7:0] n1528;
wire n1529;
wire [15:0] n1530;
wire [8:0] n1531;
wire [8:0] n1532;
wire [7:0] n1533;
wire [7:0] n1534;
wire [6:0] n1535;
wire [0:0] n1536;
wire [0:0] n1537;
wire [0:0] n1538;
wire [0:0] n1539;
wire [0:0] n1540;
wire [0:0] n1541;
wire [0:0] n1542;
wire [0:0] n1543;
wire [0:0] n1544;
wire [0:0] n1545;
wire [0:0] n1546;
wire [0:0] n1547;
wire [0:0] n1548;
wire [0:0] n1549;
wire [0:0] n1550;
wire [7:0] n1551;
wire [7:0] n1552;
wire [7:0] n1553;
wire [7:0] n1554;
wire [8:0] n1555;
wire [8:0] n1556;
wire [8:0] n1557;
wire [0:0] n1558;
wire [4:0] n1559;
wire [4:0] n1560;
wire [4:0] n1561;
wire [0:0] n1562;
wire [8:0] n1563;
wire [8:0] n1564;
wire [0:0] n1565;
wire [0:0] n1566;
wire n1567;
wire n1568;
wire [0:0] n1569;
wire [7:0] n1570;
wire [6:0] n1571;
wire [0:0] n1572;
wire [0:0] n1573;
wire [0:0] n1574;
wire [0:0] n1575;
wire [0:0] n1576;
wire [0:0] n1577;
wire [0:0] n1578;
wire [0:0] n1579;
wire [0:0] n1580;
wire [0:0] n1581;
wire [0:0] n1582;
wire [0:0] n1583;
wire [0:0] n1584;
wire [0:0] n1585;
wire [0:0] n1586;
wire [7:0] n1587;
wire [7:0] n1588;
wire [7:0] n1589;
wire [8:0] n1590;
wire [8:0] n1591;
wire [0:0] n1592;
wire [4:0] n1593;
wire [4:0] n1594;
wire [0:0] n1595;
wire [8:0] n1596;
wire [8:0] n1597;
wire [0:0] n1598;
wire [0:0] n1599;
wire n1600;
wire n1601;
wire [0:0] n1602;
wire [7:0] n1603;
wire [6:0] n1604;
wire [0:0] n1605;
wire [0:0] n1606;
wire [0:0] n1607;
wire [0:0] n1608;
wire [0:0] n1609;
wire [0:0] n1610;
wire [0:0] n1611;
wire [0:0] n1612;
wire [0:0] n1613;
wire [0:0] n1614;
wire [0:0] n1615;
wire [0:0] n1616;
wire [0:0] n1617;
wire [0:0] n1618;
wire [0:0] n1619;
wire [7:0] n1620;
wire [7:0] n1621;
wire [7:0] n1622;
wire [8:0] n1623;
wire [8:0] n1624;
wire [0:0] n1625;
wire [4:0] n1626;
wire [4:0] n1627;
wire [0:0] n1628;
wire [8:0] n1629;
wire [8:0] n1630;
wire [0:0] n1631;
wire [0:0] n1632;
wire n1633;
wire n1634;
wire [0:0] n1635;
wire [7:0] n1636;
wire [6:0] n1637;
wire [0:0] n1638;
wire [0:0] n1639;
wire [0:0] n1640;
wire [0:0] n1641;
wire [0:0] n1642;
wire [0:0] n1643;
wire [0:0] n1644;
wire [0:0] n1645;
wire [0:0] n1646;
wire [0:0] n1647;
wire [0:0] n1648;
wire [0:0] n1649;
wire [0:0] n1650;
wire [0:0] n1651;
wire [0:0] n1652;
wire [7:0] n1653;
wire [7:0] n1654;
wire [7:0] n1655;
wire [8:0] n1656;
wire [8:0] n1657;
wire [0:0] n1658;
wire [4:0] n1659;
wire [4:0] n1660;
wire [0:0] n1661;
wire [8:0] n1662;
wire [8:0] n1663;
wire [0:0] n1664;
wire [0:0] n1665;
wire n1666;
wire n1667;
wire [0:0] n1668;
wire [7:0] n1669;
wire [6:0] n1670;
wire [0:0] n1671;
wire [0:0] n1672;
wire [0:0] n1673;
wire [0:0] n1674;
wire [0:0] n1675;
wire [0:0] n1676;
wire [0:0] n1677;
wire [0:0] n1678;
wire [0:0] n1679;
wire [0:0] n1680;
wire [0:0] n1681;
wire [0:0] n1682;
wire [0:0] n1683;
wire [0:0] n1684;
wire [0:0] n1685;
wire [7:0] n1686;
wire n1687;
wire [15:0] n1688;
wire [15:0] n1689;
wire [15:0] n1690;
wire [7:0] n1691;
wire [7:0] n1692;
wire [7:0] n1693;
wire [7:0] n1694;
wire [7:0] n1695;
wire [7:0] n1696;
wire [7:0] n1697;
wire [7:0] n1698;
wire [7:0] n1699;
wire [7:0] n1700;
wire [6:0] n1701;
wire [7:0] n1702;
wire [7:0] n1703;
wire [7:0] n1704;
wire [7:0] n1705;
wire [7:0] n1706;
wire [7:0] n1707;
wire [7:0] n1708;
wire [7:0] n1709;
wire [7:0] n1710;
wire [7:0] n1711;
wire [7:0] n1712;
wire [7:0] n1713;
wire [6:0] n1714;
wire [0:0] n1715;
wire [0:0] n1716;
wire [0:0] n1717;
wire [0:0] n1718;
wire [0:0] n1719;
wire [0:0] n1720;
wire [0:0] n1721;
wire [0:0] n1722;
wire [0:0] n1723;
wire [0:0] n1724;
wire [0:0] n1725;
wire [0:0] n1726;
wire [0:0] n1727;
wire [0:0] n1728;
wire [0:0] n1729;
wire [7:0] n1730;
wire [7:0] n1731;
wire [0:0] n1732;
wire [0:0] n1733;
wire [0:0] n1734;
wire [0:0] n1735;
wire [0:0] n1736;
wire [0:0] n1737;
wire [0:0] n1738;
wire [0:0] n1739;
wire [0:0] n1740;
wire [0:0] n1741;
wire [0:0] n1742;
wire [0:0] n1743;
wire [0:0] n1744;
wire [0:0] n1745;
wire [0:0] n1746;
wire [7:0] n1747;
wire [7:0] n1748;
wire [0:0] n1749;
wire [0:0] n1750;
wire [0:0] n1751;
wire [0:0] n1752;
wire [0:0] n1753;
wire [0:0] n1754;
wire [0:0] n1755;
wire [0:0] n1756;
wire [0:0] n1757;
wire [0:0] n1758;
wire [0:0] n1759;
wire [0:0] n1760;
wire [0:0] n1761;
wire [0:0] n1762;
wire [0:0] n1763;
wire [7:0] n1764;
wire [7:0] n1765;
wire [0:0] n1766;
wire [0:0] n1767;
wire [0:0] n1768;
wire [0:0] n1769;
wire [0:0] n1770;
wire [0:0] n1771;
wire [0:0] n1772;
wire [0:0] n1773;
wire [0:0] n1774;
wire [0:0] n1775;
wire [0:0] n1776;
wire [0:0] n1777;
wire [0:0] n1778;
wire [0:0] n1779;
wire [0:0] n1780;
wire [7:0] n1781;
wire [7:0] n1782;
wire [0:0] n1783;
wire [0:0] n1784;
wire [0:0] n1785;
wire [0:0] n1786;
wire [0:0] n1787;
wire [0:0] n1788;
wire [0:0] n1789;
wire [0:0] n1790;
wire [0:0] n1791;
wire [0:0] n1792;
wire [0:0] n1793;
wire [0:0] n1794;
wire [0:0] n1795;
wire [0:0] n1796;
wire [0:0] n1797;
wire [7:0] n1798;
wire n1799;
wire [15:0] n1800;
wire [7:0] n1801;
wire [7:0] n1802;
wire [7:0] n1803;
wire [7:0] n1804;
wire [7:0] n1805;
wire [7:0] n1806;
wire [7:0] n1807;
wire [7:0] n1808;
wire [7:0] n1809;
wire [7:0] n1810;
wire [6:0] n1811;
wire [7:0] n1812;
wire [7:0] n1813;
wire [7:0] n1814;
wire [7:0] n1815;
wire [7:0] n1816;
wire [7:0] n1817;
wire [7:0] n1818;
wire [7:0] n1819;
wire [7:0] n1820;
wire [7:0] n1821;
wire [7:0] n1822;
wire [7:0] n1823;
wire [6:0] n1824;
wire [0:0] n1825;
wire [0:0] n1826;
wire [0:0] n1827;
wire [0:0] n1828;
wire [0:0] n1829;
wire [0:0] n1830;
wire [0:0] n1831;
wire [0:0] n1832;
wire [0:0] n1833;
wire [0:0] n1834;
wire [0:0] n1835;
wire [0:0] n1836;
wire [0:0] n1837;
wire [0:0] n1838;
wire [0:0] n1839;
wire [7:0] n1840;
wire [7:0] n1841;
wire [0:0] n1842;
wire [0:0] n1843;
wire [0:0] n1844;
wire [0:0] n1845;
wire [0:0] n1846;
wire [0:0] n1847;
wire [0:0] n1848;
wire [0:0] n1849;
wire [0:0] n1850;
wire [0:0] n1851;
wire [0:0] n1852;
wire [0:0] n1853;
wire [0:0] n1854;
wire [0:0] n1855;
wire [0:0] n1856;
wire [7:0] n1857;
wire [7:0] n1858;
wire [0:0] n1859;
wire [0:0] n1860;
wire [0:0] n1861;
wire [0:0] n1862;
wire [0:0] n1863;
wire [0:0] n1864;
wire [0:0] n1865;
wire [0:0] n1866;
wire [0:0] n1867;
wire [0:0] n1868;
wire [0:0] n1869;
wire [0:0] n1870;
wire [0:0] n1871;
wire [0:0] n1872;
wire [0:0] n1873;
wire [7:0] n1874;
wire [7:0] n1875;
wire [0:0] n1876;
wire [0:0] n1877;
wire [0:0] n1878;
wire [0:0] n1879;
wire [0:0] n1880;
wire [0:0] n1881;
wire [0:0] n1882;
wire [0:0] n1883;
wire [0:0] n1884;
wire [0:0] n1885;
wire [0:0] n1886;
wire [0:0] n1887;
wire [0:0] n1888;
wire [0:0] n1889;
wire [0:0] n1890;
wire [7:0] n1891;
wire [7:0] n1892;
wire [0:0] n1893;
wire [0:0] n1894;
wire [0:0] n1895;
wire [0:0] n1896;
wire [0:0] n1897;
wire [0:0] n1898;
wire [0:0] n1899;
wire [0:0] n1900;
wire [0:0] n1901;
wire [0:0] n1902;
wire [0:0] n1903;
wire [0:0] n1904;
wire [0:0] n1905;
wire [0:0] n1906;
wire [0:0] n1907;
wire [7:0] n1908;
wire n1909;
wire [15:0] n1910;
wire [7:0] n1911;
wire [7:0] n1912;
wire [7:0] n1913;
wire [7:0] n1914;
wire [7:0] n1915;
wire [7:0] n1916;
wire [7:0] n1917;
wire [7:0] n1918;
wire [7:0] n1919;
wire [7:0] n1920;
wire [7:0] n1921;
wire [7:0] n1922;
wire [6:0] n1923;
wire [0:0] n1924;
wire [0:0] n1925;
wire [0:0] n1926;
wire [0:0] n1927;
wire [0:0] n1928;
wire [0:0] n1929;
wire [0:0] n1930;
wire [0:0] n1931;
wire [0:0] n1932;
wire [0:0] n1933;
wire [0:0] n1934;
wire [0:0] n1935;
wire [0:0] n1936;
wire [0:0] n1937;
wire [0:0] n1938;
wire [7:0] n1939;
wire [7:0] n1940;
wire [7:0] n1941;
wire [7:0] n1942;
wire [7:0] n1943;
wire [7:0] n1944;
wire [7:0] n1945;
wire [7:0] n1946;
wire [7:0] n1947;
wire [7:0] n1948;
wire [7:0] n1949;
wire [7:0] n1950;
wire [6:0] n1951;
wire [0:0] n1952;
wire [0:0] n1953;
wire [0:0] n1954;
wire [0:0] n1955;
wire [0:0] n1956;
wire [0:0] n1957;
wire [0:0] n1958;
wire [0:0] n1959;
wire [0:0] n1960;
wire [0:0] n1961;
wire [0:0] n1962;
wire [0:0] n1963;
wire [0:0] n1964;
wire [0:0] n1965;
wire [0:0] n1966;
wire [7:0] n1967;
wire [7:0] n1968;
wire [0:0] n1969;
wire [0:0] n1970;
wire [0:0] n1971;
wire [0:0] n1972;
wire [0:0] n1973;
wire [0:0] n1974;
wire [0:0] n1975;
wire [0:0] n1976;
wire [0:0] n1977;
wire [0:0] n1978;
wire [0:0] n1979;
wire [0:0] n1980;
wire [0:0] n1981;
wire [0:0] n1982;
wire [0:0] n1983;
wire [7:0] n1984;
wire [7:0] n1985;
wire [0:0] n1986;
wire [0:0] n1987;
wire [0:0] n1988;
wire [0:0] n1989;
wire [0:0] n1990;
wire [0:0] n1991;
wire [0:0] n1992;
wire [0:0] n1993;
wire [0:0] n1994;
wire [0:0] n1995;
wire [0:0] n1996;
wire [0:0] n1997;
wire [0:0] n1998;
wire [0:0] n1999;
wire [0:0] n2000;
wire [7:0] n2001;
wire [7:0] n2002;
wire [0:0] n2003;
wire [0:0] n2004;
wire [0:0] n2005;
wire [0:0] n2006;
wire [0:0] n2007;
wire [0:0] n2008;
wire [0:0] n2009;
wire [0:0] n2010;
wire [0:0] n2011;
wire [0:0] n2012;
wire [0:0] n2013;
wire [0:0] n2014;
wire [0:0] n2015;
wire [0:0] n2016;
wire [0:0] n2017;
wire [7:0] n2018;
wire [7:0] n2019;
wire [0:0] n2020;
wire [0:0] n2021;
wire [0:0] n2022;
wire [0:0] n2023;
wire [0:0] n2024;
wire [0:0] n2025;
wire [0:0] n2026;
wire [0:0] n2027;
wire [0:0] n2028;
wire [0:0] n2029;
wire [0:0] n2030;
wire [0:0] n2031;
wire [0:0] n2032;
wire [0:0] n2033;
wire [0:0] n2034;
wire [7:0] n2035;
wire n2036;
wire [15:0] n2037;
wire [0:0] n2038;
wire [0:0] n2039;
wire [6:0] n2040;
wire [7:0] n2041;
wire [6:0] n2042;
wire [7:0] n2043;
wire [15:0] n2044;
wire [0:0] n2045;
wire [0:0] n2046;
wire [0:0] n2047;
wire [0:0] n2048;
wire [0:0] n2049;
wire [0:0] n2050;
wire [0:0] n2051;
wire [0:0] n2052;
wire [0:0] n2053;
wire [0:0] n2054;
wire [0:0] n2055;
wire [0:0] n2056;
wire [0:0] n2057;
wire [0:0] n2058;
wire [7:0] n2059;
wire [7:0] n2060;
wire [7:0] n2061;
wire [7:0] n2062;
wire [7:0] n2063;
wire [7:0] n2064;
wire [7:0] n2065;
wire [7:0] n2066;
wire [7:0] n2067;
wire [7:0] n2068;
wire [7:0] n2069;
wire [6:0] n2070;
wire [0:0] n2071;
wire [0:0] n2072;
wire [0:0] n2073;
wire [0:0] n2074;
wire [0:0] n2075;
wire [0:0] n2076;
wire [0:0] n2077;
wire [0:0] n2078;
wire [0:0] n2079;
wire [0:0] n2080;
wire [0:0] n2081;
wire [0:0] n2082;
wire [0:0] n2083;
wire [0:0] n2084;
wire [0:0] n2085;
wire [7:0] n2086;
wire [0:0] n2087;
wire [7:0] n2088;
wire [6:0] n2089;
wire [7:0] n2090;
wire n2091;
wire [7:0] n2092;
wire [7:0] n2093;
wire [7:0] n2094;
wire [7:0] n2095;
wire [7:0] n2096;
wire [3:0] n2097;
wire [0:0] n2098;
wire [7:0] n2099;
wire [6:0] n2100;
wire [0:0] n2101;
wire [0:0] n2102;
wire [0:0] n2103;
wire [0:0] n2104;
wire [0:0] n2105;
wire [0:0] n2106;
wire [0:0] n2107;
wire [0:0] n2108;
wire [0:0] n2109;
wire [0:0] n2110;
wire [0:0] n2111;
wire [0:0] n2112;
wire [0:0] n2113;
wire [0:0] n2114;
wire [0:0] n2115;
wire [7:0] n2116;
wire [0:0] n2117;
wire n2118;
wire n2119;
wire n2120;
wire n2121;
wire n2122;
wire n2123;
wire n2124;
wire n2125;
wire n2126;
wire n2127;
wire n2128;
wire n2129;
wire n2130;
wire n2131;
wire n2132;
wire n2133;
wire n2134;
wire n2135;
wire n2136;
wire n2137;
wire n2138;
wire n2139;
wire [7:0] n2140;
wire [7:0] n2141;
wire [7:0] n2142;
wire [7:0] n2143;
wire [7:0] n2144;
wire [7:0] n2145;
wire [7:0] n2146;
wire [7:0] n2147;
wire [7:0] n2148;
wire [7:0] n2149;
wire [7:0] n2150;
wire [7:0] n2151;
wire [7:0] n2152;
wire [7:0] n2153;
wire [7:0] n2154;
wire [7:0] n2155;
wire [7:0] n2156;
wire [7:0] n2157;
wire [7:0] n2158;
wire [7:0] n2159;
wire [7:0] n2160;
wire [7:0] n2161;
wire [7:0] n2162;
wire [7:0] n2163;
wire [7:0] n2164;
wire [7:0] n2165;
wire [7:0] n2166;
wire [7:0] n2167;
wire [7:0] n2168;
wire [7:0] n2169;
wire [7:0] n2170;
wire [7:0] n2171;
wire [6:0] n2172;
wire [0:0] n2173;
wire [0:0] n2174;
wire [0:0] n2175;
wire [0:0] n2176;
wire [0:0] n2177;
wire [0:0] n2178;
wire [0:0] n2179;
wire [0:0] n2180;
wire [0:0] n2181;
wire [0:0] n2182;
wire [0:0] n2183;
wire [0:0] n2184;
wire [0:0] n2185;
wire [0:0] n2186;
wire [0:0] n2187;
wire [7:0] n2188;
wire [7:0] n2189;
wire [7:0] n2190;
wire [7:0] n2191;
wire [7:0] n2192;
wire [7:0] n2193;
wire [7:0] n2194;
wire [7:0] n2195;
wire [7:0] n2196;
wire [7:0] n2197;
wire [7:0] n2198;
wire [6:0] n2199;
wire [0:0] n2200;
wire [0:0] n2201;
wire [0:0] n2202;
wire [0:0] n2203;
wire [0:0] n2204;
wire [0:0] n2205;
wire [0:0] n2206;
wire [0:0] n2207;
wire [0:0] n2208;
wire [0:0] n2209;
wire [0:0] n2210;
wire [0:0] n2211;
wire [0:0] n2212;
wire [0:0] n2213;
wire [0:0] n2214;
wire [7:0] n2215;
wire [7:0] n2216;
wire [7:0] n2217;
wire [7:0] n2218;
wire [7:0] n2219;
wire [7:0] n2220;
wire [7:0] n2221;
wire [7:0] n2222;
wire [7:0] n2223;
wire [7:0] n2224;
wire [7:0] n2225;
wire [6:0] n2226;
wire [0:0] n2227;
wire [0:0] n2228;
wire [0:0] n2229;
wire [0:0] n2230;
wire [0:0] n2231;
wire [0:0] n2232;
wire [0:0] n2233;
wire [0:0] n2234;
wire [0:0] n2235;
wire [0:0] n2236;
wire [0:0] n2237;
wire [0:0] n2238;
wire [0:0] n2239;
wire [0:0] n2240;
wire [0:0] n2241;
wire [7:0] n2242;
wire [7:0] n2243;
wire [7:0] n2244;
wire [7:0] n2245;
wire [7:0] n2246;
wire [7:0] n2247;
wire [7:0] n2248;
wire [7:0] n2249;
wire [7:0] n2250;
wire [7:0] n2251;
wire [7:0] n2252;
wire [7:0] n2253;
wire [7:0] n2254;
wire [6:0] n2255;
wire [0:0] n2256;
wire [0:0] n2257;
wire [0:0] n2258;
wire [0:0] n2259;
wire [0:0] n2260;
wire [0:0] n2261;
wire [0:0] n2262;
wire [0:0] n2263;
wire [0:0] n2264;
wire [0:0] n2265;
wire [0:0] n2266;
wire [0:0] n2267;
wire [0:0] n2268;
wire [0:0] n2269;
wire [0:0] n2270;
wire [7:0] n2271;
wire [7:0] n2272;
wire [7:0] n2273;
wire [7:0] n2274;
wire n2275;
wire [0:0] n2276;
wire n2277;
wire [0:0] n2278;
wire [8:0] n2279;
wire [0:0] n2280;
wire [0:0] n2281;
wire n2282;
wire n2283;
wire [0:0] n2284;
wire [7:0] n2285;
wire [6:0] n2286;
wire [0:0] n2287;
wire [0:0] n2288;
wire [0:0] n2289;
wire [0:0] n2290;
wire [0:0] n2291;
wire [0:0] n2292;
wire [0:0] n2293;
wire [0:0] n2294;
wire [0:0] n2295;
wire [0:0] n2296;
wire [0:0] n2297;
wire [0:0] n2298;
wire [0:0] n2299;
wire [0:0] n2300;
wire [0:0] n2301;
wire [7:0] n2302;
wire [7:0] n2303;
wire [7:0] n2304;
wire n2305;
wire [0:0] n2306;
wire n2307;
wire [0:0] n2308;
wire [8:0] n2309;
wire [0:0] n2310;
wire [0:0] n2311;
wire n2312;
wire n2313;
wire [0:0] n2314;
wire [7:0] n2315;
wire [6:0] n2316;
wire [0:0] n2317;
wire [0:0] n2318;
wire [0:0] n2319;
wire [0:0] n2320;
wire [0:0] n2321;
wire [0:0] n2322;
wire [0:0] n2323;
wire [0:0] n2324;
wire [0:0] n2325;
wire [0:0] n2326;
wire [0:0] n2327;
wire [0:0] n2328;
wire [0:0] n2329;
wire [0:0] n2330;
wire [0:0] n2331;
wire [7:0] n2332;
wire [7:0] n2333;
wire [7:0] n2334;
wire n2335;
wire [0:0] n2336;
wire n2337;
wire [0:0] n2338;
wire [8:0] n2339;
wire [0:0] n2340;
wire [0:0] n2341;
wire n2342;
wire n2343;
wire [0:0] n2344;
wire [7:0] n2345;
wire [6:0] n2346;
wire [0:0] n2347;
wire [0:0] n2348;
wire [0:0] n2349;
wire [0:0] n2350;
wire [0:0] n2351;
wire [0:0] n2352;
wire [0:0] n2353;
wire [0:0] n2354;
wire [0:0] n2355;
wire [0:0] n2356;
wire [0:0] n2357;
wire [0:0] n2358;
wire [0:0] n2359;
wire [0:0] n2360;
wire [0:0] n2361;
wire [7:0] n2362;
wire [7:0] n2363;
wire [7:0] n2364;
wire n2365;
wire [0:0] n2366;
wire n2367;
wire [0:0] n2368;
wire [8:0] n2369;
wire [0:0] n2370;
wire [0:0] n2371;
wire n2372;
wire n2373;
wire [0:0] n2374;
wire [7:0] n2375;
wire [6:0] n2376;
wire [0:0] n2377;
wire [0:0] n2378;
wire [0:0] n2379;
wire [0:0] n2380;
wire [0:0] n2381;
wire [0:0] n2382;
wire [0:0] n2383;
wire [0:0] n2384;
wire [0:0] n2385;
wire [0:0] n2386;
wire [0:0] n2387;
wire [0:0] n2388;
wire [0:0] n2389;
wire [0:0] n2390;
wire [0:0] n2391;
wire [7:0] n2392;
wire [0:0] n2393;
wire [0:0] n2394;
wire [7:0] n2395;
wire [6:0] n2396;
wire [7:0] n2397;
wire [7:0] n2398;
wire [6:0] n2399;
wire [7:0] n2400;
wire [15:0] n2401;
wire [7:0] n2402;
wire [7:0] n2403;
wire [15:0] n2404;
wire [15:0] n2405;
wire [7:0] n2406;
wire [7:0] n2407;
wire n2408;
wire n2409;
wire [0:0] n2410;
wire [7:0] n2411;
wire [6:0] n2412;
wire [0:0] n2413;
wire [0:0] n2414;
wire [0:0] n2415;
wire [0:0] n2416;
wire [0:0] n2417;
wire [0:0] n2418;
wire [0:0] n2419;
wire [0:0] n2420;
wire [0:0] n2421;
wire [0:0] n2422;
wire [0:0] n2423;
wire [0:0] n2424;
wire [0:0] n2425;
wire [0:0] n2426;
wire [0:0] n2427;
wire [7:0] n2428;
wire [7:0] n2429;
wire [0:0] n2430;
wire [7:0] n2431;
wire [6:0] n2432;
wire [7:0] n2433;
wire [7:0] n2434;
wire [7:0] n2435;
wire [7:0] n2436;
wire [7:0] n2437;
wire [7:0] n2438;
wire [7:0] n2439;
wire [7:0] n2440;
wire [7:0] n2441;
wire [7:0] n2442;
wire [7:0] n2443;
wire [6:0] n2444;
wire [0:0] n2445;
wire [0:0] n2446;
wire [0:0] n2447;
wire [0:0] n2448;
wire [0:0] n2449;
wire [0:0] n2450;
wire [0:0] n2451;
wire [0:0] n2452;
wire [0:0] n2453;
wire [0:0] n2454;
wire [0:0] n2455;
wire [0:0] n2456;
wire [0:0] n2457;
wire [0:0] n2458;
wire [0:0] n2459;
wire [7:0] n2460;
wire [0:0] n2461;
wire [7:0] n2462;
wire [6:0] n2463;
wire [7:0] n2464;
wire n2465;
wire n2466;
wire [15:0] n2467;
wire n2468;
wire [0:0] n2469;
wire [7:0] n2470;
wire [6:0] n2471;
wire [7:0] n2472;
wire n2473;
wire n2474;
wire [15:0] n2475;
wire n2476;
wire [0:0] n2477;
wire [7:0] n2478;
wire [6:0] n2479;
wire [7:0] n2480;
wire n2481;
wire n2482;
wire [15:0] n2483;
wire n2484;
wire [0:0] n2485;
wire [7:0] n2486;
wire [6:0] n2487;
wire [7:0] n2488;
wire n2489;
wire n2490;
wire [15:0] n2491;
wire n2492;
wire [0:0] n2493;
wire [7:0] n2494;
wire [6:0] n2495;
wire [7:0] n2496;
wire [7:0] n2497;
wire [7:0] n2498;
wire [7:0] n2499;
wire [6:0] n2500;
wire [0:0] n2501;
wire [0:0] n2502;
wire [0:0] n2503;
wire [0:0] n2504;
wire [0:0] n2505;
wire [0:0] n2506;
wire [0:0] n2507;
wire [0:0] n2508;
wire [0:0] n2509;
wire [0:0] n2510;
wire [0:0] n2511;
wire [0:0] n2512;
wire [0:0] n2513;
wire [0:0] n2514;
wire [0:0] n2515;
wire [7:0] n2516;
wire [7:0] n2517;
wire [6:0] n2518;
wire [7:0] n2519;
wire [3:0] n2520;
wire [7:0] n2521;
wire [0:0] n2522;
wire [0:0] n2523;
wire [0:0] n2524;
wire [0:0] n2525;
wire [0:0] n2526;
wire [0:0] n2527;
wire [0:0] n2528;
wire [0:0] n2529;
wire [0:0] n2530;
wire [0:0] n2531;
wire [0:0] n2532;
wire [0:0] n2533;
wire [0:0] n2534;
wire [0:0] n2535;
wire [0:0] n2536;
wire [7:0] n2537;
wire [7:0] n2538;
wire [7:0] n2539;
wire [7:0] n2540;
wire [7:0] n2541;
wire [7:0] n2542;
wire [7:0] n2543;
wire [7:0] n2544;
wire [7:0] n2545;
wire [7:0] n2546;
wire [6:0] n2547;
wire [0:0] n2548;
wire [0:0] n2549;
wire [0:0] n2550;
wire [0:0] n2551;
wire [0:0] n2552;
wire [0:0] n2553;
wire [0:0] n2554;
wire [0:0] n2555;
wire [0:0] n2556;
wire [0:0] n2557;
wire [0:0] n2558;
wire [0:0] n2559;
wire [0:0] n2560;
wire [0:0] n2561;
wire [0:0] n2562;
wire [7:0] n2563;
wire [0:0] n2564;
wire [0:0] n2565;
wire [0:0] n2566;
wire [0:0] n2567;
wire [0:0] n2568;
wire [0:0] n2569;
wire [0:0] n2570;
wire [0:0] n2571;
wire [0:0] n2572;
wire [0:0] n2573;
wire [0:0] n2574;
wire [0:0] n2575;
wire [0:0] n2576;
wire [0:0] n2577;
wire [0:0] n2578;
wire [7:0] n2579;
wire [0:0] n2580;
wire [0:0] n2581;
wire [0:0] n2582;
wire [0:0] n2583;
wire [0:0] n2584;
wire [0:0] n2585;
wire [0:0] n2586;
wire [0:0] n2587;
wire [0:0] n2588;
wire [0:0] n2589;
wire [0:0] n2590;
wire [0:0] n2591;
wire [0:0] n2592;
wire [0:0] n2593;
wire [0:0] n2594;
wire [7:0] n2595;
wire [7:0] n2596;
wire [7:0] n2597;
wire [7:0] n2598;
wire [7:0] n2599;
wire [7:0] n2600;
wire [7:0] n2601;
wire [7:0] n2602;
wire [7:0] n2603;
wire [7:0] n2604;
wire [7:0] n2605;
wire [7:0] n2606;
wire [7:0] n2607;
wire [6:0] n2608;
wire [0:0] n2609;
wire [0:0] n2610;
wire [0:0] n2611;
wire [0:0] n2612;
wire [0:0] n2613;
wire [0:0] n2614;
wire [0:0] n2615;
wire [0:0] n2616;
wire [0:0] n2617;
wire [0:0] n2618;
wire [0:0] n2619;
wire [0:0] n2620;
wire [0:0] n2621;
wire [0:0] n2622;
wire [0:0] n2623;
wire [7:0] n2624;
wire [7:0] n2625;
wire [6:0] n2626;
wire [7:0] n2627;
wire n2628;
wire [3:0] n2629;
wire n2630;
wire n2631;
wire [8:0] n2632;
wire [8:0] n2633;
wire [8:0] n2634;
wire [0:0] n2635;
wire [0:0] n2636;
wire n2637;
wire [3:0] n2638;
wire n2639;
wire n2640;
wire [8:0] n2641;
wire [8:0] n2642;
wire [8:0] n2643;
wire [7:0] n2644;
wire [0:0] n2645;
wire [0:0] n2646;
wire [7:0] n2647;
wire [6:0] n2648;
wire [0:0] n2649;
wire [0:0] n2650;
wire [0:0] n2651;
wire [0:0] n2652;
wire [0:0] n2653;
wire [0:0] n2654;
wire [0:0] n2655;
wire [0:0] n2656;
wire [0:0] n2657;
wire [0:0] n2658;
wire [0:0] n2659;
wire [0:0] n2660;
wire [0:0] n2661;
wire [0:0] n2662;
wire [0:0] n2663;
wire [7:0] n2664;
wire n2665;
wire n2666;
wire [15:0] n2667;
wire [7:0] n2668;
wire [3:0] n2669;
wire [7:0] n2670;
wire [0:0] n2671;
wire [0:0] n2672;
wire [0:0] n2673;
wire [0:0] n2674;
wire [0:0] n2675;
wire [0:0] n2676;
wire [0:0] n2677;
wire [0:0] n2678;
wire [0:0] n2679;
wire [0:0] n2680;
wire [0:0] n2681;
wire [0:0] n2682;
wire [0:0] n2683;
wire [0:0] n2684;
wire [0:0] n2685;
wire [7:0] n2686;
wire n2687;
wire n2688;
wire [15:0] n2689;
wire [0:0] n2690;
wire [0:0] n2691;
wire [0:0] n2692;
wire [0:0] n2693;
wire [0:0] n2694;
wire [0:0] n2695;
wire [0:0] n2696;
wire [0:0] n2697;
wire [0:0] n2698;
wire [0:0] n2699;
wire [0:0] n2700;
wire [0:0] n2701;
wire [0:0] n2702;
wire [0:0] n2703;
wire [0:0] n2704;
wire [7:0] n2705;
wire [15:0] n2706;
wire [0:0] n2707;
wire [0:0] n2708;
wire [0:0] n2709;
wire [0:0] n2710;
wire [0:0] n2711;
wire [0:0] n2712;
wire [0:0] n2713;
wire [0:0] n2714;
wire [0:0] n2715;
wire [0:0] n2716;
wire [0:0] n2717;
wire [0:0] n2718;
wire [0:0] n2719;
wire [0:0] n2720;
wire [0:0] n2721;
wire [7:0] n2722;
wire [7:0] n2723;
wire [7:0] n2724;
wire [0:0] n2725;
wire [0:0] n2726;
wire [0:0] n2727;
wire [0:0] n2728;
wire [0:0] n2729;
wire [0:0] n2730;
wire [0:0] n2731;
wire [0:0] n2732;
wire [0:0] n2733;
wire [0:0] n2734;
wire [0:0] n2735;
wire [0:0] n2736;
wire [0:0] n2737;
wire [0:0] n2738;
wire [0:0] n2739;
wire [7:0] n2740;
wire [7:0] n2741;
wire [7:0] n2742;
wire n2743;
wire [7:0] n2744;
wire n2745;
wire [7:0] n2746;
wire n2747;
wire [7:0] n2748;
wire n2749;
wire [7:0] n2750;
wire n2751;
wire [7:0] n2752;
wire n2753;
wire [7:0] n2754;
wire n2755;
wire [7:0] n2756;
wire n2757;
wire [7:0] n2758;
wire n2759;
wire [7:0] n2760;
wire n2761;
wire [7:0] n2762;
wire n2763;
wire [7:0] n2764;
wire n2765;
wire [7:0] n2766;
wire n2767;
wire n2768;
wire [7:0] n2769;
wire n2770;
wire [7:0] n2771;
wire n2772;
wire [7:0] n2773;
wire n2774;
wire [7:0] n2775;
wire n2776;
wire [7:0] n2777;
wire n2778;
wire [7:0] n2779;
wire n2780;
wire n2781;
wire [7:0] n2782;
wire n2783;
wire [7:0] n2784;
wire n2785;
wire [7:0] n2786;
wire n2787;
wire n2788;
wire n2789;
wire n2790;
wire [7:0] n2791;
wire n2792;
wire [7:0] n2793;
wire n2794;
wire [7:0] n2795;
wire n2796;
wire [7:0] n2797;
wire n2798;
wire [7:0] n2799;
wire n2800;
wire [7:0] n2801;
wire n2802;
wire [7:0] n2803;
wire n2804;
wire [7:0] n2805;
wire n2806;
wire [7:0] n2807;
wire n2808;
wire [7:0] n2809;
wire n2810;
wire [7:0] n2811;
wire n2812;
wire [7:0] n2813;
wire n2814;
wire [7:0] n2815;
wire n2816;
wire [7:0] n2817;
wire n2818;
wire [7:0] n2819;
wire n2820;
wire [7:0] n2821;
wire n2822;
wire [7:0] n2823;
wire n2824;
wire [7:0] n2825;
wire n2826;
wire [7:0] n2827;
wire n2828;
wire [7:0] n2829;
wire n2830;
wire [7:0] n2831;
wire n2832;
wire n2833;
wire n2834;
wire n2835;
wire [7:0] n2836;
wire n2837;
wire [7:0] n2838;
wire n2839;
wire [7:0] n2840;
wire n2841;
wire [7:0] n2842;
wire n2843;
wire [7:0] n2844;
wire n2845;
wire [7:0] n2846;
wire n2847;
wire [7:0] n2848;
wire n2849;
wire [7:0] n2850;
wire n2851;
wire [7:0] n2852;
wire n2853;
wire [7:0] n2854;
wire n2855;
wire [7:0] n2856;
wire n2857;
wire [7:0] n2858;
wire n2859;
wire n2860;
wire [7:0] n2861;
wire n2862;
wire [7:0] n2863;
wire n2864;
wire [7:0] n2865;
wire n2866;
wire [7:0] n2867;
wire n2868;
wire [7:0] n2869;
wire n2870;
wire [7:0] n2871;
wire n2872;
wire [7:0] n2873;
wire n2874;
wire [7:0] n2875;
wire n2876;
wire [7:0] n2877;
wire n2878;
wire n2879;

reg [7:0] IRAM[15:0];

// port: IRAM->RD_IRAM_0
// port: IRAM->RD_IRAM_1
// port: ROM->RD_ROM_0
// port: ROM->RD_ROM_1
// port: ROM->RD_ROM_2
// RD_IRAM_0_ADDR=(if (eq RD_ROM_0 (bv 5 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 6 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 7 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 8 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 9 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 10 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 11 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 12 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 13 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 14 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 15 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 16 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 21 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 22 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 23 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 24 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 25 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 26 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 27 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 28 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 29 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 30 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 31 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 32 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 34 8)) SP (if (eq RD_ROM_0 (bv 37 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 38 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 39 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 40 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 41 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 42 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 43 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 44 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 45 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 46 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 47 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 48 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 50 8)) SP (if (eq RD_ROM_0 (bv 53 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 54 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 55 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 56 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 57 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 58 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 59 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 60 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 61 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 62 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 63 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 66 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 67 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 69 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 70 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 71 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 72 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 73 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 74 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 75 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 76 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 77 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 78 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 79 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 82 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 83 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 85 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 86 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 87 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 88 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 89 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 90 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 91 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 92 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 93 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 94 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 95 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 98 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 99 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 101 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 102 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 103 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 104 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 105 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 106 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 107 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 108 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 109 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 110 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 111 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 114 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 118 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 119 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 130 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 133 8)) RD_ROM_2 (if (eq RD_ROM_0 (bv 134 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 135 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 136 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 137 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 138 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 139 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 140 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 141 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 142 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 143 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 146 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 149 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 150 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 151 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 152 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 153 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 154 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 155 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 156 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 157 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 158 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 159 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 160 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 162 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 166 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 167 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 168 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 169 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 170 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 171 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 172 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 173 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 174 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 175 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 176 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 178 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 181 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 183 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 184 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 185 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 186 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 187 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 188 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 189 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 190 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 191 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 192 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 194 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 197 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 198 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 199 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 200 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 201 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 202 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 203 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 204 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 205 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 206 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 207 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 208 8)) SP (if (eq RD_ROM_0 (bv 210 8)) (if (eq (extract 7 7 RD_ROM_1) (bv 1 1)) (concat (extract 7 3 RD_ROM_1) (bv 0 3)) (add (zero-ext 3 (extract 7 3 RD_ROM_1)) (bv 32 8))) (if (eq RD_ROM_0 (bv 213 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 214 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 215 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 216 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 217 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 218 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 219 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 220 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 221 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 222 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 223 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 226 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 227 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 229 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 230 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 231 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 232 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 233 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 234 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 2 3)) (if (eq RD_ROM_0 (bv 235 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 3 3)) (if (eq RD_ROM_0 (bv 236 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 4 3)) (if (eq RD_ROM_0 (bv 237 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 5 3)) (if (eq RD_ROM_0 (bv 238 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 6 3)) (if (eq RD_ROM_0 (bv 239 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 7 3)) (if (eq RD_ROM_0 (bv 242 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (if (eq RD_ROM_0 (bv 243 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3)) (if (eq RD_ROM_0 (bv 246 8)) (concat (bv 0 3) (extract 4 3 PSW) (bv 0 3)) (concat (bv 0 3) (extract 4 3 PSW) (bv 1 3))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
assign n0001 = 8'h5;
assign n0002 = ( RD_ROM_0 == n0001 );
assign n0003 = 8'h6;
assign n0004 = ( RD_ROM_0 == n0003 );
assign n0005 = 3'h0;
assign n0006 = PSW[4:3];
assign n0007 = { ( n0005 ), ( n0006 ), ( n0005 ) };
assign n0008 = 8'h7;
assign n0009 = ( RD_ROM_0 == n0008 );
assign n0010 = 3'h1;
assign n0011 = { ( n0005 ), ( n0006 ), ( n0010 ) };
assign n0012 = 8'h8;
assign n0013 = ( RD_ROM_0 == n0012 );
assign n0014 = 8'h9;
assign n0015 = ( RD_ROM_0 == n0014 );
assign n0016 = 8'ha;
assign n0017 = ( RD_ROM_0 == n0016 );
assign n0018 = 3'h2;
assign n0019 = { ( n0005 ), ( n0006 ), ( n0018 ) };
assign n0020 = 8'hb;
assign n0021 = ( RD_ROM_0 == n0020 );
assign n0022 = 3'h3;
assign n0023 = { ( n0005 ), ( n0006 ), ( n0022 ) };
assign n0024 = 8'hc;
assign n0025 = ( RD_ROM_0 == n0024 );
assign n0026 = 3'h4;
assign n0027 = { ( n0005 ), ( n0006 ), ( n0026 ) };
assign n0028 = 8'hd;
assign n0029 = ( RD_ROM_0 == n0028 );
assign n0030 = 3'h5;
assign n0031 = { ( n0005 ), ( n0006 ), ( n0030 ) };
assign n0032 = 8'he;
assign n0033 = ( RD_ROM_0 == n0032 );
assign n0034 = 3'h6;
assign n0035 = { ( n0005 ), ( n0006 ), ( n0034 ) };
assign n0036 = 8'hf;
assign n0037 = ( RD_ROM_0 == n0036 );
assign n0038 = 3'h7;
assign n0039 = { ( n0005 ), ( n0006 ), ( n0038 ) };
assign n0040 = 8'h10;
assign n0041 = ( RD_ROM_0 == n0040 );
assign n0042 = RD_ROM_1[7:7];
assign n0043 = 1'h1;
assign n0044 = ( n0042 == n0043 );
assign n0045 = RD_ROM_1[7:3];
assign n0046 = { ( n0045 ), ( n0005 ) };
assign n0047 = { 3'b0, n0045 };
assign n0048 = 8'h20;
assign n0049 = ( n0047 + n0048 );
assign n0050 = ( n0044 ) ? ( n0046 ) : ( n0049 );
assign n0051 = 8'h15;
assign n0052 = ( RD_ROM_0 == n0051 );
assign n0053 = 8'h16;
assign n0054 = ( RD_ROM_0 == n0053 );
assign n0055 = 8'h17;
assign n0056 = ( RD_ROM_0 == n0055 );
assign n0057 = 8'h18;
assign n0058 = ( RD_ROM_0 == n0057 );
assign n0059 = 8'h19;
assign n0060 = ( RD_ROM_0 == n0059 );
assign n0061 = 8'h1a;
assign n0062 = ( RD_ROM_0 == n0061 );
assign n0063 = 8'h1b;
assign n0064 = ( RD_ROM_0 == n0063 );
assign n0065 = 8'h1c;
assign n0066 = ( RD_ROM_0 == n0065 );
assign n0067 = 8'h1d;
assign n0068 = ( RD_ROM_0 == n0067 );
assign n0069 = 8'h1e;
assign n0070 = ( RD_ROM_0 == n0069 );
assign n0071 = 8'h1f;
assign n0072 = ( RD_ROM_0 == n0071 );
assign n0073 = ( RD_ROM_0 == n0048 );
assign n0074 = 8'h22;
assign n0075 = ( RD_ROM_0 == n0074 );
assign n0076 = 8'h25;
assign n0077 = ( RD_ROM_0 == n0076 );
assign n0078 = 8'h26;
assign n0079 = ( RD_ROM_0 == n0078 );
assign n0080 = 8'h27;
assign n0081 = ( RD_ROM_0 == n0080 );
assign n0082 = 8'h28;
assign n0083 = ( RD_ROM_0 == n0082 );
assign n0084 = 8'h29;
assign n0085 = ( RD_ROM_0 == n0084 );
assign n0086 = 8'h2a;
assign n0087 = ( RD_ROM_0 == n0086 );
assign n0088 = 8'h2b;
assign n0089 = ( RD_ROM_0 == n0088 );
assign n0090 = 8'h2c;
assign n0091 = ( RD_ROM_0 == n0090 );
assign n0092 = 8'h2d;
assign n0093 = ( RD_ROM_0 == n0092 );
assign n0094 = 8'h2e;
assign n0095 = ( RD_ROM_0 == n0094 );
assign n0096 = 8'h2f;
assign n0097 = ( RD_ROM_0 == n0096 );
assign n0098 = 8'h30;
assign n0099 = ( RD_ROM_0 == n0098 );
assign n0100 = 8'h32;
assign n0101 = ( RD_ROM_0 == n0100 );
assign n0102 = 8'h35;
assign n0103 = ( RD_ROM_0 == n0102 );
assign n0104 = 8'h36;
assign n0105 = ( RD_ROM_0 == n0104 );
assign n0106 = 8'h37;
assign n0107 = ( RD_ROM_0 == n0106 );
assign n0108 = 8'h38;
assign n0109 = ( RD_ROM_0 == n0108 );
assign n0110 = 8'h39;
assign n0111 = ( RD_ROM_0 == n0110 );
assign n0112 = 8'h3a;
assign n0113 = ( RD_ROM_0 == n0112 );
assign n0114 = 8'h3b;
assign n0115 = ( RD_ROM_0 == n0114 );
assign n0116 = 8'h3c;
assign n0117 = ( RD_ROM_0 == n0116 );
assign n0118 = 8'h3d;
assign n0119 = ( RD_ROM_0 == n0118 );
assign n0120 = 8'h3e;
assign n0121 = ( RD_ROM_0 == n0120 );
assign n0122 = 8'h3f;
assign n0123 = ( RD_ROM_0 == n0122 );
assign n0124 = 8'h42;
assign n0125 = ( RD_ROM_0 == n0124 );
assign n0126 = 8'h43;
assign n0127 = ( RD_ROM_0 == n0126 );
assign n0128 = 8'h45;
assign n0129 = ( RD_ROM_0 == n0128 );
assign n0130 = 8'h46;
assign n0131 = ( RD_ROM_0 == n0130 );
assign n0132 = 8'h47;
assign n0133 = ( RD_ROM_0 == n0132 );
assign n0134 = 8'h48;
assign n0135 = ( RD_ROM_0 == n0134 );
assign n0136 = 8'h49;
assign n0137 = ( RD_ROM_0 == n0136 );
assign n0138 = 8'h4a;
assign n0139 = ( RD_ROM_0 == n0138 );
assign n0140 = 8'h4b;
assign n0141 = ( RD_ROM_0 == n0140 );
assign n0142 = 8'h4c;
assign n0143 = ( RD_ROM_0 == n0142 );
assign n0144 = 8'h4d;
assign n0145 = ( RD_ROM_0 == n0144 );
assign n0146 = 8'h4e;
assign n0147 = ( RD_ROM_0 == n0146 );
assign n0148 = 8'h4f;
assign n0149 = ( RD_ROM_0 == n0148 );
assign n0150 = 8'h52;
assign n0151 = ( RD_ROM_0 == n0150 );
assign n0152 = 8'h53;
assign n0153 = ( RD_ROM_0 == n0152 );
assign n0154 = 8'h55;
assign n0155 = ( RD_ROM_0 == n0154 );
assign n0156 = 8'h56;
assign n0157 = ( RD_ROM_0 == n0156 );
assign n0158 = 8'h57;
assign n0159 = ( RD_ROM_0 == n0158 );
assign n0160 = 8'h58;
assign n0161 = ( RD_ROM_0 == n0160 );
assign n0162 = 8'h59;
assign n0163 = ( RD_ROM_0 == n0162 );
assign n0164 = 8'h5a;
assign n0165 = ( RD_ROM_0 == n0164 );
assign n0166 = 8'h5b;
assign n0167 = ( RD_ROM_0 == n0166 );
assign n0168 = 8'h5c;
assign n0169 = ( RD_ROM_0 == n0168 );
assign n0170 = 8'h5d;
assign n0171 = ( RD_ROM_0 == n0170 );
assign n0172 = 8'h5e;
assign n0173 = ( RD_ROM_0 == n0172 );
assign n0174 = 8'h5f;
assign n0175 = ( RD_ROM_0 == n0174 );
assign n0176 = 8'h62;
assign n0177 = ( RD_ROM_0 == n0176 );
assign n0178 = 8'h63;
assign n0179 = ( RD_ROM_0 == n0178 );
assign n0180 = 8'h65;
assign n0181 = ( RD_ROM_0 == n0180 );
assign n0182 = 8'h66;
assign n0183 = ( RD_ROM_0 == n0182 );
assign n0184 = 8'h67;
assign n0185 = ( RD_ROM_0 == n0184 );
assign n0186 = 8'h68;
assign n0187 = ( RD_ROM_0 == n0186 );
assign n0188 = 8'h69;
assign n0189 = ( RD_ROM_0 == n0188 );
assign n0190 = 8'h6a;
assign n0191 = ( RD_ROM_0 == n0190 );
assign n0192 = 8'h6b;
assign n0193 = ( RD_ROM_0 == n0192 );
assign n0194 = 8'h6c;
assign n0195 = ( RD_ROM_0 == n0194 );
assign n0196 = 8'h6d;
assign n0197 = ( RD_ROM_0 == n0196 );
assign n0198 = 8'h6e;
assign n0199 = ( RD_ROM_0 == n0198 );
assign n0200 = 8'h6f;
assign n0201 = ( RD_ROM_0 == n0200 );
assign n0202 = 8'h72;
assign n0203 = ( RD_ROM_0 == n0202 );
assign n0204 = 8'h76;
assign n0205 = ( RD_ROM_0 == n0204 );
assign n0206 = 8'h77;
assign n0207 = ( RD_ROM_0 == n0206 );
assign n0208 = 8'h82;
assign n0209 = ( RD_ROM_0 == n0208 );
assign n0210 = 8'h85;
assign n0211 = ( RD_ROM_0 == n0210 );
assign n0212 = 8'h86;
assign n0213 = ( RD_ROM_0 == n0212 );
assign n0214 = 8'h87;
assign n0215 = ( RD_ROM_0 == n0214 );
assign n0216 = 8'h88;
assign n0217 = ( RD_ROM_0 == n0216 );
assign n0218 = 8'h89;
assign n0219 = ( RD_ROM_0 == n0218 );
assign n0220 = 8'h8a;
assign n0221 = ( RD_ROM_0 == n0220 );
assign n0222 = 8'h8b;
assign n0223 = ( RD_ROM_0 == n0222 );
assign n0224 = 8'h8c;
assign n0225 = ( RD_ROM_0 == n0224 );
assign n0226 = 8'h8d;
assign n0227 = ( RD_ROM_0 == n0226 );
assign n0228 = 8'h8e;
assign n0229 = ( RD_ROM_0 == n0228 );
assign n0230 = 8'h8f;
assign n0231 = ( RD_ROM_0 == n0230 );
assign n0232 = 8'h92;
assign n0233 = ( RD_ROM_0 == n0232 );
assign n0234 = 8'h95;
assign n0235 = ( RD_ROM_0 == n0234 );
assign n0236 = 8'h96;
assign n0237 = ( RD_ROM_0 == n0236 );
assign n0238 = 8'h97;
assign n0239 = ( RD_ROM_0 == n0238 );
assign n0240 = 8'h98;
assign n0241 = ( RD_ROM_0 == n0240 );
assign n0242 = 8'h99;
assign n0243 = ( RD_ROM_0 == n0242 );
assign n0244 = 8'h9a;
assign n0245 = ( RD_ROM_0 == n0244 );
assign n0246 = 8'h9b;
assign n0247 = ( RD_ROM_0 == n0246 );
assign n0248 = 8'h9c;
assign n0249 = ( RD_ROM_0 == n0248 );
assign n0250 = 8'h9d;
assign n0251 = ( RD_ROM_0 == n0250 );
assign n0252 = 8'h9e;
assign n0253 = ( RD_ROM_0 == n0252 );
assign n0254 = 8'h9f;
assign n0255 = ( RD_ROM_0 == n0254 );
assign n0256 = 8'ha0;
assign n0257 = ( RD_ROM_0 == n0256 );
assign n0258 = 8'ha2;
assign n0259 = ( RD_ROM_0 == n0258 );
assign n0260 = 8'ha6;
assign n0261 = ( RD_ROM_0 == n0260 );
assign n0262 = 8'ha7;
assign n0263 = ( RD_ROM_0 == n0262 );
assign n0264 = 8'ha8;
assign n0265 = ( RD_ROM_0 == n0264 );
assign n0266 = 8'ha9;
assign n0267 = ( RD_ROM_0 == n0266 );
assign n0268 = 8'haa;
assign n0269 = ( RD_ROM_0 == n0268 );
assign n0270 = 8'hab;
assign n0271 = ( RD_ROM_0 == n0270 );
assign n0272 = 8'hac;
assign n0273 = ( RD_ROM_0 == n0272 );
assign n0274 = 8'had;
assign n0275 = ( RD_ROM_0 == n0274 );
assign n0276 = 8'hae;
assign n0277 = ( RD_ROM_0 == n0276 );
assign n0278 = 8'haf;
assign n0279 = ( RD_ROM_0 == n0278 );
assign n0280 = 8'hb0;
assign n0281 = ( RD_ROM_0 == n0280 );
assign n0282 = 8'hb2;
assign n0283 = ( RD_ROM_0 == n0282 );
assign n0284 = 8'hb5;
assign n0285 = ( RD_ROM_0 == n0284 );
assign n0286 = 8'hb6;
assign n0287 = ( RD_ROM_0 == n0286 );
assign n0288 = 8'hb7;
assign n0289 = ( RD_ROM_0 == n0288 );
assign n0290 = 8'hb8;
assign n0291 = ( RD_ROM_0 == n0290 );
assign n0292 = 8'hb9;
assign n0293 = ( RD_ROM_0 == n0292 );
assign n0294 = 8'hba;
assign n0295 = ( RD_ROM_0 == n0294 );
assign n0296 = 8'hbb;
assign n0297 = ( RD_ROM_0 == n0296 );
assign n0298 = 8'hbc;
assign n0299 = ( RD_ROM_0 == n0298 );
assign n0300 = 8'hbd;
assign n0301 = ( RD_ROM_0 == n0300 );
assign n0302 = 8'hbe;
assign n0303 = ( RD_ROM_0 == n0302 );
assign n0304 = 8'hbf;
assign n0305 = ( RD_ROM_0 == n0304 );
assign n0306 = 8'hc0;
assign n0307 = ( RD_ROM_0 == n0306 );
assign n0308 = 8'hc2;
assign n0309 = ( RD_ROM_0 == n0308 );
assign n0310 = 8'hc5;
assign n0311 = ( RD_ROM_0 == n0310 );
assign n0312 = 8'hc6;
assign n0313 = ( RD_ROM_0 == n0312 );
assign n0314 = 8'hc7;
assign n0315 = ( RD_ROM_0 == n0314 );
assign n0316 = 8'hc8;
assign n0317 = ( RD_ROM_0 == n0316 );
assign n0318 = 8'hc9;
assign n0319 = ( RD_ROM_0 == n0318 );
assign n0320 = 8'hca;
assign n0321 = ( RD_ROM_0 == n0320 );
assign n0322 = 8'hcb;
assign n0323 = ( RD_ROM_0 == n0322 );
assign n0324 = 8'hcc;
assign n0325 = ( RD_ROM_0 == n0324 );
assign n0326 = 8'hcd;
assign n0327 = ( RD_ROM_0 == n0326 );
assign n0328 = 8'hce;
assign n0329 = ( RD_ROM_0 == n0328 );
assign n0330 = 8'hcf;
assign n0331 = ( RD_ROM_0 == n0330 );
assign n0332 = 8'hd0;
assign n0333 = ( RD_ROM_0 == n0332 );
assign n0334 = 8'hd2;
assign n0335 = ( RD_ROM_0 == n0334 );
assign n0336 = 8'hd5;
assign n0337 = ( RD_ROM_0 == n0336 );
assign n0338 = 8'hd6;
assign n0339 = ( RD_ROM_0 == n0338 );
assign n0340 = 8'hd7;
assign n0341 = ( RD_ROM_0 == n0340 );
assign n0342 = 8'hd8;
assign n0343 = ( RD_ROM_0 == n0342 );
assign n0344 = 8'hd9;
assign n0345 = ( RD_ROM_0 == n0344 );
assign n0346 = 8'hda;
assign n0347 = ( RD_ROM_0 == n0346 );
assign n0348 = 8'hdb;
assign n0349 = ( RD_ROM_0 == n0348 );
assign n0350 = 8'hdc;
assign n0351 = ( RD_ROM_0 == n0350 );
assign n0352 = 8'hdd;
assign n0353 = ( RD_ROM_0 == n0352 );
assign n0354 = 8'hde;
assign n0355 = ( RD_ROM_0 == n0354 );
assign n0356 = 8'hdf;
assign n0357 = ( RD_ROM_0 == n0356 );
assign n0358 = 8'he2;
assign n0359 = ( RD_ROM_0 == n0358 );
assign n0360 = 8'he3;
assign n0361 = ( RD_ROM_0 == n0360 );
assign n0362 = 8'he5;
assign n0363 = ( RD_ROM_0 == n0362 );
assign n0364 = 8'he6;
assign n0365 = ( RD_ROM_0 == n0364 );
assign n0366 = 8'he7;
assign n0367 = ( RD_ROM_0 == n0366 );
assign n0368 = 8'he8;
assign n0369 = ( RD_ROM_0 == n0368 );
assign n0370 = 8'he9;
assign n0371 = ( RD_ROM_0 == n0370 );
assign n0372 = 8'hea;
assign n0373 = ( RD_ROM_0 == n0372 );
assign n0374 = 8'heb;
assign n0375 = ( RD_ROM_0 == n0374 );
assign n0376 = 8'hec;
assign n0377 = ( RD_ROM_0 == n0376 );
assign n0378 = 8'hed;
assign n0379 = ( RD_ROM_0 == n0378 );
assign n0380 = 8'hee;
assign n0381 = ( RD_ROM_0 == n0380 );
assign n0382 = 8'hef;
assign n0383 = ( RD_ROM_0 == n0382 );
assign n0384 = 8'hf2;
assign n0385 = ( RD_ROM_0 == n0384 );
assign n0386 = 8'hf3;
assign n0387 = ( RD_ROM_0 == n0386 );
assign n0388 = 8'hf6;
assign n0389 = ( RD_ROM_0 == n0388 );
assign n0390 = ( n0389 ) ? ( n0007 ) : ( n0011 );
assign n0391 = ( n0387 ) ? ( n0011 ) : ( n0390 );
assign n0392 = ( n0385 ) ? ( n0007 ) : ( n0391 );
assign n0393 = ( n0383 ) ? ( n0039 ) : ( n0392 );
assign n0394 = ( n0381 ) ? ( n0035 ) : ( n0393 );
assign n0395 = ( n0379 ) ? ( n0031 ) : ( n0394 );
assign n0396 = ( n0377 ) ? ( n0027 ) : ( n0395 );
assign n0397 = ( n0375 ) ? ( n0023 ) : ( n0396 );
assign n0398 = ( n0373 ) ? ( n0019 ) : ( n0397 );
assign n0399 = ( n0371 ) ? ( n0011 ) : ( n0398 );
assign n0400 = ( n0369 ) ? ( n0007 ) : ( n0399 );
assign n0401 = ( n0367 ) ? ( n0011 ) : ( n0400 );
assign n0402 = ( n0365 ) ? ( n0007 ) : ( n0401 );
assign n0403 = ( n0363 ) ? ( RD_ROM_1 ) : ( n0402 );
assign n0404 = ( n0361 ) ? ( n0011 ) : ( n0403 );
assign n0405 = ( n0359 ) ? ( n0007 ) : ( n0404 );
assign n0406 = ( n0357 ) ? ( n0039 ) : ( n0405 );
assign n0407 = ( n0355 ) ? ( n0035 ) : ( n0406 );
assign n0408 = ( n0353 ) ? ( n0031 ) : ( n0407 );
assign n0409 = ( n0351 ) ? ( n0027 ) : ( n0408 );
assign n0410 = ( n0349 ) ? ( n0023 ) : ( n0409 );
assign n0411 = ( n0347 ) ? ( n0019 ) : ( n0410 );
assign n0412 = ( n0345 ) ? ( n0011 ) : ( n0411 );
assign n0413 = ( n0343 ) ? ( n0007 ) : ( n0412 );
assign n0414 = ( n0341 ) ? ( n0011 ) : ( n0413 );
assign n0415 = ( n0339 ) ? ( n0007 ) : ( n0414 );
assign n0416 = ( n0337 ) ? ( RD_ROM_1 ) : ( n0415 );
assign n0417 = ( n0335 ) ? ( n0050 ) : ( n0416 );
assign n0418 = ( n0333 ) ? ( SP ) : ( n0417 );
assign n0419 = ( n0331 ) ? ( n0039 ) : ( n0418 );
assign n0420 = ( n0329 ) ? ( n0035 ) : ( n0419 );
assign n0421 = ( n0327 ) ? ( n0031 ) : ( n0420 );
assign n0422 = ( n0325 ) ? ( n0027 ) : ( n0421 );
assign n0423 = ( n0323 ) ? ( n0023 ) : ( n0422 );
assign n0424 = ( n0321 ) ? ( n0019 ) : ( n0423 );
assign n0425 = ( n0319 ) ? ( n0011 ) : ( n0424 );
assign n0426 = ( n0317 ) ? ( n0007 ) : ( n0425 );
assign n0427 = ( n0315 ) ? ( n0011 ) : ( n0426 );
assign n0428 = ( n0313 ) ? ( n0007 ) : ( n0427 );
assign n0429 = ( n0311 ) ? ( RD_ROM_1 ) : ( n0428 );
assign n0430 = ( n0309 ) ? ( n0050 ) : ( n0429 );
assign n0431 = ( n0307 ) ? ( RD_ROM_1 ) : ( n0430 );
assign n0432 = ( n0305 ) ? ( n0039 ) : ( n0431 );
assign n0433 = ( n0303 ) ? ( n0035 ) : ( n0432 );
assign n0434 = ( n0301 ) ? ( n0031 ) : ( n0433 );
assign n0435 = ( n0299 ) ? ( n0027 ) : ( n0434 );
assign n0436 = ( n0297 ) ? ( n0023 ) : ( n0435 );
assign n0437 = ( n0295 ) ? ( n0019 ) : ( n0436 );
assign n0438 = ( n0293 ) ? ( n0011 ) : ( n0437 );
assign n0439 = ( n0291 ) ? ( n0007 ) : ( n0438 );
assign n0440 = ( n0289 ) ? ( n0011 ) : ( n0439 );
assign n0441 = ( n0287 ) ? ( n0007 ) : ( n0440 );
assign n0442 = ( n0285 ) ? ( RD_ROM_1 ) : ( n0441 );
assign n0443 = ( n0283 ) ? ( n0050 ) : ( n0442 );
assign n0444 = ( n0281 ) ? ( n0050 ) : ( n0443 );
assign n0445 = ( n0279 ) ? ( RD_ROM_1 ) : ( n0444 );
assign n0446 = ( n0277 ) ? ( RD_ROM_1 ) : ( n0445 );
assign n0447 = ( n0275 ) ? ( RD_ROM_1 ) : ( n0446 );
assign n0448 = ( n0273 ) ? ( RD_ROM_1 ) : ( n0447 );
assign n0449 = ( n0271 ) ? ( RD_ROM_1 ) : ( n0448 );
assign n0450 = ( n0269 ) ? ( RD_ROM_1 ) : ( n0449 );
assign n0451 = ( n0267 ) ? ( RD_ROM_1 ) : ( n0450 );
assign n0452 = ( n0265 ) ? ( RD_ROM_1 ) : ( n0451 );
assign n0453 = ( n0263 ) ? ( n0011 ) : ( n0452 );
assign n0454 = ( n0261 ) ? ( n0007 ) : ( n0453 );
assign n0455 = ( n0259 ) ? ( n0050 ) : ( n0454 );
assign n0456 = ( n0257 ) ? ( n0050 ) : ( n0455 );
assign n0457 = ( n0255 ) ? ( n0039 ) : ( n0456 );
assign n0458 = ( n0253 ) ? ( n0035 ) : ( n0457 );
assign n0459 = ( n0251 ) ? ( n0031 ) : ( n0458 );
assign n0460 = ( n0249 ) ? ( n0027 ) : ( n0459 );
assign n0461 = ( n0247 ) ? ( n0023 ) : ( n0460 );
assign n0462 = ( n0245 ) ? ( n0019 ) : ( n0461 );
assign n0463 = ( n0243 ) ? ( n0011 ) : ( n0462 );
assign n0464 = ( n0241 ) ? ( n0007 ) : ( n0463 );
assign n0465 = ( n0239 ) ? ( n0011 ) : ( n0464 );
assign n0466 = ( n0237 ) ? ( n0007 ) : ( n0465 );
assign n0467 = ( n0235 ) ? ( RD_ROM_1 ) : ( n0466 );
assign n0468 = ( n0233 ) ? ( n0050 ) : ( n0467 );
assign n0469 = ( n0231 ) ? ( n0039 ) : ( n0468 );
assign n0470 = ( n0229 ) ? ( n0035 ) : ( n0469 );
assign n0471 = ( n0227 ) ? ( n0031 ) : ( n0470 );
assign n0472 = ( n0225 ) ? ( n0027 ) : ( n0471 );
assign n0473 = ( n0223 ) ? ( n0023 ) : ( n0472 );
assign n0474 = ( n0221 ) ? ( n0019 ) : ( n0473 );
assign n0475 = ( n0219 ) ? ( n0011 ) : ( n0474 );
assign n0476 = ( n0217 ) ? ( n0007 ) : ( n0475 );
assign n0477 = ( n0215 ) ? ( n0011 ) : ( n0476 );
assign n0478 = ( n0213 ) ? ( n0007 ) : ( n0477 );
assign n0479 = ( n0211 ) ? ( RD_ROM_2 ) : ( n0478 );
assign n0480 = ( n0209 ) ? ( n0050 ) : ( n0479 );
assign n0481 = ( n0207 ) ? ( n0011 ) : ( n0480 );
assign n0482 = ( n0205 ) ? ( n0007 ) : ( n0481 );
assign n0483 = ( n0203 ) ? ( n0050 ) : ( n0482 );
assign n0484 = ( n0201 ) ? ( n0039 ) : ( n0483 );
assign n0485 = ( n0199 ) ? ( n0035 ) : ( n0484 );
assign n0486 = ( n0197 ) ? ( n0031 ) : ( n0485 );
assign n0487 = ( n0195 ) ? ( n0027 ) : ( n0486 );
assign n0488 = ( n0193 ) ? ( n0023 ) : ( n0487 );
assign n0489 = ( n0191 ) ? ( n0019 ) : ( n0488 );
assign n0490 = ( n0189 ) ? ( n0011 ) : ( n0489 );
assign n0491 = ( n0187 ) ? ( n0007 ) : ( n0490 );
assign n0492 = ( n0185 ) ? ( n0011 ) : ( n0491 );
assign n0493 = ( n0183 ) ? ( n0007 ) : ( n0492 );
assign n0494 = ( n0181 ) ? ( RD_ROM_1 ) : ( n0493 );
assign n0495 = ( n0179 ) ? ( RD_ROM_1 ) : ( n0494 );
assign n0496 = ( n0177 ) ? ( RD_ROM_1 ) : ( n0495 );
assign n0497 = ( n0175 ) ? ( n0039 ) : ( n0496 );
assign n0498 = ( n0173 ) ? ( n0035 ) : ( n0497 );
assign n0499 = ( n0171 ) ? ( n0031 ) : ( n0498 );
assign n0500 = ( n0169 ) ? ( n0027 ) : ( n0499 );
assign n0501 = ( n0167 ) ? ( n0023 ) : ( n0500 );
assign n0502 = ( n0165 ) ? ( n0019 ) : ( n0501 );
assign n0503 = ( n0163 ) ? ( n0011 ) : ( n0502 );
assign n0504 = ( n0161 ) ? ( n0007 ) : ( n0503 );
assign n0505 = ( n0159 ) ? ( n0011 ) : ( n0504 );
assign n0506 = ( n0157 ) ? ( n0007 ) : ( n0505 );
assign n0507 = ( n0155 ) ? ( RD_ROM_1 ) : ( n0506 );
assign n0508 = ( n0153 ) ? ( RD_ROM_1 ) : ( n0507 );
assign n0509 = ( n0151 ) ? ( RD_ROM_1 ) : ( n0508 );
assign n0510 = ( n0149 ) ? ( n0039 ) : ( n0509 );
assign n0511 = ( n0147 ) ? ( n0035 ) : ( n0510 );
assign n0512 = ( n0145 ) ? ( n0031 ) : ( n0511 );
assign n0513 = ( n0143 ) ? ( n0027 ) : ( n0512 );
assign n0514 = ( n0141 ) ? ( n0023 ) : ( n0513 );
assign n0515 = ( n0139 ) ? ( n0019 ) : ( n0514 );
assign n0516 = ( n0137 ) ? ( n0011 ) : ( n0515 );
assign n0517 = ( n0135 ) ? ( n0007 ) : ( n0516 );
assign n0518 = ( n0133 ) ? ( n0011 ) : ( n0517 );
assign n0519 = ( n0131 ) ? ( n0007 ) : ( n0518 );
assign n0520 = ( n0129 ) ? ( RD_ROM_1 ) : ( n0519 );
assign n0521 = ( n0127 ) ? ( RD_ROM_1 ) : ( n0520 );
assign n0522 = ( n0125 ) ? ( RD_ROM_1 ) : ( n0521 );
assign n0523 = ( n0123 ) ? ( n0039 ) : ( n0522 );
assign n0524 = ( n0121 ) ? ( n0035 ) : ( n0523 );
assign n0525 = ( n0119 ) ? ( n0031 ) : ( n0524 );
assign n0526 = ( n0117 ) ? ( n0027 ) : ( n0525 );
assign n0527 = ( n0115 ) ? ( n0023 ) : ( n0526 );
assign n0528 = ( n0113 ) ? ( n0019 ) : ( n0527 );
assign n0529 = ( n0111 ) ? ( n0011 ) : ( n0528 );
assign n0530 = ( n0109 ) ? ( n0007 ) : ( n0529 );
assign n0531 = ( n0107 ) ? ( n0011 ) : ( n0530 );
assign n0532 = ( n0105 ) ? ( n0007 ) : ( n0531 );
assign n0533 = ( n0103 ) ? ( RD_ROM_1 ) : ( n0532 );
assign n0534 = ( n0101 ) ? ( SP ) : ( n0533 );
assign n0535 = ( n0099 ) ? ( n0050 ) : ( n0534 );
assign n0536 = ( n0097 ) ? ( n0039 ) : ( n0535 );
assign n0537 = ( n0095 ) ? ( n0035 ) : ( n0536 );
assign n0538 = ( n0093 ) ? ( n0031 ) : ( n0537 );
assign n0539 = ( n0091 ) ? ( n0027 ) : ( n0538 );
assign n0540 = ( n0089 ) ? ( n0023 ) : ( n0539 );
assign n0541 = ( n0087 ) ? ( n0019 ) : ( n0540 );
assign n0542 = ( n0085 ) ? ( n0011 ) : ( n0541 );
assign n0543 = ( n0083 ) ? ( n0007 ) : ( n0542 );
assign n0544 = ( n0081 ) ? ( n0011 ) : ( n0543 );
assign n0545 = ( n0079 ) ? ( n0007 ) : ( n0544 );
assign n0546 = ( n0077 ) ? ( RD_ROM_1 ) : ( n0545 );
assign n0547 = ( n0075 ) ? ( SP ) : ( n0546 );
assign n0548 = ( n0073 ) ? ( n0050 ) : ( n0547 );
assign n0549 = ( n0072 ) ? ( n0039 ) : ( n0548 );
assign n0550 = ( n0070 ) ? ( n0035 ) : ( n0549 );
assign n0551 = ( n0068 ) ? ( n0031 ) : ( n0550 );
assign n0552 = ( n0066 ) ? ( n0027 ) : ( n0551 );
assign n0553 = ( n0064 ) ? ( n0023 ) : ( n0552 );
assign n0554 = ( n0062 ) ? ( n0019 ) : ( n0553 );
assign n0555 = ( n0060 ) ? ( n0011 ) : ( n0554 );
assign n0556 = ( n0058 ) ? ( n0007 ) : ( n0555 );
assign n0557 = ( n0056 ) ? ( n0011 ) : ( n0556 );
assign n0558 = ( n0054 ) ? ( n0007 ) : ( n0557 );
assign n0559 = ( n0052 ) ? ( RD_ROM_1 ) : ( n0558 );
assign n0560 = ( n0041 ) ? ( n0050 ) : ( n0559 );
assign n0561 = ( n0037 ) ? ( n0039 ) : ( n0560 );
assign n0562 = ( n0033 ) ? ( n0035 ) : ( n0561 );
assign n0563 = ( n0029 ) ? ( n0031 ) : ( n0562 );
assign n0564 = ( n0025 ) ? ( n0027 ) : ( n0563 );
assign n0565 = ( n0021 ) ? ( n0023 ) : ( n0564 );
assign n0566 = ( n0017 ) ? ( n0019 ) : ( n0565 );
assign n0567 = ( n0015 ) ? ( n0011 ) : ( n0566 );
assign n0568 = ( n0013 ) ? ( n0007 ) : ( n0567 );
assign n0569 = ( n0009 ) ? ( n0011 ) : ( n0568 );
assign n0570 = ( n0004 ) ? ( n0007 ) : ( n0569 );
assign n0571 = ( n0002 ) ? ( RD_ROM_1 ) : ( n0570 );
assign RD_IRAM_0_ADDR = n0571;
assign n0572 = n0571[3:0];
assign n0573 = IRAM[n0572];
assign RD_IRAM_0 = n0573;
// RD_IRAM_1_ADDR=(if (eq RD_ROM_0 (bv 6 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 7 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 22 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 23 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 34 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 38 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 39 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 50 8)) (sub SP (bv 1 8)) (if (eq RD_ROM_0 (bv 54 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 55 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 70 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 71 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 86 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 87 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 102 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 103 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 134 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 135 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 150 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 151 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 166 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 167 8)) RD_ROM_1 (if (eq RD_ROM_0 (bv 182 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 183 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 198 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 199 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 214 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 215 8)) RD_IRAM_0 (if (eq RD_ROM_0 (bv 230 8)) RD_IRAM_0 RD_IRAM_0)))))))))))))))))))))))))))))
assign n0574 = 8'h1;
assign n0575 = ( SP - n0574 );
assign n0576 = ( n0365 ) ? ( RD_IRAM_0 ) : ( RD_IRAM_0 );
assign n0577 = ( n0341 ) ? ( RD_IRAM_0 ) : ( n0576 );
assign n0578 = ( n0339 ) ? ( RD_IRAM_0 ) : ( n0577 );
assign n0579 = ( n0315 ) ? ( RD_IRAM_0 ) : ( n0578 );
assign n0580 = ( n0313 ) ? ( RD_IRAM_0 ) : ( n0579 );
assign n0581 = ( n0289 ) ? ( RD_IRAM_0 ) : ( n0580 );
assign n0582 = ( n0287 ) ? ( RD_IRAM_0 ) : ( n0581 );
assign n0583 = ( n0263 ) ? ( RD_ROM_1 ) : ( n0582 );
assign n0584 = ( n0261 ) ? ( RD_ROM_1 ) : ( n0583 );
assign n0585 = ( n0239 ) ? ( RD_IRAM_0 ) : ( n0584 );
assign n0586 = ( n0237 ) ? ( RD_IRAM_0 ) : ( n0585 );
assign n0587 = ( n0215 ) ? ( RD_IRAM_0 ) : ( n0586 );
assign n0588 = ( n0213 ) ? ( RD_IRAM_0 ) : ( n0587 );
assign n0589 = ( n0185 ) ? ( RD_IRAM_0 ) : ( n0588 );
assign n0590 = ( n0183 ) ? ( RD_IRAM_0 ) : ( n0589 );
assign n0591 = ( n0159 ) ? ( RD_IRAM_0 ) : ( n0590 );
assign n0592 = ( n0157 ) ? ( RD_IRAM_0 ) : ( n0591 );
assign n0593 = ( n0133 ) ? ( RD_IRAM_0 ) : ( n0592 );
assign n0594 = ( n0131 ) ? ( RD_IRAM_0 ) : ( n0593 );
assign n0595 = ( n0107 ) ? ( RD_IRAM_0 ) : ( n0594 );
assign n0596 = ( n0105 ) ? ( RD_IRAM_0 ) : ( n0595 );
assign n0597 = ( n0101 ) ? ( n0575 ) : ( n0596 );
assign n0598 = ( n0081 ) ? ( RD_IRAM_0 ) : ( n0597 );
assign n0599 = ( n0079 ) ? ( RD_IRAM_0 ) : ( n0598 );
assign n0600 = ( n0075 ) ? ( n0575 ) : ( n0599 );
assign n0601 = ( n0056 ) ? ( RD_IRAM_0 ) : ( n0600 );
assign n0602 = ( n0054 ) ? ( RD_IRAM_0 ) : ( n0601 );
assign n0603 = ( n0009 ) ? ( RD_IRAM_0 ) : ( n0602 );
assign n0604 = ( n0004 ) ? ( RD_IRAM_0 ) : ( n0603 );
assign RD_IRAM_1_ADDR = n0604;
assign n0605 = n0604[3:0];
assign n0606 = IRAM[n0605];
assign RD_IRAM_1 = n0606;
// RD_ROM_0_ADDR=PC
assign RD_ROM_0_ADDR = PC;
// RD_ROM_1_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 5 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 21 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 36 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 37 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 52 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 53 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 64 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 66 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 68 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 69 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 80 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 82 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 84 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 85 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 96 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 98 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 100 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 101 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 112 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 114 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 116 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 118 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 119 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 120 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 121 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 122 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 123 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 124 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 125 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 126 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 127 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 128 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 130 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 131 16)) (add (zero-ext 8 ACC) (add PC (bv 1 16))) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 134 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 135 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 136 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 137 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 138 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 139 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 140 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 141 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 142 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 143 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 146 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 147 16)) (add (zero-ext 8 ACC) (concat DPH DPL)) (if (eq RD_ROM_0 (bv 148 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 149 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 160 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 162 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 166 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 167 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 168 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 169 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 170 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 171 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 172 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 173 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 174 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 175 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 176 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 178 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 192 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 194 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 197 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 208 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 210 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 216 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 217 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 218 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 219 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 220 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 221 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 222 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 223 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 229 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 241 16)) (add PC (bv 2 16)) (add PC (bv 1 16))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))
assign n0607 = 16'h1;
assign n0608 = ( RD_ROM_0 == n0607 );
assign n0609 = 16'h2;
assign n0610 = ( PC + n0609 );
assign n0611 = ( RD_ROM_0 == n0609 );
assign n0612 = ( PC + n0607 );
assign n0613 = 16'h5;
assign n0614 = ( RD_ROM_0 == n0613 );
assign n0615 = 16'h10;
assign n0616 = ( RD_ROM_0 == n0615 );
assign n0617 = 16'h11;
assign n0618 = ( RD_ROM_0 == n0617 );
assign n0619 = 16'h12;
assign n0620 = ( RD_ROM_0 == n0619 );
assign n0621 = 16'h15;
assign n0622 = ( RD_ROM_0 == n0621 );
assign n0623 = 16'h20;
assign n0624 = ( RD_ROM_0 == n0623 );
assign n0625 = 16'h21;
assign n0626 = ( RD_ROM_0 == n0625 );
assign n0627 = 16'h24;
assign n0628 = ( RD_ROM_0 == n0627 );
assign n0629 = 16'h25;
assign n0630 = ( RD_ROM_0 == n0629 );
assign n0631 = 16'h30;
assign n0632 = ( RD_ROM_0 == n0631 );
assign n0633 = 16'h31;
assign n0634 = ( RD_ROM_0 == n0633 );
assign n0635 = 16'h34;
assign n0636 = ( RD_ROM_0 == n0635 );
assign n0637 = 16'h35;
assign n0638 = ( RD_ROM_0 == n0637 );
assign n0639 = 16'h40;
assign n0640 = ( RD_ROM_0 == n0639 );
assign n0641 = 16'h41;
assign n0642 = ( RD_ROM_0 == n0641 );
assign n0643 = 16'h42;
assign n0644 = ( RD_ROM_0 == n0643 );
assign n0645 = 16'h43;
assign n0646 = ( RD_ROM_0 == n0645 );
assign n0647 = 16'h44;
assign n0648 = ( RD_ROM_0 == n0647 );
assign n0649 = 16'h45;
assign n0650 = ( RD_ROM_0 == n0649 );
assign n0651 = 16'h50;
assign n0652 = ( RD_ROM_0 == n0651 );
assign n0653 = 16'h51;
assign n0654 = ( RD_ROM_0 == n0653 );
assign n0655 = 16'h52;
assign n0656 = ( RD_ROM_0 == n0655 );
assign n0657 = 16'h53;
assign n0658 = ( RD_ROM_0 == n0657 );
assign n0659 = 16'h54;
assign n0660 = ( RD_ROM_0 == n0659 );
assign n0661 = 16'h55;
assign n0662 = ( RD_ROM_0 == n0661 );
assign n0663 = 16'h60;
assign n0664 = ( RD_ROM_0 == n0663 );
assign n0665 = 16'h61;
assign n0666 = ( RD_ROM_0 == n0665 );
assign n0667 = 16'h62;
assign n0668 = ( RD_ROM_0 == n0667 );
assign n0669 = 16'h63;
assign n0670 = ( RD_ROM_0 == n0669 );
assign n0671 = 16'h64;
assign n0672 = ( RD_ROM_0 == n0671 );
assign n0673 = 16'h65;
assign n0674 = ( RD_ROM_0 == n0673 );
assign n0675 = 16'h70;
assign n0676 = ( RD_ROM_0 == n0675 );
assign n0677 = 16'h71;
assign n0678 = ( RD_ROM_0 == n0677 );
assign n0679 = 16'h72;
assign n0680 = ( RD_ROM_0 == n0679 );
assign n0681 = 16'h74;
assign n0682 = ( RD_ROM_0 == n0681 );
assign n0683 = 16'h75;
assign n0684 = ( RD_ROM_0 == n0683 );
assign n0685 = 16'h76;
assign n0686 = ( RD_ROM_0 == n0685 );
assign n0687 = 16'h77;
assign n0688 = ( RD_ROM_0 == n0687 );
assign n0689 = 16'h78;
assign n0690 = ( RD_ROM_0 == n0689 );
assign n0691 = 16'h79;
assign n0692 = ( RD_ROM_0 == n0691 );
assign n0693 = 16'h7a;
assign n0694 = ( RD_ROM_0 == n0693 );
assign n0695 = 16'h7b;
assign n0696 = ( RD_ROM_0 == n0695 );
assign n0697 = 16'h7c;
assign n0698 = ( RD_ROM_0 == n0697 );
assign n0699 = 16'h7d;
assign n0700 = ( RD_ROM_0 == n0699 );
assign n0701 = 16'h7e;
assign n0702 = ( RD_ROM_0 == n0701 );
assign n0703 = 16'h7f;
assign n0704 = ( RD_ROM_0 == n0703 );
assign n0705 = 16'h80;
assign n0706 = ( RD_ROM_0 == n0705 );
assign n0707 = 16'h81;
assign n0708 = ( RD_ROM_0 == n0707 );
assign n0709 = 16'h82;
assign n0710 = ( RD_ROM_0 == n0709 );
assign n0711 = 16'h83;
assign n0712 = ( RD_ROM_0 == n0711 );
assign n0713 = { 8'b0, ACC };
assign n0714 = ( n0713 + n0612 );
assign n0715 = 16'h85;
assign n0716 = ( RD_ROM_0 == n0715 );
assign n0717 = 16'h86;
assign n0718 = ( RD_ROM_0 == n0717 );
assign n0719 = 16'h87;
assign n0720 = ( RD_ROM_0 == n0719 );
assign n0721 = 16'h88;
assign n0722 = ( RD_ROM_0 == n0721 );
assign n0723 = 16'h89;
assign n0724 = ( RD_ROM_0 == n0723 );
assign n0725 = 16'h8a;
assign n0726 = ( RD_ROM_0 == n0725 );
assign n0727 = 16'h8b;
assign n0728 = ( RD_ROM_0 == n0727 );
assign n0729 = 16'h8c;
assign n0730 = ( RD_ROM_0 == n0729 );
assign n0731 = 16'h8d;
assign n0732 = ( RD_ROM_0 == n0731 );
assign n0733 = 16'h8e;
assign n0734 = ( RD_ROM_0 == n0733 );
assign n0735 = 16'h8f;
assign n0736 = ( RD_ROM_0 == n0735 );
assign n0737 = 16'h90;
assign n0738 = ( RD_ROM_0 == n0737 );
assign n0739 = 16'h91;
assign n0740 = ( RD_ROM_0 == n0739 );
assign n0741 = 16'h92;
assign n0742 = ( RD_ROM_0 == n0741 );
assign n0743 = 16'h93;
assign n0744 = ( RD_ROM_0 == n0743 );
assign n0745 = { ( DPH ), ( DPL ) };
assign n0746 = ( n0713 + n0745 );
assign n0747 = 16'h94;
assign n0748 = ( RD_ROM_0 == n0747 );
assign n0749 = 16'h95;
assign n0750 = ( RD_ROM_0 == n0749 );
assign n0751 = 16'ha0;
assign n0752 = ( RD_ROM_0 == n0751 );
assign n0753 = 16'ha1;
assign n0754 = ( RD_ROM_0 == n0753 );
assign n0755 = 16'ha2;
assign n0756 = ( RD_ROM_0 == n0755 );
assign n0757 = 16'ha6;
assign n0758 = ( RD_ROM_0 == n0757 );
assign n0759 = 16'ha7;
assign n0760 = ( RD_ROM_0 == n0759 );
assign n0761 = 16'ha8;
assign n0762 = ( RD_ROM_0 == n0761 );
assign n0763 = 16'ha9;
assign n0764 = ( RD_ROM_0 == n0763 );
assign n0765 = 16'haa;
assign n0766 = ( RD_ROM_0 == n0765 );
assign n0767 = 16'hab;
assign n0768 = ( RD_ROM_0 == n0767 );
assign n0769 = 16'hac;
assign n0770 = ( RD_ROM_0 == n0769 );
assign n0771 = 16'had;
assign n0772 = ( RD_ROM_0 == n0771 );
assign n0773 = 16'hae;
assign n0774 = ( RD_ROM_0 == n0773 );
assign n0775 = 16'haf;
assign n0776 = ( RD_ROM_0 == n0775 );
assign n0777 = 16'hb0;
assign n0778 = ( RD_ROM_0 == n0777 );
assign n0779 = 16'hb1;
assign n0780 = ( RD_ROM_0 == n0779 );
assign n0781 = 16'hb2;
assign n0782 = ( RD_ROM_0 == n0781 );
assign n0783 = 16'hb4;
assign n0784 = ( RD_ROM_0 == n0783 );
assign n0785 = 16'hb5;
assign n0786 = ( RD_ROM_0 == n0785 );
assign n0787 = 16'hb6;
assign n0788 = ( RD_ROM_0 == n0787 );
assign n0789 = 16'hb7;
assign n0790 = ( RD_ROM_0 == n0789 );
assign n0791 = 16'hb8;
assign n0792 = ( RD_ROM_0 == n0791 );
assign n0793 = 16'hb9;
assign n0794 = ( RD_ROM_0 == n0793 );
assign n0795 = 16'hba;
assign n0796 = ( RD_ROM_0 == n0795 );
assign n0797 = 16'hbb;
assign n0798 = ( RD_ROM_0 == n0797 );
assign n0799 = 16'hbc;
assign n0800 = ( RD_ROM_0 == n0799 );
assign n0801 = 16'hbd;
assign n0802 = ( RD_ROM_0 == n0801 );
assign n0803 = 16'hbe;
assign n0804 = ( RD_ROM_0 == n0803 );
assign n0805 = 16'hbf;
assign n0806 = ( RD_ROM_0 == n0805 );
assign n0807 = 16'hc0;
assign n0808 = ( RD_ROM_0 == n0807 );
assign n0809 = 16'hc1;
assign n0810 = ( RD_ROM_0 == n0809 );
assign n0811 = 16'hc2;
assign n0812 = ( RD_ROM_0 == n0811 );
assign n0813 = 16'hc5;
assign n0814 = ( RD_ROM_0 == n0813 );
assign n0815 = 16'hd0;
assign n0816 = ( RD_ROM_0 == n0815 );
assign n0817 = 16'hd1;
assign n0818 = ( RD_ROM_0 == n0817 );
assign n0819 = 16'hd2;
assign n0820 = ( RD_ROM_0 == n0819 );
assign n0821 = 16'hd5;
assign n0822 = ( RD_ROM_0 == n0821 );
assign n0823 = 16'hd8;
assign n0824 = ( RD_ROM_0 == n0823 );
assign n0825 = 16'hd9;
assign n0826 = ( RD_ROM_0 == n0825 );
assign n0827 = 16'hda;
assign n0828 = ( RD_ROM_0 == n0827 );
assign n0829 = 16'hdb;
assign n0830 = ( RD_ROM_0 == n0829 );
assign n0831 = 16'hdc;
assign n0832 = ( RD_ROM_0 == n0831 );
assign n0833 = 16'hdd;
assign n0834 = ( RD_ROM_0 == n0833 );
assign n0835 = 16'hde;
assign n0836 = ( RD_ROM_0 == n0835 );
assign n0837 = 16'hdf;
assign n0838 = ( RD_ROM_0 == n0837 );
assign n0839 = 16'he1;
assign n0840 = ( RD_ROM_0 == n0839 );
assign n0841 = 16'he5;
assign n0842 = ( RD_ROM_0 == n0841 );
assign n0843 = 16'hf1;
assign n0844 = ( RD_ROM_0 == n0843 );
assign n0845 = ( n0844 ) ? ( n0610 ) : ( n0612 );
assign n0846 = ( n0842 ) ? ( n0612 ) : ( n0845 );
assign n0847 = ( n0840 ) ? ( n0610 ) : ( n0846 );
assign n0848 = ( n0838 ) ? ( n0612 ) : ( n0847 );
assign n0849 = ( n0836 ) ? ( n0612 ) : ( n0848 );
assign n0850 = ( n0834 ) ? ( n0612 ) : ( n0849 );
assign n0851 = ( n0832 ) ? ( n0612 ) : ( n0850 );
assign n0852 = ( n0830 ) ? ( n0612 ) : ( n0851 );
assign n0853 = ( n0828 ) ? ( n0612 ) : ( n0852 );
assign n0854 = ( n0826 ) ? ( n0612 ) : ( n0853 );
assign n0855 = ( n0824 ) ? ( n0612 ) : ( n0854 );
assign n0856 = ( n0822 ) ? ( n0612 ) : ( n0855 );
assign n0857 = ( n0820 ) ? ( n0612 ) : ( n0856 );
assign n0858 = ( n0818 ) ? ( n0610 ) : ( n0857 );
assign n0859 = ( n0816 ) ? ( n0612 ) : ( n0858 );
assign n0860 = ( n0814 ) ? ( n0612 ) : ( n0859 );
assign n0861 = ( n0812 ) ? ( n0612 ) : ( n0860 );
assign n0862 = ( n0810 ) ? ( n0610 ) : ( n0861 );
assign n0863 = ( n0808 ) ? ( n0612 ) : ( n0862 );
assign n0864 = ( n0806 ) ? ( n0612 ) : ( n0863 );
assign n0865 = ( n0804 ) ? ( n0612 ) : ( n0864 );
assign n0866 = ( n0802 ) ? ( n0612 ) : ( n0865 );
assign n0867 = ( n0800 ) ? ( n0612 ) : ( n0866 );
assign n0868 = ( n0798 ) ? ( n0612 ) : ( n0867 );
assign n0869 = ( n0796 ) ? ( n0612 ) : ( n0868 );
assign n0870 = ( n0794 ) ? ( n0612 ) : ( n0869 );
assign n0871 = ( n0792 ) ? ( n0612 ) : ( n0870 );
assign n0872 = ( n0790 ) ? ( n0612 ) : ( n0871 );
assign n0873 = ( n0788 ) ? ( n0612 ) : ( n0872 );
assign n0874 = ( n0786 ) ? ( n0612 ) : ( n0873 );
assign n0875 = ( n0784 ) ? ( n0612 ) : ( n0874 );
assign n0876 = ( n0782 ) ? ( n0612 ) : ( n0875 );
assign n0877 = ( n0780 ) ? ( n0610 ) : ( n0876 );
assign n0878 = ( n0778 ) ? ( n0612 ) : ( n0877 );
assign n0879 = ( n0776 ) ? ( n0612 ) : ( n0878 );
assign n0880 = ( n0774 ) ? ( n0612 ) : ( n0879 );
assign n0881 = ( n0772 ) ? ( n0612 ) : ( n0880 );
assign n0882 = ( n0770 ) ? ( n0612 ) : ( n0881 );
assign n0883 = ( n0768 ) ? ( n0612 ) : ( n0882 );
assign n0884 = ( n0766 ) ? ( n0612 ) : ( n0883 );
assign n0885 = ( n0764 ) ? ( n0612 ) : ( n0884 );
assign n0886 = ( n0762 ) ? ( n0612 ) : ( n0885 );
assign n0887 = ( n0760 ) ? ( n0612 ) : ( n0886 );
assign n0888 = ( n0758 ) ? ( n0612 ) : ( n0887 );
assign n0889 = ( n0756 ) ? ( n0612 ) : ( n0888 );
assign n0890 = ( n0754 ) ? ( n0610 ) : ( n0889 );
assign n0891 = ( n0752 ) ? ( n0612 ) : ( n0890 );
assign n0892 = ( n0750 ) ? ( n0612 ) : ( n0891 );
assign n0893 = ( n0748 ) ? ( n0612 ) : ( n0892 );
assign n0894 = ( n0744 ) ? ( n0746 ) : ( n0893 );
assign n0895 = ( n0742 ) ? ( n0612 ) : ( n0894 );
assign n0896 = ( n0740 ) ? ( n0610 ) : ( n0895 );
assign n0897 = ( n0738 ) ? ( n0612 ) : ( n0896 );
assign n0898 = ( n0736 ) ? ( n0612 ) : ( n0897 );
assign n0899 = ( n0734 ) ? ( n0612 ) : ( n0898 );
assign n0900 = ( n0732 ) ? ( n0612 ) : ( n0899 );
assign n0901 = ( n0730 ) ? ( n0612 ) : ( n0900 );
assign n0902 = ( n0728 ) ? ( n0612 ) : ( n0901 );
assign n0903 = ( n0726 ) ? ( n0612 ) : ( n0902 );
assign n0904 = ( n0724 ) ? ( n0612 ) : ( n0903 );
assign n0905 = ( n0722 ) ? ( n0612 ) : ( n0904 );
assign n0906 = ( n0720 ) ? ( n0612 ) : ( n0905 );
assign n0907 = ( n0718 ) ? ( n0612 ) : ( n0906 );
assign n0908 = ( n0716 ) ? ( n0610 ) : ( n0907 );
assign n0909 = ( n0712 ) ? ( n0714 ) : ( n0908 );
assign n0910 = ( n0710 ) ? ( n0612 ) : ( n0909 );
assign n0911 = ( n0708 ) ? ( n0610 ) : ( n0910 );
assign n0912 = ( n0706 ) ? ( n0612 ) : ( n0911 );
assign n0913 = ( n0704 ) ? ( n0612 ) : ( n0912 );
assign n0914 = ( n0702 ) ? ( n0612 ) : ( n0913 );
assign n0915 = ( n0700 ) ? ( n0612 ) : ( n0914 );
assign n0916 = ( n0698 ) ? ( n0612 ) : ( n0915 );
assign n0917 = ( n0696 ) ? ( n0612 ) : ( n0916 );
assign n0918 = ( n0694 ) ? ( n0612 ) : ( n0917 );
assign n0919 = ( n0692 ) ? ( n0612 ) : ( n0918 );
assign n0920 = ( n0690 ) ? ( n0612 ) : ( n0919 );
assign n0921 = ( n0688 ) ? ( n0612 ) : ( n0920 );
assign n0922 = ( n0686 ) ? ( n0612 ) : ( n0921 );
assign n0923 = ( n0684 ) ? ( n0612 ) : ( n0922 );
assign n0924 = ( n0682 ) ? ( n0612 ) : ( n0923 );
assign n0925 = ( n0680 ) ? ( n0612 ) : ( n0924 );
assign n0926 = ( n0678 ) ? ( n0610 ) : ( n0925 );
assign n0927 = ( n0676 ) ? ( n0612 ) : ( n0926 );
assign n0928 = ( n0674 ) ? ( n0612 ) : ( n0927 );
assign n0929 = ( n0672 ) ? ( n0612 ) : ( n0928 );
assign n0930 = ( n0670 ) ? ( n0612 ) : ( n0929 );
assign n0931 = ( n0668 ) ? ( n0612 ) : ( n0930 );
assign n0932 = ( n0666 ) ? ( n0610 ) : ( n0931 );
assign n0933 = ( n0664 ) ? ( n0612 ) : ( n0932 );
assign n0934 = ( n0662 ) ? ( n0612 ) : ( n0933 );
assign n0935 = ( n0660 ) ? ( n0612 ) : ( n0934 );
assign n0936 = ( n0658 ) ? ( n0612 ) : ( n0935 );
assign n0937 = ( n0656 ) ? ( n0612 ) : ( n0936 );
assign n0938 = ( n0654 ) ? ( n0610 ) : ( n0937 );
assign n0939 = ( n0652 ) ? ( n0612 ) : ( n0938 );
assign n0940 = ( n0650 ) ? ( n0612 ) : ( n0939 );
assign n0941 = ( n0648 ) ? ( n0612 ) : ( n0940 );
assign n0942 = ( n0646 ) ? ( n0612 ) : ( n0941 );
assign n0943 = ( n0644 ) ? ( n0612 ) : ( n0942 );
assign n0944 = ( n0642 ) ? ( n0610 ) : ( n0943 );
assign n0945 = ( n0640 ) ? ( n0612 ) : ( n0944 );
assign n0946 = ( n0638 ) ? ( n0612 ) : ( n0945 );
assign n0947 = ( n0636 ) ? ( n0612 ) : ( n0946 );
assign n0948 = ( n0634 ) ? ( n0610 ) : ( n0947 );
assign n0949 = ( n0632 ) ? ( n0612 ) : ( n0948 );
assign n0950 = ( n0630 ) ? ( n0612 ) : ( n0949 );
assign n0951 = ( n0628 ) ? ( n0612 ) : ( n0950 );
assign n0952 = ( n0626 ) ? ( n0610 ) : ( n0951 );
assign n0953 = ( n0624 ) ? ( n0612 ) : ( n0952 );
assign n0954 = ( n0622 ) ? ( n0612 ) : ( n0953 );
assign n0955 = ( n0620 ) ? ( n0612 ) : ( n0954 );
assign n0956 = ( n0618 ) ? ( n0610 ) : ( n0955 );
assign n0957 = ( n0616 ) ? ( n0612 ) : ( n0956 );
assign n0958 = ( n0614 ) ? ( n0612 ) : ( n0957 );
assign n0959 = ( n0611 ) ? ( n0612 ) : ( n0958 );
assign n0960 = ( n0608 ) ? ( n0610 ) : ( n0959 );
assign RD_ROM_1_ADDR = n0960;
// RD_ROM_2_ADDR=(if (eq RD_ROM_0 (bv 1 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 2 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 16 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 17 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 18 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 32 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 33 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 48 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 49 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 65 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 67 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 81 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 83 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 97 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 99 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 113 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 117 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 129 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 133 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 144 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 145 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 161 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 177 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 180 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 181 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 182 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 183 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 184 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 185 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 186 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 187 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 188 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 189 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 190 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 191 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 193 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 209 16)) (add PC (bv 1 16)) (if (eq RD_ROM_0 (bv 213 16)) (add PC (bv 2 16)) (if (eq RD_ROM_0 (bv 225 16)) (add PC (bv 1 16)) (add PC (bv 1 16)))))))))))))))))))))))))))))))))))))))))
assign n0961 = ( n0840 ) ? ( n0612 ) : ( n0612 );
assign n0962 = ( n0822 ) ? ( n0610 ) : ( n0961 );
assign n0963 = ( n0818 ) ? ( n0612 ) : ( n0962 );
assign n0964 = ( n0810 ) ? ( n0612 ) : ( n0963 );
assign n0965 = ( n0806 ) ? ( n0610 ) : ( n0964 );
assign n0966 = ( n0804 ) ? ( n0610 ) : ( n0965 );
assign n0967 = ( n0802 ) ? ( n0610 ) : ( n0966 );
assign n0968 = ( n0800 ) ? ( n0610 ) : ( n0967 );
assign n0969 = ( n0798 ) ? ( n0610 ) : ( n0968 );
assign n0970 = ( n0796 ) ? ( n0610 ) : ( n0969 );
assign n0971 = ( n0794 ) ? ( n0610 ) : ( n0970 );
assign n0972 = ( n0792 ) ? ( n0610 ) : ( n0971 );
assign n0973 = ( n0790 ) ? ( n0610 ) : ( n0972 );
assign n0974 = ( n0788 ) ? ( n0610 ) : ( n0973 );
assign n0975 = ( n0786 ) ? ( n0610 ) : ( n0974 );
assign n0976 = ( n0784 ) ? ( n0610 ) : ( n0975 );
assign n0977 = ( n0780 ) ? ( n0612 ) : ( n0976 );
assign n0978 = ( n0754 ) ? ( n0612 ) : ( n0977 );
assign n0979 = ( n0740 ) ? ( n0612 ) : ( n0978 );
assign n0980 = ( n0738 ) ? ( n0610 ) : ( n0979 );
assign n0981 = ( n0716 ) ? ( n0612 ) : ( n0980 );
assign n0982 = ( n0708 ) ? ( n0612 ) : ( n0981 );
assign n0983 = ( n0684 ) ? ( n0610 ) : ( n0982 );
assign n0984 = ( n0678 ) ? ( n0612 ) : ( n0983 );
assign n0985 = ( n0670 ) ? ( n0610 ) : ( n0984 );
assign n0986 = ( n0666 ) ? ( n0612 ) : ( n0985 );
assign n0987 = ( n0658 ) ? ( n0610 ) : ( n0986 );
assign n0988 = ( n0654 ) ? ( n0612 ) : ( n0987 );
assign n0989 = ( n0646 ) ? ( n0610 ) : ( n0988 );
assign n0990 = ( n0642 ) ? ( n0612 ) : ( n0989 );
assign n0991 = ( n0634 ) ? ( n0612 ) : ( n0990 );
assign n0992 = ( n0632 ) ? ( n0610 ) : ( n0991 );
assign n0993 = ( n0626 ) ? ( n0612 ) : ( n0992 );
assign n0994 = ( n0624 ) ? ( n0610 ) : ( n0993 );
assign n0995 = ( n0620 ) ? ( n0610 ) : ( n0994 );
assign n0996 = ( n0618 ) ? ( n0612 ) : ( n0995 );
assign n0997 = ( n0616 ) ? ( n0610 ) : ( n0996 );
assign n0998 = ( n0611 ) ? ( n0610 ) : ( n0997 );
assign n0999 = ( n0608 ) ? ( n0612 ) : ( n0998 );
assign RD_ROM_2_ADDR = n0999;
// 
// XRAM_ADDR_00
// 
assign n1000 = 16'h0;
assign XRAM_ADDR_00 = n1000;
// 
// PC_00
// 
assign PC_00 = n0612;
// 
// XRAM_DATA_OUT_00
// 
assign n1001 = 8'h0;
assign XRAM_DATA_OUT_00 = n1001;
// 
// PSW_00
// 
assign n1002 = PSW[7:1];
assign n1003 = ACC[7:7];
assign n1004 = ACC[6:6];
assign n1005 = ACC[5:5];
assign n1006 = ACC[4:4];
assign n1007 = ACC[3:3];
assign n1008 = ACC[2:2];
assign n1009 = ACC[1:1];
assign n1010 = ACC[0:0];
assign n1011 = ( n1009 ^ n1010 );
assign n1012 = ( n1008 ^ n1011 );
assign n1013 = ( n1007 ^ n1012 );
assign n1014 = ( n1006 ^ n1013 );
assign n1015 = ( n1005 ^ n1014 );
assign n1016 = ( n1004 ^ n1015 );
assign n1017 = ( n1003 ^ n1016 );
assign n1018 = { ( n1002 ), ( n1017 ) };
assign PSW_00 = n1018;
// 
// XRAM_ADDR_01
// 
assign XRAM_ADDR_01 = n1000;
// 
// PC_01
// 
assign n1019 = n0610[15:11];
assign n1020 = { ( RD_ROM_1 ), ( RD_ROM_2 ), ( RD_ROM_0 ) };
assign n1021 = n1020[7:5];
assign n1022 = n1020[15:8];
assign n1023 = { ( n1019 ), ( n1021 ), ( n1022 ) };
assign PC_01 = n1023;
// 
// XRAM_DATA_OUT_01
// 
assign XRAM_DATA_OUT_01 = n1001;
// 
// PSW_01
// 
assign PSW_01 = n1018;
// 
// XRAM_ADDR_02
// 
assign XRAM_ADDR_02 = n1000;
// 
// PC_02
// 
assign n1024 = { ( RD_ROM_1 ), ( RD_ROM_2 ) };
assign PC_02 = n1024;
// 
// XRAM_DATA_OUT_02
// 
assign XRAM_DATA_OUT_02 = n1001;
// 
// PSW_02
// 
assign PSW_02 = n1018;
// 
// ACC_03
// 
assign n1025 = { ACC[0], ACC[7:1] };
assign ACC_03 = n1025;
// 
// XRAM_ADDR_03
// 
assign XRAM_ADDR_03 = n1000;
// 
// PC_03
// 
assign PC_03 = n0612;
// 
// XRAM_DATA_OUT_03
// 
assign XRAM_DATA_OUT_03 = n1001;
// 
// PSW_03
// 
assign n1026 = n1025[7:7];
assign n1027 = n1025[6:6];
assign n1028 = n1025[5:5];
assign n1029 = n1025[4:4];
assign n1030 = n1025[3:3];
assign n1031 = n1025[2:2];
assign n1032 = n1025[1:1];
assign n1033 = n1025[0:0];
assign n1034 = ( n1032 ^ n1033 );
assign n1035 = ( n1031 ^ n1034 );
assign n1036 = ( n1030 ^ n1035 );
assign n1037 = ( n1029 ^ n1036 );
assign n1038 = ( n1028 ^ n1037 );
assign n1039 = ( n1027 ^ n1038 );
assign n1040 = ( n1026 ^ n1039 );
assign n1041 = { ( n1002 ), ( n1040 ) };
assign PSW_03 = n1041;
// 
// ACC_04
// 
assign n1042 = ( ACC + n0574 );
assign ACC_04 = n1042;
// 
// XRAM_ADDR_04
// 
assign XRAM_ADDR_04 = n1000;
// 
// PC_04
// 
assign PC_04 = n0612;
// 
// XRAM_DATA_OUT_04
// 
assign XRAM_DATA_OUT_04 = n1001;
// 
// PSW_04
// 
assign n1043 = n1042[7:7];
assign n1044 = n1042[6:6];
assign n1045 = n1042[5:5];
assign n1046 = n1042[4:4];
assign n1047 = n1042[3:3];
assign n1048 = n1042[2:2];
assign n1049 = n1042[1:1];
assign n1050 = n1042[0:0];
assign n1051 = ( n1049 ^ n1050 );
assign n1052 = ( n1048 ^ n1051 );
assign n1053 = ( n1047 ^ n1052 );
assign n1054 = ( n1046 ^ n1053 );
assign n1055 = ( n1045 ^ n1054 );
assign n1056 = ( n1044 ^ n1055 );
assign n1057 = ( n1043 ^ n1056 );
assign n1058 = { ( n1002 ), ( n1057 ) };
assign PSW_04 = n1058;
// 
// ACC_05
// 
assign n1059 = 8'he0;
assign n1060 = ( RD_ROM_1 == n1059 );
assign n1061 = 1'h0;
assign n1062 = ( n0042 == n1061 );
assign n1063 = 8'h80;
assign n1064 = ( RD_ROM_1 == n1063 );
assign n1065 = 8'h81;
assign n1066 = ( RD_ROM_1 == n1065 );
assign n1067 = ( RD_ROM_1 == n0208 );
assign n1068 = 8'h83;
assign n1069 = ( RD_ROM_1 == n1068 );
assign n1070 = ( RD_ROM_1 == n0214 );
assign n1071 = ( RD_ROM_1 == n0216 );
assign n1072 = ( RD_ROM_1 == n0218 );
assign n1073 = ( RD_ROM_1 == n0220 );
assign n1074 = ( RD_ROM_1 == n0224 );
assign n1075 = ( RD_ROM_1 == n0222 );
assign n1076 = ( RD_ROM_1 == n0226 );
assign n1077 = 8'h90;
assign n1078 = ( RD_ROM_1 == n1077 );
assign n1079 = ( RD_ROM_1 == n0240 );
assign n1080 = ( RD_ROM_1 == n0242 );
assign n1081 = ( RD_ROM_1 == n0256 );
assign n1082 = ( RD_ROM_1 == n0264 );
assign n1083 = ( RD_ROM_1 == n0280 );
assign n1084 = ( RD_ROM_1 == n0290 );
assign n1085 = ( RD_ROM_1 == n0332 );
assign n1086 = 8'hf0;
assign n1087 = ( RD_ROM_1 == n1086 );
assign n1088 = ( n1087 ) ? ( B ) : ( n1001 );
assign n1089 = ( n1060 ) ? ( ACC ) : ( n1088 );
assign n1090 = ( n1085 ) ? ( PSW ) : ( n1089 );
assign n1091 = ( n1084 ) ? ( IP ) : ( n1090 );
assign n1092 = ( n1083 ) ? ( P3 ) : ( n1091 );
assign n1093 = ( n1082 ) ? ( IE ) : ( n1092 );
assign n1094 = ( n1081 ) ? ( P2 ) : ( n1093 );
assign n1095 = ( n1080 ) ? ( SBUF ) : ( n1094 );
assign n1096 = ( n1079 ) ? ( SCON ) : ( n1095 );
assign n1097 = ( n1078 ) ? ( P1 ) : ( n1096 );
assign n1098 = ( n1076 ) ? ( TH1 ) : ( n1097 );
assign n1099 = ( n1075 ) ? ( TL1 ) : ( n1098 );
assign n1100 = ( n1074 ) ? ( TH0 ) : ( n1099 );
assign n1101 = ( n1073 ) ? ( TL0 ) : ( n1100 );
assign n1102 = ( n1072 ) ? ( TMOD ) : ( n1101 );
assign n1103 = ( n1071 ) ? ( TCON ) : ( n1102 );
assign n1104 = ( n1070 ) ? ( PCON ) : ( n1103 );
assign n1105 = ( n1069 ) ? ( DPH ) : ( n1104 );
assign n1106 = ( n1067 ) ? ( DPL ) : ( n1105 );
assign n1107 = ( n1066 ) ? ( SP ) : ( n1106 );
assign n1108 = ( n1064 ) ? ( P0 ) : ( n1107 );
assign n1109 = ( n1062 ) ? ( RD_IRAM_0 ) : ( n1108 );
assign n1110 = ( n1109 + n0574 );
assign n1111 = ( n1060 ) ? ( n1110 ) : ( ACC );
assign ACC_05 = n1111;
// 
// B_05
// 
assign n1112 = ( n1087 ) ? ( n1110 ) : ( B );
assign B_05 = n1112;
// 
// DPL_05
// 
assign n1113 = ( n1067 ) ? ( n1110 ) : ( DPL );
assign DPL_05 = n1113;
// 
// DPH_05
// 
assign n1114 = ( n1069 ) ? ( n1110 ) : ( DPH );
assign DPH_05 = n1114;
// 
// XRAM_ADDR_05
// 
assign XRAM_ADDR_05 = n1000;
// 
// PC_05
// 
assign PC_05 = n0610;
// 
// P2_05
// 
assign n1115 = ( n1081 ) ? ( n1110 ) : ( P2 );
assign P2_05 = n1115;
// 
// P3_05
// 
assign n1116 = ( n1083 ) ? ( n1110 ) : ( P3 );
assign P3_05 = n1116;
// 
// P0_05
// 
assign n1117 = ( n1064 ) ? ( n1110 ) : ( P0 );
assign P0_05 = n1117;
// 
// P1_05
// 
assign n1118 = ( n1078 ) ? ( n1110 ) : ( P1 );
assign P1_05 = n1118;
// 
// IRAM_05
// 
assign n1119 = RD_ROM_1[3:0];
// 
// XRAM_DATA_OUT_05
// 
assign XRAM_DATA_OUT_05 = n1001;
// 
// SP_05
// 
assign n1120 = ( n1066 ) ? ( n1110 ) : ( SP );
assign SP_05 = n1120;
// 
// PSW_05
// 
assign n1121 = ( n1085 ) ? ( n1110 ) : ( PSW );
assign n1122 = n1121[7:1];
assign n1123 = n1111[7:7];
assign n1124 = n1111[6:6];
assign n1125 = n1111[5:5];
assign n1126 = n1111[4:4];
assign n1127 = n1111[3:3];
assign n1128 = n1111[2:2];
assign n1129 = n1111[1:1];
assign n1130 = n1111[0:0];
assign n1131 = ( n1129 ^ n1130 );
assign n1132 = ( n1128 ^ n1131 );
assign n1133 = ( n1127 ^ n1132 );
assign n1134 = ( n1126 ^ n1133 );
assign n1135 = ( n1125 ^ n1134 );
assign n1136 = ( n1124 ^ n1135 );
assign n1137 = ( n1123 ^ n1136 );
assign n1138 = { ( n1122 ), ( n1137 ) };
assign PSW_05 = n1138;
// 
// XRAM_ADDR_06
// 
assign XRAM_ADDR_06 = n1000;
// 
// PC_06
// 
assign PC_06 = n0612;
// 
// IRAM_06
// 
assign n1139 = RD_IRAM_0[3:0];
assign n1140 = ( RD_IRAM_1 + n0574 );
// 
// XRAM_DATA_OUT_06
// 
assign XRAM_DATA_OUT_06 = n1001;
// 
// PSW_06
// 
assign PSW_06 = n1018;
// 
// XRAM_ADDR_07
// 
assign XRAM_ADDR_07 = n1000;
// 
// PC_07
// 
assign PC_07 = n0612;
// 
// IRAM_07
// 
// 
// XRAM_DATA_OUT_07
// 
assign XRAM_DATA_OUT_07 = n1001;
// 
// PSW_07
// 
assign PSW_07 = n1018;
// 
// XRAM_ADDR_08
// 
assign XRAM_ADDR_08 = n1000;
// 
// PC_08
// 
assign PC_08 = n0612;
// 
// IRAM_08
// 
assign n1141 = n0007[3:0];
assign n1142 = ( RD_IRAM_0 + n0574 );
// 
// XRAM_DATA_OUT_08
// 
assign XRAM_DATA_OUT_08 = n1001;
// 
// PSW_08
// 
assign PSW_08 = n1018;
// 
// XRAM_ADDR_09
// 
assign XRAM_ADDR_09 = n1000;
// 
// PC_09
// 
assign PC_09 = n0612;
// 
// IRAM_09
// 
assign n1143 = n0011[3:0];
// 
// XRAM_DATA_OUT_09
// 
assign XRAM_DATA_OUT_09 = n1001;
// 
// PSW_09
// 
assign PSW_09 = n1018;
// 
// XRAM_ADDR_0a
// 
assign XRAM_ADDR_0a = n1000;
// 
// PC_0a
// 
assign PC_0a = n0612;
// 
// IRAM_0a
// 
assign n1144 = n0019[3:0];
// 
// XRAM_DATA_OUT_0a
// 
assign XRAM_DATA_OUT_0a = n1001;
// 
// PSW_0a
// 
assign PSW_0a = n1018;
// 
// XRAM_ADDR_0b
// 
assign XRAM_ADDR_0b = n1000;
// 
// PC_0b
// 
assign PC_0b = n0612;
// 
// IRAM_0b
// 
assign n1145 = n0023[3:0];
// 
// XRAM_DATA_OUT_0b
// 
assign XRAM_DATA_OUT_0b = n1001;
// 
// PSW_0b
// 
assign PSW_0b = n1018;
// 
// XRAM_ADDR_0c
// 
assign XRAM_ADDR_0c = n1000;
// 
// PC_0c
// 
assign PC_0c = n0612;
// 
// IRAM_0c
// 
assign n1146 = n0027[3:0];
// 
// XRAM_DATA_OUT_0c
// 
assign XRAM_DATA_OUT_0c = n1001;
// 
// PSW_0c
// 
assign PSW_0c = n1018;
// 
// XRAM_ADDR_0d
// 
assign XRAM_ADDR_0d = n1000;
// 
// PC_0d
// 
assign PC_0d = n0612;
// 
// IRAM_0d
// 
assign n1147 = n0031[3:0];
// 
// XRAM_DATA_OUT_0d
// 
assign XRAM_DATA_OUT_0d = n1001;
// 
// PSW_0d
// 
assign PSW_0d = n1018;
// 
// XRAM_ADDR_0e
// 
assign XRAM_ADDR_0e = n1000;
// 
// PC_0e
// 
assign PC_0e = n0612;
// 
// IRAM_0e
// 
assign n1148 = n0035[3:0];
// 
// XRAM_DATA_OUT_0e
// 
assign XRAM_DATA_OUT_0e = n1001;
// 
// PSW_0e
// 
assign PSW_0e = n1018;
// 
// XRAM_ADDR_0f
// 
assign XRAM_ADDR_0f = n1000;
// 
// PC_0f
// 
assign PC_0f = n0612;
// 
// IRAM_0f
// 
assign n1149 = n0039[3:0];
// 
// XRAM_DATA_OUT_0f
// 
assign XRAM_DATA_OUT_0f = n1001;
// 
// PSW_0f
// 
assign PSW_0f = n1018;
// 
// ACC_10
// 
assign n1150 = ( n0050 == n1059 );
assign n1151 = RD_ROM_1[2:0];
assign n1152 = { 5'b0, n1151 };
assign n1153 = ( n0574 << n1152 );
assign n1154 = ~( n1153 );
assign n1155 = n0050[7:7];
assign n1156 = ( n1155 == n1061 );
assign n1157 = ( n0050 == n1063 );
assign n1158 = ( n0050 == n0216 );
assign n1159 = ( n0050 == n1077 );
assign n1160 = ( n0050 == n0240 );
assign n1161 = ( n0050 == n0256 );
assign n1162 = ( n0050 == n0264 );
assign n1163 = ( n0050 == n0280 );
assign n1164 = ( n0050 == n0290 );
assign n1165 = ( n0050 == n0332 );
assign n1166 = ( n0050 == n1086 );
assign n1167 = ( n1166 ) ? ( B ) : ( n1001 );
assign n1168 = ( n1150 ) ? ( ACC ) : ( n1167 );
assign n1169 = ( n1165 ) ? ( PSW ) : ( n1168 );
assign n1170 = ( n1164 ) ? ( IP ) : ( n1169 );
assign n1171 = ( n1163 ) ? ( P3INREG ) : ( n1170 );
assign n1172 = ( n1162 ) ? ( IE ) : ( n1171 );
assign n1173 = ( n1161 ) ? ( P2INREG ) : ( n1172 );
assign n1174 = ( n1160 ) ? ( SCON ) : ( n1173 );
assign n1175 = ( n1159 ) ? ( P1INREG ) : ( n1174 );
assign n1176 = ( n1158 ) ? ( TCON ) : ( n1175 );
assign n1177 = ( n1157 ) ? ( P0INREG ) : ( n1176 );
assign n1178 = ( n1156 ) ? ( RD_IRAM_0 ) : ( n1177 );
assign n1179 = ( n1154 & n1178 );
assign n1180 = { 7'b0, n1061 };
assign n1181 = ( n1180 << n1152 );
assign n1182 = ( n1179 | n1181 );
assign n1183 = ( n1150 ) ? ( n1182 ) : ( ACC );
assign ACC_10 = n1183;
// 
// P1_10
// 
assign n1184 = ( n1163 ) ? ( P3 ) : ( n1170 );
assign n1185 = ( n1162 ) ? ( IE ) : ( n1184 );
assign n1186 = ( n1161 ) ? ( P2 ) : ( n1185 );
assign n1187 = ( n1160 ) ? ( SCON ) : ( n1186 );
assign n1188 = ( n1159 ) ? ( P1 ) : ( n1187 );
assign n1189 = ( n1158 ) ? ( TCON ) : ( n1188 );
assign n1190 = ( n1157 ) ? ( P0 ) : ( n1189 );
assign n1191 = ( n1156 ) ? ( RD_IRAM_0 ) : ( n1190 );
assign n1192 = ( n1154 & n1191 );
assign n1193 = ( n1192 | n1181 );
assign n1194 = ( n1159 ) ? ( n1193 ) : ( P1 );
assign P1_10 = n1194;
// 
// XRAM_ADDR_10
// 
assign XRAM_ADDR_10 = n1000;
// 
// PC_10
// 
assign n1195 = n1178[n1151];
assign n1196 = ( n1195 == n0043 );
assign n1197 = 16'h3;
assign n1198 = ( PC + n1197 );
assign n1199 = { RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2[7], RD_ROM_2 };
assign n1200 = ( n1198 + n1199 );
assign n1201 = ( n1196 ) ? ( n1200 ) : ( n1198 );
assign PC_10 = n1201;
// 
// P2_10
// 
assign n1202 = ( n1161 ) ? ( n1193 ) : ( P2 );
assign P2_10 = n1202;
// 
// P3_10
// 
assign n1203 = ( n1163 ) ? ( n1193 ) : ( P3 );
assign P3_10 = n1203;
// 
// P0_10
// 
assign n1204 = ( n1157 ) ? ( n1193 ) : ( P0 );
assign P0_10 = n1204;
// 
// B_10
// 
assign n1205 = ( n1166 ) ? ( n1182 ) : ( B );
assign B_10 = n1205;
// 
// IRAM_10
// 
assign n1206 = n0050[3:0];
// 
// XRAM_DATA_OUT_10
// 
assign XRAM_DATA_OUT_10 = n1001;
// 
// PSW_10
// 
assign n1207 = ( n1165 ) ? ( n1182 ) : ( PSW );
assign n1208 = n1207[7:1];
assign n1209 = n1183[7:7];
assign n1210 = n1183[6:6];
assign n1211 = n1183[5:5];
assign n1212 = n1183[4:4];
assign n1213 = n1183[3:3];
assign n1214 = n1183[2:2];
assign n1215 = n1183[1:1];
assign n1216 = n1183[0:0];
assign n1217 = ( n1215 ^ n1216 );
assign n1218 = ( n1214 ^ n1217 );
assign n1219 = ( n1213 ^ n1218 );
assign n1220 = ( n1212 ^ n1219 );
assign n1221 = ( n1211 ^ n1220 );
assign n1222 = ( n1210 ^ n1221 );
assign n1223 = ( n1209 ^ n1222 );
assign n1224 = { ( n1208 ), ( n1223 ) };
assign PSW_10 = n1224;
// 
// XRAM_ADDR_11
// 
assign XRAM_ADDR_11 = n1000;
// 
// PC_11
// 
assign n1225 = n1020[3:1];
assign n1226 = { ( n1019 ), ( n1225 ), ( n1022 ) };
assign PC_11 = n1226;
// 
// IRAM_11
// 
assign n1227 = ( SP + n0574 );
assign n1228 = n1227[3:0];
assign n1229 = n0610[7:0];
assign n1230 = ( n1227 + n0574 );
assign n1231 = n1230[3:0];
assign n1232 = n0610[15:8];
// 
// XRAM_DATA_OUT_11
// 
assign XRAM_DATA_OUT_11 = n1001;
// 
// SP_11
// 
assign n1233 = 8'h2;
assign n1234 = ( SP + n1233 );
assign SP_11 = n1234;
// 
// PSW_11
// 
assign PSW_11 = n1018;
// 
// XRAM_ADDR_12
// 
assign XRAM_ADDR_12 = n1000;
// 
// PC_12
// 
assign PC_12 = n1024;
// 
// IRAM_12
// 
assign n1235 = n1198[7:0];
assign n1236 = n1198[15:8];
// 
// XRAM_DATA_OUT_12
// 
assign XRAM_DATA_OUT_12 = n1001;
// 
// SP_12
// 
assign SP_12 = n1234;
// 
// PSW_12
// 
assign PSW_12 = n1018;
// 
// ACC_13
// 
assign n1237 = PSW[7:7];
assign n1238 = { ( ACC ), ( n1237 ) };
assign n1239 = { n1238[0], n1238[8:1] };
assign n1240 = n1239[8:1];
assign ACC_13 = n1240;
// 
// XRAM_ADDR_13
// 
assign XRAM_ADDR_13 = n1000;
// 
// PC_13
// 
assign PC_13 = n0612;
// 
// XRAM_DATA_OUT_13
// 
assign XRAM_DATA_OUT_13 = n1001;
// 
// PSW_13
// 
assign n1241 = PSW[6:6];
assign n1242 = PSW[5:3];
assign n1243 = PSW[2:2];
assign n1244 = PSW[1:0];
assign n1245 = { ( n1010 ), ( n1241 ), ( n1242 ), ( n1243 ), ( n1244 ) };
assign n1246 = n1245[7:1];
assign n1247 = n1240[7:7];
assign n1248 = n1240[6:6];
assign n1249 = n1240[5:5];
assign n1250 = n1240[4:4];
assign n1251 = n1240[3:3];
assign n1252 = n1240[2:2];
assign n1253 = n1240[1:1];
assign n1254 = n1240[0:0];
assign n1255 = ( n1253 ^ n1254 );
assign n1256 = ( n1252 ^ n1255 );
assign n1257 = ( n1251 ^ n1256 );
assign n1258 = ( n1250 ^ n1257 );
assign n1259 = ( n1249 ^ n1258 );
assign n1260 = ( n1248 ^ n1259 );
assign n1261 = ( n1247 ^ n1260 );
assign n1262 = { ( n1246 ), ( n1261 ) };
assign PSW_13 = n1262;
// 
// ACC_14
// 
assign n1263 = ( ACC - n0574 );
assign ACC_14 = n1263;
// 
// XRAM_ADDR_14
// 
assign XRAM_ADDR_14 = n1000;
// 
// PC_14
// 
assign PC_14 = n0612;
// 
// XRAM_DATA_OUT_14
// 
assign XRAM_DATA_OUT_14 = n1001;
// 
// PSW_14
// 
assign n1264 = n1263[7:7];
assign n1265 = n1263[6:6];
assign n1266 = n1263[5:5];
assign n1267 = n1263[4:4];
assign n1268 = n1263[3:3];
assign n1269 = n1263[2:2];
assign n1270 = n1263[1:1];
assign n1271 = n1263[0:0];
assign n1272 = ( n1270 ^ n1271 );
assign n1273 = ( n1269 ^ n1272 );
assign n1274 = ( n1268 ^ n1273 );
assign n1275 = ( n1267 ^ n1274 );
assign n1276 = ( n1266 ^ n1275 );
assign n1277 = ( n1265 ^ n1276 );
assign n1278 = ( n1264 ^ n1277 );
assign n1279 = { ( n1002 ), ( n1278 ) };
assign PSW_14 = n1279;
// 
// ACC_15
// 
assign n1280 = ( n1109 - n0574 );
assign n1281 = ( n1060 ) ? ( n1280 ) : ( ACC );
assign ACC_15 = n1281;
// 
// P1_15
// 
assign n1282 = ( n1078 ) ? ( n1280 ) : ( P1 );
assign P1_15 = n1282;
// 
// DPL_15
// 
assign n1283 = ( n1067 ) ? ( n1280 ) : ( DPL );
assign DPL_15 = n1283;
// 
// DPH_15
// 
assign n1284 = ( n1069 ) ? ( n1280 ) : ( DPH );
assign DPH_15 = n1284;
// 
// XRAM_ADDR_15
// 
assign XRAM_ADDR_15 = n1000;
// 
// PC_15
// 
assign PC_15 = n0610;
// 
// P2_15
// 
assign n1285 = ( n1081 ) ? ( n1280 ) : ( P2 );
assign P2_15 = n1285;
// 
// P3_15
// 
assign n1286 = ( n1083 ) ? ( n1280 ) : ( P3 );
assign P3_15 = n1286;
// 
// P0_15
// 
assign n1287 = ( n1064 ) ? ( n1280 ) : ( P0 );
assign P0_15 = n1287;
// 
// B_15
// 
assign n1288 = ( n1087 ) ? ( n1280 ) : ( B );
assign B_15 = n1288;
// 
// IRAM_15
// 
// 
// XRAM_DATA_OUT_15
// 
assign XRAM_DATA_OUT_15 = n1001;
// 
// SP_15
// 
assign n1289 = ( n1066 ) ? ( n1280 ) : ( SP );
assign SP_15 = n1289;
// 
// PSW_15
// 
assign n1290 = ( n1085 ) ? ( n1280 ) : ( PSW );
assign n1291 = n1290[7:1];
assign n1292 = n1281[7:7];
assign n1293 = n1281[6:6];
assign n1294 = n1281[5:5];
assign n1295 = n1281[4:4];
assign n1296 = n1281[3:3];
assign n1297 = n1281[2:2];
assign n1298 = n1281[1:1];
assign n1299 = n1281[0:0];
assign n1300 = ( n1298 ^ n1299 );
assign n1301 = ( n1297 ^ n1300 );
assign n1302 = ( n1296 ^ n1301 );
assign n1303 = ( n1295 ^ n1302 );
assign n1304 = ( n1294 ^ n1303 );
assign n1305 = ( n1293 ^ n1304 );
assign n1306 = ( n1292 ^ n1305 );
assign n1307 = { ( n1291 ), ( n1306 ) };
assign PSW_15 = n1307;
// 
// XRAM_ADDR_16
// 
assign XRAM_ADDR_16 = n1000;
// 
// PC_16
// 
assign PC_16 = n0612;
// 
// IRAM_16
// 
assign n1308 = ( RD_IRAM_1 - n0574 );
// 
// XRAM_DATA_OUT_16
// 
assign XRAM_DATA_OUT_16 = n1001;
// 
// PSW_16
// 
assign PSW_16 = n1018;
// 
// XRAM_ADDR_17
// 
assign XRAM_ADDR_17 = n1000;
// 
// PC_17
// 
assign PC_17 = n0612;
// 
// IRAM_17
// 
// 
// XRAM_DATA_OUT_17
// 
assign XRAM_DATA_OUT_17 = n1001;
// 
// PSW_17
// 
assign PSW_17 = n1018;
// 
// XRAM_ADDR_18
// 
assign XRAM_ADDR_18 = n1000;
// 
// PC_18
// 
assign PC_18 = n0612;
// 
// IRAM_18
// 
assign n1309 = ( RD_IRAM_0 - n0574 );
// 
// XRAM_DATA_OUT_18
// 
assign XRAM_DATA_OUT_18 = n1001;
// 
// PSW_18
// 
assign PSW_18 = n1018;
// 
// XRAM_ADDR_19
// 
assign XRAM_ADDR_19 = n1000;
// 
// PC_19
// 
assign PC_19 = n0612;
// 
// IRAM_19
// 
// 
// XRAM_DATA_OUT_19
// 
assign XRAM_DATA_OUT_19 = n1001;
// 
// PSW_19
// 
assign PSW_19 = n1018;
// 
// XRAM_ADDR_1a
// 
assign XRAM_ADDR_1a = n1000;
// 
// PC_1a
// 
assign PC_1a = n0612;
// 
// IRAM_1a
// 
// 
// XRAM_DATA_OUT_1a
// 
assign XRAM_DATA_OUT_1a = n1001;
// 
// PSW_1a
// 
assign PSW_1a = n1018;
// 
// XRAM_ADDR_1b
// 
assign XRAM_ADDR_1b = n1000;
// 
// PC_1b
// 
assign PC_1b = n0612;
// 
// IRAM_1b
// 
// 
// XRAM_DATA_OUT_1b
// 
assign XRAM_DATA_OUT_1b = n1001;
// 
// PSW_1b
// 
assign PSW_1b = n1018;
// 
// XRAM_ADDR_1c
// 
assign XRAM_ADDR_1c = n1000;
// 
// PC_1c
// 
assign PC_1c = n0612;
// 
// IRAM_1c
// 
// 
// XRAM_DATA_OUT_1c
// 
assign XRAM_DATA_OUT_1c = n1001;
// 
// PSW_1c
// 
assign PSW_1c = n1018;
// 
// XRAM_ADDR_1d
// 
assign XRAM_ADDR_1d = n1000;
// 
// PC_1d
// 
assign PC_1d = n0612;
// 
// IRAM_1d
// 
// 
// XRAM_DATA_OUT_1d
// 
assign XRAM_DATA_OUT_1d = n1001;
// 
// PSW_1d
// 
assign PSW_1d = n1018;
// 
// XRAM_ADDR_1e
// 
assign XRAM_ADDR_1e = n1000;
// 
// PC_1e
// 
assign PC_1e = n0612;
// 
// IRAM_1e
// 
// 
// XRAM_DATA_OUT_1e
// 
assign XRAM_DATA_OUT_1e = n1001;
// 
// PSW_1e
// 
assign PSW_1e = n1018;
// 
// XRAM_ADDR_1f
// 
assign XRAM_ADDR_1f = n1000;
// 
// PC_1f
// 
assign PC_1f = n0612;
// 
// IRAM_1f
// 
// 
// XRAM_DATA_OUT_1f
// 
assign XRAM_DATA_OUT_1f = n1001;
// 
// PSW_1f
// 
assign PSW_1f = n1018;
// 
// XRAM_ADDR_20
// 
assign XRAM_ADDR_20 = n1000;
// 
// PC_20
// 
assign PC_20 = n1201;
// 
// XRAM_DATA_OUT_20
// 
assign XRAM_DATA_OUT_20 = n1001;
// 
// PSW_20
// 
assign PSW_20 = n1018;
// 
// XRAM_ADDR_21
// 
assign XRAM_ADDR_21 = n1000;
// 
// PC_21
// 
assign PC_21 = n1023;
// 
// XRAM_DATA_OUT_21
// 
assign XRAM_DATA_OUT_21 = n1001;
// 
// PSW_21
// 
assign PSW_21 = n1018;
// 
// XRAM_ADDR_22
// 
assign XRAM_ADDR_22 = n1000;
// 
// PC_22
// 
assign n1310 = { ( RD_IRAM_0 ), ( RD_IRAM_1 ) };
assign PC_22 = n1310;
// 
// XRAM_DATA_OUT_22
// 
assign XRAM_DATA_OUT_22 = n1001;
// 
// SP_22
// 
assign n1311 = ( SP - n1233 );
assign SP_22 = n1311;
// 
// PSW_22
// 
assign PSW_22 = n1018;
// 
// ACC_23
// 
assign n1312 = { ACC[6:0], ACC[7] };
assign ACC_23 = n1312;
// 
// XRAM_ADDR_23
// 
assign XRAM_ADDR_23 = n1000;
// 
// PC_23
// 
assign PC_23 = n0612;
// 
// XRAM_DATA_OUT_23
// 
assign XRAM_DATA_OUT_23 = n1001;
// 
// PSW_23
// 
assign n1313 = n1312[7:7];
assign n1314 = n1312[6:6];
assign n1315 = n1312[5:5];
assign n1316 = n1312[4:4];
assign n1317 = n1312[3:3];
assign n1318 = n1312[2:2];
assign n1319 = n1312[1:1];
assign n1320 = n1312[0:0];
assign n1321 = ( n1319 ^ n1320 );
assign n1322 = ( n1318 ^ n1321 );
assign n1323 = ( n1317 ^ n1322 );
assign n1324 = ( n1316 ^ n1323 );
assign n1325 = ( n1315 ^ n1324 );
assign n1326 = ( n1314 ^ n1325 );
assign n1327 = ( n1313 ^ n1326 );
assign n1328 = { ( n1002 ), ( n1327 ) };
assign PSW_23 = n1328;
// 
// ACC_24
// 
assign n1329 = ( ACC + RD_ROM_1 );
assign ACC_24 = n1329;
// 
// XRAM_ADDR_24
// 
assign XRAM_ADDR_24 = n1000;
// 
// PC_24
// 
assign PC_24 = n0610;
// 
// XRAM_DATA_OUT_24
// 
assign XRAM_DATA_OUT_24 = n1001;
// 
// PSW_24
// 
assign n1330 = { 1'b0, ACC };
assign n1331 = { 1'b0, RD_ROM_1 };
assign n1332 = { n1061[0], n1061[0], n1061[0], n1061[0], n1061[0], n1061[0], n1061[0], n1061[0], n1061 };
assign n1333 = ( n1331 + n1332 );
assign n1334 = ( n1330 + n1333 );
assign n1335 = n1334[8:8];
assign n1336 = ACC[3:0];
assign n1337 = { 1'b0, n1336 };
assign n1338 = { 1'b0, n1119 };
assign n1339 = { 4'b0, n1061 };
assign n1340 = ( n1338 + n1339 );
assign n1341 = ( n1337 + n1340 );
assign n1342 = n1341[4:4];
assign n1343 = { ACC[7], ACC };
assign n1344 = { RD_ROM_1[7], RD_ROM_1 };
assign n1345 = ( n1344 + n1332 );
assign n1346 = ( n1343 + n1345 );
assign n1347 = n1346[8:8];
assign n1348 = n1346[7:7];
assign n1349 = ( n1347 == n1348 );
assign n1350 = !( n1349 );
assign n1351 = ( n1350 ) ? ( n0043 ) : ( n1061 );
assign n1352 = { ( n1335 ), ( n1342 ), ( n1242 ), ( n1351 ), ( n1244 ) };
assign n1353 = n1352[7:1];
assign n1354 = n1329[7:7];
assign n1355 = n1329[6:6];
assign n1356 = n1329[5:5];
assign n1357 = n1329[4:4];
assign n1358 = n1329[3:3];
assign n1359 = n1329[2:2];
assign n1360 = n1329[1:1];
assign n1361 = n1329[0:0];
assign n1362 = ( n1360 ^ n1361 );
assign n1363 = ( n1359 ^ n1362 );
assign n1364 = ( n1358 ^ n1363 );
assign n1365 = ( n1357 ^ n1364 );
assign n1366 = ( n1356 ^ n1365 );
assign n1367 = ( n1355 ^ n1366 );
assign n1368 = ( n1354 ^ n1367 );
assign n1369 = { ( n1353 ), ( n1368 ) };
assign PSW_24 = n1369;
// 
// ACC_25
// 
assign n1370 = ( n1083 ) ? ( P3INREG ) : ( n1091 );
assign n1371 = ( n1082 ) ? ( IE ) : ( n1370 );
assign n1372 = ( n1081 ) ? ( P2INREG ) : ( n1371 );
assign n1373 = ( n1080 ) ? ( SBUF ) : ( n1372 );
assign n1374 = ( n1079 ) ? ( SCON ) : ( n1373 );
assign n1375 = ( n1078 ) ? ( P1INREG ) : ( n1374 );
assign n1376 = ( n1076 ) ? ( TH1 ) : ( n1375 );
assign n1377 = ( n1075 ) ? ( TL1 ) : ( n1376 );
assign n1378 = ( n1074 ) ? ( TH0 ) : ( n1377 );
assign n1379 = ( n1073 ) ? ( TL0 ) : ( n1378 );
assign n1380 = ( n1072 ) ? ( TMOD ) : ( n1379 );
assign n1381 = ( n1071 ) ? ( TCON ) : ( n1380 );
assign n1382 = ( n1070 ) ? ( PCON ) : ( n1381 );
assign n1383 = ( n1069 ) ? ( DPH ) : ( n1382 );
assign n1384 = ( n1067 ) ? ( DPL ) : ( n1383 );
assign n1385 = ( n1066 ) ? ( SP ) : ( n1384 );
assign n1386 = ( n1064 ) ? ( P0INREG ) : ( n1385 );
assign n1387 = ( n1062 ) ? ( RD_IRAM_0 ) : ( n1386 );
assign n1388 = ( ACC + n1387 );
assign ACC_25 = n1388;
// 
// XRAM_ADDR_25
// 
assign XRAM_ADDR_25 = n1000;
// 
// PC_25
// 
assign PC_25 = n0610;
// 
// XRAM_DATA_OUT_25
// 
assign XRAM_DATA_OUT_25 = n1001;
// 
// PSW_25
// 
assign n1389 = { 1'b0, n1387 };
assign n1390 = { 8'b0, n1061 };
assign n1391 = ( n1389 + n1390 );
assign n1392 = ( n1330 + n1391 );
assign n1393 = n1392[8:8];
assign n1394 = n1387[3:0];
assign n1395 = { 1'b0, n1394 };
assign n1396 = { n1061[0], n1061[0], n1061[0], n1061[0], n1061 };
assign n1397 = ( n1395 + n1396 );
assign n1398 = ( n1337 + n1397 );
assign n1399 = n1398[4:4];
assign n1400 = { n1387[7], n1387 };
assign n1401 = ( n1400 + n1390 );
assign n1402 = ( n1343 + n1401 );
assign n1403 = n1402[8:8];
assign n1404 = n1402[7:7];
assign n1405 = ( n1403 == n1404 );
assign n1406 = !( n1405 );
assign n1407 = ( n1406 ) ? ( n0043 ) : ( n1061 );
assign n1408 = { ( n1393 ), ( n1399 ), ( n1242 ), ( n1407 ), ( n1244 ) };
assign n1409 = n1408[7:1];
assign n1410 = n1388[7:7];
assign n1411 = n1388[6:6];
assign n1412 = n1388[5:5];
assign n1413 = n1388[4:4];
assign n1414 = n1388[3:3];
assign n1415 = n1388[2:2];
assign n1416 = n1388[1:1];
assign n1417 = n1388[0:0];
assign n1418 = ( n1416 ^ n1417 );
assign n1419 = ( n1415 ^ n1418 );
assign n1420 = ( n1414 ^ n1419 );
assign n1421 = ( n1413 ^ n1420 );
assign n1422 = ( n1412 ^ n1421 );
assign n1423 = ( n1411 ^ n1422 );
assign n1424 = ( n1410 ^ n1423 );
assign n1425 = { ( n1409 ), ( n1424 ) };
assign PSW_25 = n1425;
// 
// ACC_26
// 
assign n1426 = ( ACC + RD_IRAM_1 );
assign ACC_26 = n1426;
// 
// XRAM_ADDR_26
// 
assign XRAM_ADDR_26 = n1000;
// 
// PC_26
// 
assign PC_26 = n0612;
// 
// XRAM_DATA_OUT_26
// 
assign XRAM_DATA_OUT_26 = n1001;
// 
// PSW_26
// 
assign n1427 = { 1'b0, RD_IRAM_1 };
assign n1428 = ( n1427 + n1332 );
assign n1429 = ( n1330 + n1428 );
assign n1430 = n1429[8:8];
assign n1431 = RD_IRAM_1[3:0];
assign n1432 = { 1'b0, n1431 };
assign n1433 = ( n1432 + n1396 );
assign n1434 = ( n1337 + n1433 );
assign n1435 = n1434[4:4];
assign n1436 = { RD_IRAM_1[7], RD_IRAM_1 };
assign n1437 = ( n1436 + n1332 );
assign n1438 = ( n1343 + n1437 );
assign n1439 = n1438[8:8];
assign n1440 = n1438[7:7];
assign n1441 = ( n1439 == n1440 );
assign n1442 = !( n1441 );
assign n1443 = ( n1442 ) ? ( n0043 ) : ( n1061 );
assign n1444 = { ( n1430 ), ( n1435 ), ( n1242 ), ( n1443 ), ( n1244 ) };
assign n1445 = n1444[7:1];
assign n1446 = n1426[7:7];
assign n1447 = n1426[6:6];
assign n1448 = n1426[5:5];
assign n1449 = n1426[4:4];
assign n1450 = n1426[3:3];
assign n1451 = n1426[2:2];
assign n1452 = n1426[1:1];
assign n1453 = n1426[0:0];
assign n1454 = ( n1452 ^ n1453 );
assign n1455 = ( n1451 ^ n1454 );
assign n1456 = ( n1450 ^ n1455 );
assign n1457 = ( n1449 ^ n1456 );
assign n1458 = ( n1448 ^ n1457 );
assign n1459 = ( n1447 ^ n1458 );
assign n1460 = ( n1446 ^ n1459 );
assign n1461 = { ( n1445 ), ( n1460 ) };
assign PSW_26 = n1461;
// 
// ACC_27
// 
assign ACC_27 = n1426;
// 
// XRAM_ADDR_27
// 
assign XRAM_ADDR_27 = n1000;
// 
// PC_27
// 
assign PC_27 = n0612;
// 
// XRAM_DATA_OUT_27
// 
assign XRAM_DATA_OUT_27 = n1001;
// 
// PSW_27
// 
assign n1462 = ( n1427 + n1390 );
assign n1463 = ( n1330 + n1462 );
assign n1464 = n1463[8:8];
assign n1465 = ( n1436 + n1390 );
assign n1466 = ( n1343 + n1465 );
assign n1467 = n1466[8:8];
assign n1468 = n1466[7:7];
assign n1469 = ( n1467 == n1468 );
assign n1470 = !( n1469 );
assign n1471 = ( n1470 ) ? ( n0043 ) : ( n1061 );
assign n1472 = { ( n1464 ), ( n1435 ), ( n1242 ), ( n1471 ), ( n1244 ) };
assign n1473 = n1472[7:1];
assign n1474 = { ( n1473 ), ( n1460 ) };
assign PSW_27 = n1474;
// 
// ACC_28
// 
assign n1475 = ( ACC + RD_IRAM_0 );
assign ACC_28 = n1475;
// 
// XRAM_ADDR_28
// 
assign XRAM_ADDR_28 = n1000;
// 
// PC_28
// 
assign PC_28 = n0612;
// 
// XRAM_DATA_OUT_28
// 
assign XRAM_DATA_OUT_28 = n1001;
// 
// PSW_28
// 
assign n1476 = { 1'b0, RD_IRAM_0 };
assign n1477 = ( n1476 + n1332 );
assign n1478 = ( n1330 + n1477 );
assign n1479 = n1478[8:8];
assign n1480 = { 1'b0, n1139 };
assign n1481 = ( n1480 + n1396 );
assign n1482 = ( n1337 + n1481 );
assign n1483 = n1482[4:4];
assign n1484 = { RD_IRAM_0[7], RD_IRAM_0 };
assign n1485 = ( n1484 + n1332 );
assign n1486 = ( n1343 + n1485 );
assign n1487 = n1486[8:8];
assign n1488 = n1486[7:7];
assign n1489 = ( n1487 == n1488 );
assign n1490 = !( n1489 );
assign n1491 = ( n1490 ) ? ( n0043 ) : ( n1061 );
assign n1492 = { ( n1479 ), ( n1483 ), ( n1242 ), ( n1491 ), ( n1244 ) };
assign n1493 = n1492[7:1];
assign n1494 = n1475[7:7];
assign n1495 = n1475[6:6];
assign n1496 = n1475[5:5];
assign n1497 = n1475[4:4];
assign n1498 = n1475[3:3];
assign n1499 = n1475[2:2];
assign n1500 = n1475[1:1];
assign n1501 = n1475[0:0];
assign n1502 = ( n1500 ^ n1501 );
assign n1503 = ( n1499 ^ n1502 );
assign n1504 = ( n1498 ^ n1503 );
assign n1505 = ( n1497 ^ n1504 );
assign n1506 = ( n1496 ^ n1505 );
assign n1507 = ( n1495 ^ n1506 );
assign n1508 = ( n1494 ^ n1507 );
assign n1509 = { ( n1493 ), ( n1508 ) };
assign PSW_28 = n1509;
// 
// ACC_29
// 
assign ACC_29 = n1475;
// 
// XRAM_ADDR_29
// 
assign XRAM_ADDR_29 = n1000;
// 
// PC_29
// 
assign PC_29 = n0612;
// 
// XRAM_DATA_OUT_29
// 
assign XRAM_DATA_OUT_29 = n1001;
// 
// PSW_29
// 
assign PSW_29 = n1509;
// 
// ACC_2a
// 
assign ACC_2a = n1475;
// 
// XRAM_ADDR_2a
// 
assign XRAM_ADDR_2a = n1000;
// 
// PC_2a
// 
assign PC_2a = n0612;
// 
// XRAM_DATA_OUT_2a
// 
assign XRAM_DATA_OUT_2a = n1001;
// 
// PSW_2a
// 
assign n1510 = ( n1480 + n1339 );
assign n1511 = ( n1337 + n1510 );
assign n1512 = n1511[4:4];
assign n1513 = { ( n1479 ), ( n1512 ), ( n1242 ), ( n1491 ), ( n1244 ) };
assign n1514 = n1513[7:1];
assign n1515 = { ( n1514 ), ( n1508 ) };
assign PSW_2a = n1515;
// 
// ACC_2b
// 
assign ACC_2b = n1475;
// 
// XRAM_ADDR_2b
// 
assign XRAM_ADDR_2b = n1000;
// 
// PC_2b
// 
assign PC_2b = n0612;
// 
// XRAM_DATA_OUT_2b
// 
assign XRAM_DATA_OUT_2b = n1001;
// 
// PSW_2b
// 
assign PSW_2b = n1515;
// 
// ACC_2c
// 
assign ACC_2c = n1475;
// 
// XRAM_ADDR_2c
// 
assign XRAM_ADDR_2c = n1000;
// 
// PC_2c
// 
assign PC_2c = n0612;
// 
// XRAM_DATA_OUT_2c
// 
assign XRAM_DATA_OUT_2c = n1001;
// 
// PSW_2c
// 
assign n1516 = ( n1476 + n1390 );
assign n1517 = ( n1330 + n1516 );
assign n1518 = n1517[8:8];
assign n1519 = ( n1484 + n1390 );
assign n1520 = ( n1343 + n1519 );
assign n1521 = n1520[8:8];
assign n1522 = n1520[7:7];
assign n1523 = ( n1521 == n1522 );
assign n1524 = !( n1523 );
assign n1525 = ( n1524 ) ? ( n0043 ) : ( n1061 );
assign n1526 = { ( n1518 ), ( n1483 ), ( n1242 ), ( n1525 ), ( n1244 ) };
assign n1527 = n1526[7:1];
assign n1528 = { ( n1527 ), ( n1508 ) };
assign PSW_2c = n1528;
// 
// ACC_2d
// 
assign ACC_2d = n1475;
// 
// XRAM_ADDR_2d
// 
assign XRAM_ADDR_2d = n1000;
// 
// PC_2d
// 
assign PC_2d = n0612;
// 
// XRAM_DATA_OUT_2d
// 
assign XRAM_DATA_OUT_2d = n1001;
// 
// PSW_2d
// 
assign PSW_2d = n1509;
// 
// ACC_2e
// 
assign ACC_2e = n1475;
// 
// XRAM_ADDR_2e
// 
assign XRAM_ADDR_2e = n1000;
// 
// PC_2e
// 
assign PC_2e = n0612;
// 
// XRAM_DATA_OUT_2e
// 
assign XRAM_DATA_OUT_2e = n1001;
// 
// PSW_2e
// 
assign PSW_2e = n1528;
// 
// ACC_2f
// 
assign ACC_2f = n1475;
// 
// XRAM_ADDR_2f
// 
assign XRAM_ADDR_2f = n1000;
// 
// PC_2f
// 
assign PC_2f = n0612;
// 
// XRAM_DATA_OUT_2f
// 
assign XRAM_DATA_OUT_2f = n1001;
// 
// PSW_2f
// 
assign PSW_2f = n1528;
// 
// XRAM_ADDR_30
// 
assign XRAM_ADDR_30 = n1000;
// 
// PC_30
// 
assign n1529 = ( n1195 == n1061 );
assign n1530 = ( n1529 ) ? ( n1200 ) : ( n1198 );
assign PC_30 = n1530;
// 
// XRAM_DATA_OUT_30
// 
assign XRAM_DATA_OUT_30 = n1001;
// 
// PSW_30
// 
assign PSW_30 = n1018;
// 
// XRAM_ADDR_31
// 
assign XRAM_ADDR_31 = n1000;
// 
// PC_31
// 
assign PC_31 = n1023;
// 
// IRAM_31
// 
// 
// XRAM_DATA_OUT_31
// 
assign XRAM_DATA_OUT_31 = n1001;
// 
// SP_31
// 
assign SP_31 = n1234;
// 
// PSW_31
// 
assign PSW_31 = n1018;
// 
// XRAM_ADDR_32
// 
assign XRAM_ADDR_32 = n1000;
// 
// PC_32
// 
assign PC_32 = n1310;
// 
// XRAM_DATA_OUT_32
// 
assign XRAM_DATA_OUT_32 = n1001;
// 
// SP_32
// 
assign SP_32 = n1311;
// 
// PSW_32
// 
assign PSW_32 = n1018;
// 
// ACC_33
// 
assign n1531 = { ( n1237 ), ( ACC ) };
assign n1532 = { n1531[7:0], n1531[8] };
assign n1533 = n1532[7:0];
assign ACC_33 = n1533;
// 
// XRAM_ADDR_33
// 
assign XRAM_ADDR_33 = n1000;
// 
// PC_33
// 
assign PC_33 = n0612;
// 
// XRAM_DATA_OUT_33
// 
assign XRAM_DATA_OUT_33 = n1001;
// 
// PSW_33
// 
assign n1534 = { ( n1003 ), ( n1241 ), ( n1242 ), ( n1243 ), ( n1244 ) };
assign n1535 = n1534[7:1];
assign n1536 = n1533[7:7];
assign n1537 = n1533[6:6];
assign n1538 = n1533[5:5];
assign n1539 = n1533[4:4];
assign n1540 = n1533[3:3];
assign n1541 = n1533[2:2];
assign n1542 = n1533[1:1];
assign n1543 = n1533[0:0];
assign n1544 = ( n1542 ^ n1543 );
assign n1545 = ( n1541 ^ n1544 );
assign n1546 = ( n1540 ^ n1545 );
assign n1547 = ( n1539 ^ n1546 );
assign n1548 = ( n1538 ^ n1547 );
assign n1549 = ( n1537 ^ n1548 );
assign n1550 = ( n1536 ^ n1549 );
assign n1551 = { ( n1535 ), ( n1550 ) };
assign PSW_33 = n1551;
// 
// ACC_34
// 
assign n1552 = { 7'b0, n1237 };
assign n1553 = ( RD_ROM_1 + n1552 );
assign n1554 = ( ACC + n1553 );
assign ACC_34 = n1554;
// 
// XRAM_ADDR_34
// 
assign XRAM_ADDR_34 = n1000;
// 
// PC_34
// 
assign PC_34 = n0610;
// 
// XRAM_DATA_OUT_34
// 
assign XRAM_DATA_OUT_34 = n1001;
// 
// PSW_34
// 
assign n1555 = { 8'b0, n1237 };
assign n1556 = ( n1331 + n1555 );
assign n1557 = ( n1330 + n1556 );
assign n1558 = n1557[8:8];
assign n1559 = { 4'b0, n1237 };
assign n1560 = ( n1338 + n1559 );
assign n1561 = ( n1337 + n1560 );
assign n1562 = n1561[4:4];
assign n1563 = ( n1344 + n1555 );
assign n1564 = ( n1343 + n1563 );
assign n1565 = n1564[8:8];
assign n1566 = n1564[7:7];
assign n1567 = ( n1565 == n1566 );
assign n1568 = !( n1567 );
assign n1569 = ( n1568 ) ? ( n0043 ) : ( n1061 );
assign n1570 = { ( n1558 ), ( n1562 ), ( n1242 ), ( n1569 ), ( n1244 ) };
assign n1571 = n1570[7:1];
assign n1572 = n1554[7:7];
assign n1573 = n1554[6:6];
assign n1574 = n1554[5:5];
assign n1575 = n1554[4:4];
assign n1576 = n1554[3:3];
assign n1577 = n1554[2:2];
assign n1578 = n1554[1:1];
assign n1579 = n1554[0:0];
assign n1580 = ( n1578 ^ n1579 );
assign n1581 = ( n1577 ^ n1580 );
assign n1582 = ( n1576 ^ n1581 );
assign n1583 = ( n1575 ^ n1582 );
assign n1584 = ( n1574 ^ n1583 );
assign n1585 = ( n1573 ^ n1584 );
assign n1586 = ( n1572 ^ n1585 );
assign n1587 = { ( n1571 ), ( n1586 ) };
assign PSW_34 = n1587;
// 
// ACC_35
// 
assign n1588 = ( n1387 + n1552 );
assign n1589 = ( ACC + n1588 );
assign ACC_35 = n1589;
// 
// XRAM_ADDR_35
// 
assign XRAM_ADDR_35 = n1000;
// 
// PC_35
// 
assign PC_35 = n0610;
// 
// XRAM_DATA_OUT_35
// 
assign XRAM_DATA_OUT_35 = n1001;
// 
// PSW_35
// 
assign n1590 = ( n1389 + n1555 );
assign n1591 = ( n1330 + n1590 );
assign n1592 = n1591[8:8];
assign n1593 = ( n1395 + n1559 );
assign n1594 = ( n1337 + n1593 );
assign n1595 = n1594[4:4];
assign n1596 = ( n1400 + n1555 );
assign n1597 = ( n1343 + n1596 );
assign n1598 = n1597[8:8];
assign n1599 = n1597[7:7];
assign n1600 = ( n1598 == n1599 );
assign n1601 = !( n1600 );
assign n1602 = ( n1601 ) ? ( n0043 ) : ( n1061 );
assign n1603 = { ( n1592 ), ( n1595 ), ( n1242 ), ( n1602 ), ( n1244 ) };
assign n1604 = n1603[7:1];
assign n1605 = n1589[7:7];
assign n1606 = n1589[6:6];
assign n1607 = n1589[5:5];
assign n1608 = n1589[4:4];
assign n1609 = n1589[3:3];
assign n1610 = n1589[2:2];
assign n1611 = n1589[1:1];
assign n1612 = n1589[0:0];
assign n1613 = ( n1611 ^ n1612 );
assign n1614 = ( n1610 ^ n1613 );
assign n1615 = ( n1609 ^ n1614 );
assign n1616 = ( n1608 ^ n1615 );
assign n1617 = ( n1607 ^ n1616 );
assign n1618 = ( n1606 ^ n1617 );
assign n1619 = ( n1605 ^ n1618 );
assign n1620 = { ( n1604 ), ( n1619 ) };
assign PSW_35 = n1620;
// 
// ACC_36
// 
assign n1621 = ( RD_IRAM_1 + n1552 );
assign n1622 = ( ACC + n1621 );
assign ACC_36 = n1622;
// 
// XRAM_ADDR_36
// 
assign XRAM_ADDR_36 = n1000;
// 
// PC_36
// 
assign PC_36 = n0612;
// 
// XRAM_DATA_OUT_36
// 
assign XRAM_DATA_OUT_36 = n1001;
// 
// PSW_36
// 
assign n1623 = ( n1427 + n1555 );
assign n1624 = ( n1330 + n1623 );
assign n1625 = n1624[8:8];
assign n1626 = ( n1432 + n1559 );
assign n1627 = ( n1337 + n1626 );
assign n1628 = n1627[4:4];
assign n1629 = ( n1436 + n1555 );
assign n1630 = ( n1343 + n1629 );
assign n1631 = n1630[8:8];
assign n1632 = n1630[7:7];
assign n1633 = ( n1631 == n1632 );
assign n1634 = !( n1633 );
assign n1635 = ( n1634 ) ? ( n0043 ) : ( n1061 );
assign n1636 = { ( n1625 ), ( n1628 ), ( n1242 ), ( n1635 ), ( n1244 ) };
assign n1637 = n1636[7:1];
assign n1638 = n1622[7:7];
assign n1639 = n1622[6:6];
assign n1640 = n1622[5:5];
assign n1641 = n1622[4:4];
assign n1642 = n1622[3:3];
assign n1643 = n1622[2:2];
assign n1644 = n1622[1:1];
assign n1645 = n1622[0:0];
assign n1646 = ( n1644 ^ n1645 );
assign n1647 = ( n1643 ^ n1646 );
assign n1648 = ( n1642 ^ n1647 );
assign n1649 = ( n1641 ^ n1648 );
assign n1650 = ( n1640 ^ n1649 );
assign n1651 = ( n1639 ^ n1650 );
assign n1652 = ( n1638 ^ n1651 );
assign n1653 = { ( n1637 ), ( n1652 ) };
assign PSW_36 = n1653;
// 
// ACC_37
// 
assign ACC_37 = n1622;
// 
// XRAM_ADDR_37
// 
assign XRAM_ADDR_37 = n1000;
// 
// PC_37
// 
assign PC_37 = n0612;
// 
// XRAM_DATA_OUT_37
// 
assign XRAM_DATA_OUT_37 = n1001;
// 
// PSW_37
// 
assign PSW_37 = n1653;
// 
// ACC_38
// 
assign n1654 = ( RD_IRAM_0 + n1552 );
assign n1655 = ( ACC + n1654 );
assign ACC_38 = n1655;
// 
// XRAM_ADDR_38
// 
assign XRAM_ADDR_38 = n1000;
// 
// PC_38
// 
assign PC_38 = n0612;
// 
// XRAM_DATA_OUT_38
// 
assign XRAM_DATA_OUT_38 = n1001;
// 
// PSW_38
// 
assign n1656 = ( n1476 + n1555 );
assign n1657 = ( n1330 + n1656 );
assign n1658 = n1657[8:8];
assign n1659 = ( n1480 + n1559 );
assign n1660 = ( n1337 + n1659 );
assign n1661 = n1660[4:4];
assign n1662 = ( n1484 + n1555 );
assign n1663 = ( n1343 + n1662 );
assign n1664 = n1663[8:8];
assign n1665 = n1663[7:7];
assign n1666 = ( n1664 == n1665 );
assign n1667 = !( n1666 );
assign n1668 = ( n1667 ) ? ( n0043 ) : ( n1061 );
assign n1669 = { ( n1658 ), ( n1661 ), ( n1242 ), ( n1668 ), ( n1244 ) };
assign n1670 = n1669[7:1];
assign n1671 = n1655[7:7];
assign n1672 = n1655[6:6];
assign n1673 = n1655[5:5];
assign n1674 = n1655[4:4];
assign n1675 = n1655[3:3];
assign n1676 = n1655[2:2];
assign n1677 = n1655[1:1];
assign n1678 = n1655[0:0];
assign n1679 = ( n1677 ^ n1678 );
assign n1680 = ( n1676 ^ n1679 );
assign n1681 = ( n1675 ^ n1680 );
assign n1682 = ( n1674 ^ n1681 );
assign n1683 = ( n1673 ^ n1682 );
assign n1684 = ( n1672 ^ n1683 );
assign n1685 = ( n1671 ^ n1684 );
assign n1686 = { ( n1670 ), ( n1685 ) };
assign PSW_38 = n1686;
// 
// ACC_39
// 
assign ACC_39 = n1655;
// 
// XRAM_ADDR_39
// 
assign XRAM_ADDR_39 = n1000;
// 
// PC_39
// 
assign PC_39 = n0612;
// 
// XRAM_DATA_OUT_39
// 
assign XRAM_DATA_OUT_39 = n1001;
// 
// PSW_39
// 
assign PSW_39 = n1686;
// 
// ACC_3a
// 
assign ACC_3a = n1655;
// 
// XRAM_ADDR_3a
// 
assign XRAM_ADDR_3a = n1000;
// 
// PC_3a
// 
assign PC_3a = n0612;
// 
// XRAM_DATA_OUT_3a
// 
assign XRAM_DATA_OUT_3a = n1001;
// 
// PSW_3a
// 
assign PSW_3a = n1686;
// 
// ACC_3b
// 
assign ACC_3b = n1655;
// 
// XRAM_ADDR_3b
// 
assign XRAM_ADDR_3b = n1000;
// 
// PC_3b
// 
assign PC_3b = n0612;
// 
// XRAM_DATA_OUT_3b
// 
assign XRAM_DATA_OUT_3b = n1001;
// 
// PSW_3b
// 
assign PSW_3b = n1686;
// 
// ACC_3c
// 
assign ACC_3c = n1655;
// 
// XRAM_ADDR_3c
// 
assign XRAM_ADDR_3c = n1000;
// 
// PC_3c
// 
assign PC_3c = n0612;
// 
// XRAM_DATA_OUT_3c
// 
assign XRAM_DATA_OUT_3c = n1001;
// 
// PSW_3c
// 
assign PSW_3c = n1686;
// 
// ACC_3d
// 
assign ACC_3d = n1655;
// 
// XRAM_ADDR_3d
// 
assign XRAM_ADDR_3d = n1000;
// 
// PC_3d
// 
assign PC_3d = n0612;
// 
// XRAM_DATA_OUT_3d
// 
assign XRAM_DATA_OUT_3d = n1001;
// 
// PSW_3d
// 
assign PSW_3d = n1686;
// 
// ACC_3e
// 
assign ACC_3e = n1655;
// 
// XRAM_ADDR_3e
// 
assign XRAM_ADDR_3e = n1000;
// 
// PC_3e
// 
assign PC_3e = n0612;
// 
// XRAM_DATA_OUT_3e
// 
assign XRAM_DATA_OUT_3e = n1001;
// 
// PSW_3e
// 
assign PSW_3e = n1686;
// 
// ACC_3f
// 
assign ACC_3f = n1655;
// 
// XRAM_ADDR_3f
// 
assign XRAM_ADDR_3f = n1000;
// 
// PC_3f
// 
assign PC_3f = n0612;
// 
// XRAM_DATA_OUT_3f
// 
assign XRAM_DATA_OUT_3f = n1001;
// 
// PSW_3f
// 
assign PSW_3f = n1686;
// 
// XRAM_ADDR_40
// 
assign XRAM_ADDR_40 = n1000;
// 
// PC_40
// 
assign n1687 = ( n1237 == n0043 );
assign n1688 = { RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1[7], RD_ROM_1 };
assign n1689 = ( n0610 + n1688 );
assign n1690 = ( n1687 ) ? ( n1689 ) : ( n0610 );
assign PC_40 = n1690;
// 
// XRAM_DATA_OUT_40
// 
assign XRAM_DATA_OUT_40 = n1001;
// 
// PSW_40
// 
assign PSW_40 = n1018;
// 
// XRAM_ADDR_41
// 
assign XRAM_ADDR_41 = n1000;
// 
// PC_41
// 
assign PC_41 = n1023;
// 
// XRAM_DATA_OUT_41
// 
assign XRAM_DATA_OUT_41 = n1001;
// 
// PSW_41
// 
assign PSW_41 = n1018;
// 
// B_42
// 
assign n1691 = ( n1109 | ACC );
assign n1692 = ( n1087 ) ? ( n1691 ) : ( B );
assign B_42 = n1692;
// 
// DPL_42
// 
assign n1693 = ( n1067 ) ? ( n1691 ) : ( DPL );
assign DPL_42 = n1693;
// 
// DPH_42
// 
assign n1694 = ( n1069 ) ? ( n1691 ) : ( DPH );
assign DPH_42 = n1694;
// 
// XRAM_ADDR_42
// 
assign XRAM_ADDR_42 = n1000;
// 
// PC_42
// 
assign PC_42 = n0610;
// 
// P2_42
// 
assign n1695 = ( n1081 ) ? ( n1691 ) : ( P2 );
assign P2_42 = n1695;
// 
// P3_42
// 
assign n1696 = ( n1083 ) ? ( n1691 ) : ( P3 );
assign P3_42 = n1696;
// 
// P0_42
// 
assign n1697 = ( n1064 ) ? ( n1691 ) : ( P0 );
assign P0_42 = n1697;
// 
// P1_42
// 
assign n1698 = ( n1078 ) ? ( n1691 ) : ( P1 );
assign P1_42 = n1698;
// 
// IRAM_42
// 
// 
// XRAM_DATA_OUT_42
// 
assign XRAM_DATA_OUT_42 = n1001;
// 
// SP_42
// 
assign n1699 = ( n1066 ) ? ( n1691 ) : ( SP );
assign SP_42 = n1699;
// 
// PSW_42
// 
assign n1700 = ( n1085 ) ? ( n1691 ) : ( PSW );
assign n1701 = n1700[7:1];
assign n1702 = { ( n1701 ), ( n1017 ) };
assign PSW_42 = n1702;
// 
// ACC_43
// 
assign n1703 = ( n1109 | RD_ROM_2 );
assign n1704 = ( n1060 ) ? ( n1703 ) : ( ACC );
assign ACC_43 = n1704;
// 
// B_43
// 
assign n1705 = ( n1087 ) ? ( n1703 ) : ( B );
assign B_43 = n1705;
// 
// DPL_43
// 
assign n1706 = ( n1067 ) ? ( n1703 ) : ( DPL );
assign DPL_43 = n1706;
// 
// DPH_43
// 
assign n1707 = ( n1069 ) ? ( n1703 ) : ( DPH );
assign DPH_43 = n1707;
// 
// XRAM_ADDR_43
// 
assign XRAM_ADDR_43 = n1000;
// 
// PC_43
// 
assign PC_43 = n1198;
// 
// P2_43
// 
assign n1708 = ( n1081 ) ? ( n1703 ) : ( P2 );
assign P2_43 = n1708;
// 
// P3_43
// 
assign n1709 = ( n1083 ) ? ( n1703 ) : ( P3 );
assign P3_43 = n1709;
// 
// P0_43
// 
assign n1710 = ( n1064 ) ? ( n1703 ) : ( P0 );
assign P0_43 = n1710;
// 
// P1_43
// 
assign n1711 = ( n1078 ) ? ( n1703 ) : ( P1 );
assign P1_43 = n1711;
// 
// IRAM_43
// 
// 
// XRAM_DATA_OUT_43
// 
assign XRAM_DATA_OUT_43 = n1001;
// 
// SP_43
// 
assign n1712 = ( n1066 ) ? ( n1703 ) : ( SP );
assign SP_43 = n1712;
// 
// PSW_43
// 
assign n1713 = ( n1085 ) ? ( n1703 ) : ( PSW );
assign n1714 = n1713[7:1];
assign n1715 = n1704[7:7];
assign n1716 = n1704[6:6];
assign n1717 = n1704[5:5];
assign n1718 = n1704[4:4];
assign n1719 = n1704[3:3];
assign n1720 = n1704[2:2];
assign n1721 = n1704[1:1];
assign n1722 = n1704[0:0];
assign n1723 = ( n1721 ^ n1722 );
assign n1724 = ( n1720 ^ n1723 );
assign n1725 = ( n1719 ^ n1724 );
assign n1726 = ( n1718 ^ n1725 );
assign n1727 = ( n1717 ^ n1726 );
assign n1728 = ( n1716 ^ n1727 );
assign n1729 = ( n1715 ^ n1728 );
assign n1730 = { ( n1714 ), ( n1729 ) };
assign PSW_43 = n1730;
// 
// ACC_44
// 
assign n1731 = ( ACC | RD_ROM_1 );
assign ACC_44 = n1731;
// 
// XRAM_ADDR_44
// 
assign XRAM_ADDR_44 = n1000;
// 
// PC_44
// 
assign PC_44 = n0610;
// 
// XRAM_DATA_OUT_44
// 
assign XRAM_DATA_OUT_44 = n1001;
// 
// PSW_44
// 
assign n1732 = n1731[7:7];
assign n1733 = n1731[6:6];
assign n1734 = n1731[5:5];
assign n1735 = n1731[4:4];
assign n1736 = n1731[3:3];
assign n1737 = n1731[2:2];
assign n1738 = n1731[1:1];
assign n1739 = n1731[0:0];
assign n1740 = ( n1738 ^ n1739 );
assign n1741 = ( n1737 ^ n1740 );
assign n1742 = ( n1736 ^ n1741 );
assign n1743 = ( n1735 ^ n1742 );
assign n1744 = ( n1734 ^ n1743 );
assign n1745 = ( n1733 ^ n1744 );
assign n1746 = ( n1732 ^ n1745 );
assign n1747 = { ( n1002 ), ( n1746 ) };
assign PSW_44 = n1747;
// 
// ACC_45
// 
assign n1748 = ( ACC | n1109 );
assign ACC_45 = n1748;
// 
// XRAM_ADDR_45
// 
assign XRAM_ADDR_45 = n1000;
// 
// PC_45
// 
assign PC_45 = n0610;
// 
// XRAM_DATA_OUT_45
// 
assign XRAM_DATA_OUT_45 = n1001;
// 
// PSW_45
// 
assign n1749 = n1748[7:7];
assign n1750 = n1748[6:6];
assign n1751 = n1748[5:5];
assign n1752 = n1748[4:4];
assign n1753 = n1748[3:3];
assign n1754 = n1748[2:2];
assign n1755 = n1748[1:1];
assign n1756 = n1748[0:0];
assign n1757 = ( n1755 ^ n1756 );
assign n1758 = ( n1754 ^ n1757 );
assign n1759 = ( n1753 ^ n1758 );
assign n1760 = ( n1752 ^ n1759 );
assign n1761 = ( n1751 ^ n1760 );
assign n1762 = ( n1750 ^ n1761 );
assign n1763 = ( n1749 ^ n1762 );
assign n1764 = { ( n1002 ), ( n1763 ) };
assign PSW_45 = n1764;
// 
// ACC_46
// 
assign n1765 = ( ACC | RD_IRAM_1 );
assign ACC_46 = n1765;
// 
// XRAM_ADDR_46
// 
assign XRAM_ADDR_46 = n1000;
// 
// PC_46
// 
assign PC_46 = n0612;
// 
// XRAM_DATA_OUT_46
// 
assign XRAM_DATA_OUT_46 = n1001;
// 
// PSW_46
// 
assign n1766 = n1765[7:7];
assign n1767 = n1765[6:6];
assign n1768 = n1765[5:5];
assign n1769 = n1765[4:4];
assign n1770 = n1765[3:3];
assign n1771 = n1765[2:2];
assign n1772 = n1765[1:1];
assign n1773 = n1765[0:0];
assign n1774 = ( n1772 ^ n1773 );
assign n1775 = ( n1771 ^ n1774 );
assign n1776 = ( n1770 ^ n1775 );
assign n1777 = ( n1769 ^ n1776 );
assign n1778 = ( n1768 ^ n1777 );
assign n1779 = ( n1767 ^ n1778 );
assign n1780 = ( n1766 ^ n1779 );
assign n1781 = { ( n1002 ), ( n1780 ) };
assign PSW_46 = n1781;
// 
// ACC_47
// 
assign ACC_47 = n1765;
// 
// XRAM_ADDR_47
// 
assign XRAM_ADDR_47 = n1000;
// 
// PC_47
// 
assign PC_47 = n0612;
// 
// XRAM_DATA_OUT_47
// 
assign XRAM_DATA_OUT_47 = n1001;
// 
// PSW_47
// 
assign PSW_47 = n1781;
// 
// ACC_48
// 
assign n1782 = ( ACC | RD_IRAM_0 );
assign ACC_48 = n1782;
// 
// XRAM_ADDR_48
// 
assign XRAM_ADDR_48 = n1000;
// 
// PC_48
// 
assign PC_48 = n0612;
// 
// XRAM_DATA_OUT_48
// 
assign XRAM_DATA_OUT_48 = n1001;
// 
// PSW_48
// 
assign n1783 = n1782[7:7];
assign n1784 = n1782[6:6];
assign n1785 = n1782[5:5];
assign n1786 = n1782[4:4];
assign n1787 = n1782[3:3];
assign n1788 = n1782[2:2];
assign n1789 = n1782[1:1];
assign n1790 = n1782[0:0];
assign n1791 = ( n1789 ^ n1790 );
assign n1792 = ( n1788 ^ n1791 );
assign n1793 = ( n1787 ^ n1792 );
assign n1794 = ( n1786 ^ n1793 );
assign n1795 = ( n1785 ^ n1794 );
assign n1796 = ( n1784 ^ n1795 );
assign n1797 = ( n1783 ^ n1796 );
assign n1798 = { ( n1002 ), ( n1797 ) };
assign PSW_48 = n1798;
// 
// ACC_49
// 
assign ACC_49 = n1782;
// 
// XRAM_ADDR_49
// 
assign XRAM_ADDR_49 = n1000;
// 
// PC_49
// 
assign PC_49 = n0612;
// 
// XRAM_DATA_OUT_49
// 
assign XRAM_DATA_OUT_49 = n1001;
// 
// PSW_49
// 
assign PSW_49 = n1798;
// 
// ACC_4a
// 
assign ACC_4a = n1782;
// 
// XRAM_ADDR_4a
// 
assign XRAM_ADDR_4a = n1000;
// 
// PC_4a
// 
assign PC_4a = n0612;
// 
// XRAM_DATA_OUT_4a
// 
assign XRAM_DATA_OUT_4a = n1001;
// 
// PSW_4a
// 
assign PSW_4a = n1798;
// 
// ACC_4b
// 
assign ACC_4b = n1782;
// 
// XRAM_ADDR_4b
// 
assign XRAM_ADDR_4b = n1000;
// 
// PC_4b
// 
assign PC_4b = n0612;
// 
// XRAM_DATA_OUT_4b
// 
assign XRAM_DATA_OUT_4b = n1001;
// 
// PSW_4b
// 
assign PSW_4b = n1798;
// 
// ACC_4c
// 
assign ACC_4c = n1782;
// 
// XRAM_ADDR_4c
// 
assign XRAM_ADDR_4c = n1000;
// 
// PC_4c
// 
assign PC_4c = n0612;
// 
// XRAM_DATA_OUT_4c
// 
assign XRAM_DATA_OUT_4c = n1001;
// 
// PSW_4c
// 
assign PSW_4c = n1798;
// 
// ACC_4d
// 
assign ACC_4d = n1782;
// 
// XRAM_ADDR_4d
// 
assign XRAM_ADDR_4d = n1000;
// 
// PC_4d
// 
assign PC_4d = n0612;
// 
// XRAM_DATA_OUT_4d
// 
assign XRAM_DATA_OUT_4d = n1001;
// 
// PSW_4d
// 
assign PSW_4d = n1798;
// 
// ACC_4e
// 
assign ACC_4e = n1782;
// 
// XRAM_ADDR_4e
// 
assign XRAM_ADDR_4e = n1000;
// 
// PC_4e
// 
assign PC_4e = n0612;
// 
// XRAM_DATA_OUT_4e
// 
assign XRAM_DATA_OUT_4e = n1001;
// 
// PSW_4e
// 
assign PSW_4e = n1798;
// 
// ACC_4f
// 
assign ACC_4f = n1782;
// 
// XRAM_ADDR_4f
// 
assign XRAM_ADDR_4f = n1000;
// 
// PC_4f
// 
assign PC_4f = n0612;
// 
// XRAM_DATA_OUT_4f
// 
assign XRAM_DATA_OUT_4f = n1001;
// 
// PSW_4f
// 
assign PSW_4f = n1798;
// 
// XRAM_ADDR_50
// 
assign XRAM_ADDR_50 = n1000;
// 
// PC_50
// 
assign n1799 = ( n1237 == n1061 );
assign n1800 = ( n1799 ) ? ( n1689 ) : ( n0610 );
assign PC_50 = n1800;
// 
// XRAM_DATA_OUT_50
// 
assign XRAM_DATA_OUT_50 = n1001;
// 
// PSW_50
// 
assign PSW_50 = n1018;
// 
// XRAM_ADDR_51
// 
assign XRAM_ADDR_51 = n1000;
// 
// PC_51
// 
assign PC_51 = n1023;
// 
// IRAM_51
// 
// 
// XRAM_DATA_OUT_51
// 
assign XRAM_DATA_OUT_51 = n1001;
// 
// SP_51
// 
assign SP_51 = n1234;
// 
// PSW_51
// 
assign PSW_51 = n1018;
// 
// P1_52
// 
assign n1801 = ( n1109 & ACC );
assign n1802 = ( n1078 ) ? ( n1801 ) : ( P1 );
assign P1_52 = n1802;
// 
// DPL_52
// 
assign n1803 = ( n1067 ) ? ( n1801 ) : ( DPL );
assign DPL_52 = n1803;
// 
// DPH_52
// 
assign n1804 = ( n1069 ) ? ( n1801 ) : ( DPH );
assign DPH_52 = n1804;
// 
// XRAM_ADDR_52
// 
assign XRAM_ADDR_52 = n1000;
// 
// PC_52
// 
assign PC_52 = n0610;
// 
// P2_52
// 
assign n1805 = ( n1081 ) ? ( n1801 ) : ( P2 );
assign P2_52 = n1805;
// 
// P3_52
// 
assign n1806 = ( n1083 ) ? ( n1801 ) : ( P3 );
assign P3_52 = n1806;
// 
// P0_52
// 
assign n1807 = ( n1064 ) ? ( n1801 ) : ( P0 );
assign P0_52 = n1807;
// 
// B_52
// 
assign n1808 = ( n1087 ) ? ( n1801 ) : ( B );
assign B_52 = n1808;
// 
// IRAM_52
// 
// 
// XRAM_DATA_OUT_52
// 
assign XRAM_DATA_OUT_52 = n1001;
// 
// SP_52
// 
assign n1809 = ( n1066 ) ? ( n1801 ) : ( SP );
assign SP_52 = n1809;
// 
// PSW_52
// 
assign n1810 = ( n1085 ) ? ( n1801 ) : ( PSW );
assign n1811 = n1810[7:1];
assign n1812 = { ( n1811 ), ( n1017 ) };
assign PSW_52 = n1812;
// 
// ACC_53
// 
assign n1813 = ( n1109 & RD_ROM_2 );
assign n1814 = ( n1060 ) ? ( n1813 ) : ( ACC );
assign ACC_53 = n1814;
// 
// B_53
// 
assign n1815 = ( n1087 ) ? ( n1813 ) : ( B );
assign B_53 = n1815;
// 
// DPL_53
// 
assign n1816 = ( n1067 ) ? ( n1813 ) : ( DPL );
assign DPL_53 = n1816;
// 
// DPH_53
// 
assign n1817 = ( n1069 ) ? ( n1813 ) : ( DPH );
assign DPH_53 = n1817;
// 
// XRAM_ADDR_53
// 
assign XRAM_ADDR_53 = n1000;
// 
// PC_53
// 
assign PC_53 = n1198;
// 
// P2_53
// 
assign n1818 = ( n1081 ) ? ( n1813 ) : ( P2 );
assign P2_53 = n1818;
// 
// P3_53
// 
assign n1819 = ( n1083 ) ? ( n1813 ) : ( P3 );
assign P3_53 = n1819;
// 
// P0_53
// 
assign n1820 = ( n1064 ) ? ( n1813 ) : ( P0 );
assign P0_53 = n1820;
// 
// P1_53
// 
assign n1821 = ( n1078 ) ? ( n1813 ) : ( P1 );
assign P1_53 = n1821;
// 
// IRAM_53
// 
// 
// XRAM_DATA_OUT_53
// 
assign XRAM_DATA_OUT_53 = n1001;
// 
// SP_53
// 
assign n1822 = ( n1066 ) ? ( n1813 ) : ( SP );
assign SP_53 = n1822;
// 
// PSW_53
// 
assign n1823 = ( n1085 ) ? ( n1813 ) : ( PSW );
assign n1824 = n1823[7:1];
assign n1825 = n1814[7:7];
assign n1826 = n1814[6:6];
assign n1827 = n1814[5:5];
assign n1828 = n1814[4:4];
assign n1829 = n1814[3:3];
assign n1830 = n1814[2:2];
assign n1831 = n1814[1:1];
assign n1832 = n1814[0:0];
assign n1833 = ( n1831 ^ n1832 );
assign n1834 = ( n1830 ^ n1833 );
assign n1835 = ( n1829 ^ n1834 );
assign n1836 = ( n1828 ^ n1835 );
assign n1837 = ( n1827 ^ n1836 );
assign n1838 = ( n1826 ^ n1837 );
assign n1839 = ( n1825 ^ n1838 );
assign n1840 = { ( n1824 ), ( n1839 ) };
assign PSW_53 = n1840;
// 
// ACC_54
// 
assign n1841 = ( ACC & RD_ROM_1 );
assign ACC_54 = n1841;
// 
// XRAM_ADDR_54
// 
assign XRAM_ADDR_54 = n1000;
// 
// PC_54
// 
assign PC_54 = n0610;
// 
// XRAM_DATA_OUT_54
// 
assign XRAM_DATA_OUT_54 = n1001;
// 
// PSW_54
// 
assign n1842 = n1841[7:7];
assign n1843 = n1841[6:6];
assign n1844 = n1841[5:5];
assign n1845 = n1841[4:4];
assign n1846 = n1841[3:3];
assign n1847 = n1841[2:2];
assign n1848 = n1841[1:1];
assign n1849 = n1841[0:0];
assign n1850 = ( n1848 ^ n1849 );
assign n1851 = ( n1847 ^ n1850 );
assign n1852 = ( n1846 ^ n1851 );
assign n1853 = ( n1845 ^ n1852 );
assign n1854 = ( n1844 ^ n1853 );
assign n1855 = ( n1843 ^ n1854 );
assign n1856 = ( n1842 ^ n1855 );
assign n1857 = { ( n1002 ), ( n1856 ) };
assign PSW_54 = n1857;
// 
// ACC_55
// 
assign n1858 = ( ACC & n1109 );
assign ACC_55 = n1858;
// 
// XRAM_ADDR_55
// 
assign XRAM_ADDR_55 = n1000;
// 
// PC_55
// 
assign PC_55 = n0610;
// 
// XRAM_DATA_OUT_55
// 
assign XRAM_DATA_OUT_55 = n1001;
// 
// PSW_55
// 
assign n1859 = n1858[7:7];
assign n1860 = n1858[6:6];
assign n1861 = n1858[5:5];
assign n1862 = n1858[4:4];
assign n1863 = n1858[3:3];
assign n1864 = n1858[2:2];
assign n1865 = n1858[1:1];
assign n1866 = n1858[0:0];
assign n1867 = ( n1865 ^ n1866 );
assign n1868 = ( n1864 ^ n1867 );
assign n1869 = ( n1863 ^ n1868 );
assign n1870 = ( n1862 ^ n1869 );
assign n1871 = ( n1861 ^ n1870 );
assign n1872 = ( n1860 ^ n1871 );
assign n1873 = ( n1859 ^ n1872 );
assign n1874 = { ( n1002 ), ( n1873 ) };
assign PSW_55 = n1874;
// 
// ACC_56
// 
assign n1875 = ( ACC & RD_IRAM_1 );
assign ACC_56 = n1875;
// 
// XRAM_ADDR_56
// 
assign XRAM_ADDR_56 = n1000;
// 
// PC_56
// 
assign PC_56 = n0612;
// 
// XRAM_DATA_OUT_56
// 
assign XRAM_DATA_OUT_56 = n1001;
// 
// PSW_56
// 
assign n1876 = n1875[7:7];
assign n1877 = n1875[6:6];
assign n1878 = n1875[5:5];
assign n1879 = n1875[4:4];
assign n1880 = n1875[3:3];
assign n1881 = n1875[2:2];
assign n1882 = n1875[1:1];
assign n1883 = n1875[0:0];
assign n1884 = ( n1882 ^ n1883 );
assign n1885 = ( n1881 ^ n1884 );
assign n1886 = ( n1880 ^ n1885 );
assign n1887 = ( n1879 ^ n1886 );
assign n1888 = ( n1878 ^ n1887 );
assign n1889 = ( n1877 ^ n1888 );
assign n1890 = ( n1876 ^ n1889 );
assign n1891 = { ( n1002 ), ( n1890 ) };
assign PSW_56 = n1891;
// 
// ACC_57
// 
assign ACC_57 = n1875;
// 
// XRAM_ADDR_57
// 
assign XRAM_ADDR_57 = n1000;
// 
// PC_57
// 
assign PC_57 = n0612;
// 
// XRAM_DATA_OUT_57
// 
assign XRAM_DATA_OUT_57 = n1001;
// 
// PSW_57
// 
assign PSW_57 = n1891;
// 
// ACC_58
// 
assign n1892 = ( ACC & RD_IRAM_0 );
assign ACC_58 = n1892;
// 
// XRAM_ADDR_58
// 
assign XRAM_ADDR_58 = n1000;
// 
// PC_58
// 
assign PC_58 = n0612;
// 
// XRAM_DATA_OUT_58
// 
assign XRAM_DATA_OUT_58 = n1001;
// 
// PSW_58
// 
assign n1893 = n1892[7:7];
assign n1894 = n1892[6:6];
assign n1895 = n1892[5:5];
assign n1896 = n1892[4:4];
assign n1897 = n1892[3:3];
assign n1898 = n1892[2:2];
assign n1899 = n1892[1:1];
assign n1900 = n1892[0:0];
assign n1901 = ( n1899 ^ n1900 );
assign n1902 = ( n1898 ^ n1901 );
assign n1903 = ( n1897 ^ n1902 );
assign n1904 = ( n1896 ^ n1903 );
assign n1905 = ( n1895 ^ n1904 );
assign n1906 = ( n1894 ^ n1905 );
assign n1907 = ( n1893 ^ n1906 );
assign n1908 = { ( n1002 ), ( n1907 ) };
assign PSW_58 = n1908;
// 
// ACC_59
// 
assign ACC_59 = n1892;
// 
// XRAM_ADDR_59
// 
assign XRAM_ADDR_59 = n1000;
// 
// PC_59
// 
assign PC_59 = n0612;
// 
// XRAM_DATA_OUT_59
// 
assign XRAM_DATA_OUT_59 = n1001;
// 
// PSW_59
// 
assign PSW_59 = n1908;
// 
// ACC_5a
// 
assign ACC_5a = n1892;
// 
// XRAM_ADDR_5a
// 
assign XRAM_ADDR_5a = n1000;
// 
// PC_5a
// 
assign PC_5a = n0612;
// 
// XRAM_DATA_OUT_5a
// 
assign XRAM_DATA_OUT_5a = n1001;
// 
// PSW_5a
// 
assign PSW_5a = n1908;
// 
// ACC_5b
// 
assign ACC_5b = n1892;
// 
// XRAM_ADDR_5b
// 
assign XRAM_ADDR_5b = n1000;
// 
// PC_5b
// 
assign PC_5b = n0612;
// 
// XRAM_DATA_OUT_5b
// 
assign XRAM_DATA_OUT_5b = n1001;
// 
// PSW_5b
// 
assign PSW_5b = n1908;
// 
// ACC_5c
// 
assign ACC_5c = n1892;
// 
// XRAM_ADDR_5c
// 
assign XRAM_ADDR_5c = n1000;
// 
// PC_5c
// 
assign PC_5c = n0612;
// 
// XRAM_DATA_OUT_5c
// 
assign XRAM_DATA_OUT_5c = n1001;
// 
// PSW_5c
// 
assign PSW_5c = n1908;
// 
// ACC_5d
// 
assign ACC_5d = n1892;
// 
// XRAM_ADDR_5d
// 
assign XRAM_ADDR_5d = n1000;
// 
// PC_5d
// 
assign PC_5d = n0612;
// 
// XRAM_DATA_OUT_5d
// 
assign XRAM_DATA_OUT_5d = n1001;
// 
// PSW_5d
// 
assign PSW_5d = n1908;
// 
// ACC_5e
// 
assign ACC_5e = n1892;
// 
// XRAM_ADDR_5e
// 
assign XRAM_ADDR_5e = n1000;
// 
// PC_5e
// 
assign PC_5e = n0612;
// 
// XRAM_DATA_OUT_5e
// 
assign XRAM_DATA_OUT_5e = n1001;
// 
// PSW_5e
// 
assign PSW_5e = n1908;
// 
// ACC_5f
// 
assign ACC_5f = n1892;
// 
// XRAM_ADDR_5f
// 
assign XRAM_ADDR_5f = n1000;
// 
// PC_5f
// 
assign PC_5f = n0612;
// 
// XRAM_DATA_OUT_5f
// 
assign XRAM_DATA_OUT_5f = n1001;
// 
// PSW_5f
// 
assign PSW_5f = n1908;
// 
// XRAM_ADDR_60
// 
assign XRAM_ADDR_60 = n1000;
// 
// PC_60
// 
assign n1909 = ( ACC == n1001 );
assign n1910 = ( n1909 ) ? ( n1689 ) : ( n0610 );
assign PC_60 = n1910;
// 
// XRAM_DATA_OUT_60
// 
assign XRAM_DATA_OUT_60 = n1001;
// 
// PSW_60
// 
assign PSW_60 = n1018;
// 
// XRAM_ADDR_61
// 
assign XRAM_ADDR_61 = n1000;
// 
// PC_61
// 
assign PC_61 = n1023;
// 
// XRAM_DATA_OUT_61
// 
assign XRAM_DATA_OUT_61 = n1001;
// 
// PSW_61
// 
assign PSW_61 = n1018;
// 
// ACC_62
// 
assign n1911 = ( n1109 ^ n1109 );
assign n1912 = ( n1060 ) ? ( n1911 ) : ( ACC );
assign ACC_62 = n1912;
// 
// B_62
// 
assign n1913 = ( n1109 ^ ACC );
assign n1914 = ( n1087 ) ? ( n1913 ) : ( B );
assign B_62 = n1914;
// 
// DPL_62
// 
assign n1915 = ( n1067 ) ? ( n1913 ) : ( DPL );
assign DPL_62 = n1915;
// 
// DPH_62
// 
assign n1916 = ( n1069 ) ? ( n1913 ) : ( DPH );
assign DPH_62 = n1916;
// 
// XRAM_ADDR_62
// 
assign XRAM_ADDR_62 = n1000;
// 
// PC_62
// 
assign PC_62 = n0610;
// 
// P2_62
// 
assign n1917 = ( n1081 ) ? ( n1913 ) : ( P2 );
assign P2_62 = n1917;
// 
// P3_62
// 
assign n1918 = ( n1083 ) ? ( n1913 ) : ( P3 );
assign P3_62 = n1918;
// 
// P0_62
// 
assign n1919 = ( n1064 ) ? ( n1913 ) : ( P0 );
assign P0_62 = n1919;
// 
// P1_62
// 
assign n1920 = ( n1078 ) ? ( n1913 ) : ( P1 );
assign P1_62 = n1920;
// 
// IRAM_62
// 
// 
// XRAM_DATA_OUT_62
// 
assign XRAM_DATA_OUT_62 = n1001;
// 
// SP_62
// 
assign n1921 = ( n1066 ) ? ( n1913 ) : ( SP );
assign SP_62 = n1921;
// 
// PSW_62
// 
assign n1922 = ( n1085 ) ? ( n1913 ) : ( PSW );
assign n1923 = n1922[7:1];
assign n1924 = n1912[7:7];
assign n1925 = n1912[6:6];
assign n1926 = n1912[5:5];
assign n1927 = n1912[4:4];
assign n1928 = n1912[3:3];
assign n1929 = n1912[2:2];
assign n1930 = n1912[1:1];
assign n1931 = n1912[0:0];
assign n1932 = ( n1930 ^ n1931 );
assign n1933 = ( n1929 ^ n1932 );
assign n1934 = ( n1928 ^ n1933 );
assign n1935 = ( n1927 ^ n1934 );
assign n1936 = ( n1926 ^ n1935 );
assign n1937 = ( n1925 ^ n1936 );
assign n1938 = ( n1924 ^ n1937 );
assign n1939 = { ( n1923 ), ( n1938 ) };
assign PSW_62 = n1939;
// 
// ACC_63
// 
assign n1940 = ( n1109 ^ RD_ROM_2 );
assign n1941 = ( n1060 ) ? ( n1940 ) : ( ACC );
assign ACC_63 = n1941;
// 
// B_63
// 
assign n1942 = ( n1087 ) ? ( n1940 ) : ( B );
assign B_63 = n1942;
// 
// DPL_63
// 
assign n1943 = ( n1067 ) ? ( n1940 ) : ( DPL );
assign DPL_63 = n1943;
// 
// DPH_63
// 
assign n1944 = ( n1069 ) ? ( n1940 ) : ( DPH );
assign DPH_63 = n1944;
// 
// XRAM_ADDR_63
// 
assign XRAM_ADDR_63 = n1000;
// 
// PC_63
// 
assign PC_63 = n1198;
// 
// P2_63
// 
assign n1945 = ( n1081 ) ? ( n1940 ) : ( P2 );
assign P2_63 = n1945;
// 
// P3_63
// 
assign n1946 = ( n1083 ) ? ( n1940 ) : ( P3 );
assign P3_63 = n1946;
// 
// P0_63
// 
assign n1947 = ( n1064 ) ? ( n1940 ) : ( P0 );
assign P0_63 = n1947;
// 
// P1_63
// 
assign n1948 = ( n1078 ) ? ( n1940 ) : ( P1 );
assign P1_63 = n1948;
// 
// IRAM_63
// 
// 
// XRAM_DATA_OUT_63
// 
assign XRAM_DATA_OUT_63 = n1001;
// 
// SP_63
// 
assign n1949 = ( n1066 ) ? ( n1940 ) : ( SP );
assign SP_63 = n1949;
// 
// PSW_63
// 
assign n1950 = ( n1085 ) ? ( n1940 ) : ( PSW );
assign n1951 = n1950[7:1];
assign n1952 = n1941[7:7];
assign n1953 = n1941[6:6];
assign n1954 = n1941[5:5];
assign n1955 = n1941[4:4];
assign n1956 = n1941[3:3];
assign n1957 = n1941[2:2];
assign n1958 = n1941[1:1];
assign n1959 = n1941[0:0];
assign n1960 = ( n1958 ^ n1959 );
assign n1961 = ( n1957 ^ n1960 );
assign n1962 = ( n1956 ^ n1961 );
assign n1963 = ( n1955 ^ n1962 );
assign n1964 = ( n1954 ^ n1963 );
assign n1965 = ( n1953 ^ n1964 );
assign n1966 = ( n1952 ^ n1965 );
assign n1967 = { ( n1951 ), ( n1966 ) };
assign PSW_63 = n1967;
// 
// ACC_64
// 
assign n1968 = ( ACC ^ RD_ROM_1 );
assign ACC_64 = n1968;
// 
// XRAM_ADDR_64
// 
assign XRAM_ADDR_64 = n1000;
// 
// PC_64
// 
assign PC_64 = n0610;
// 
// XRAM_DATA_OUT_64
// 
assign XRAM_DATA_OUT_64 = n1001;
// 
// PSW_64
// 
assign n1969 = n1968[7:7];
assign n1970 = n1968[6:6];
assign n1971 = n1968[5:5];
assign n1972 = n1968[4:4];
assign n1973 = n1968[3:3];
assign n1974 = n1968[2:2];
assign n1975 = n1968[1:1];
assign n1976 = n1968[0:0];
assign n1977 = ( n1975 ^ n1976 );
assign n1978 = ( n1974 ^ n1977 );
assign n1979 = ( n1973 ^ n1978 );
assign n1980 = ( n1972 ^ n1979 );
assign n1981 = ( n1971 ^ n1980 );
assign n1982 = ( n1970 ^ n1981 );
assign n1983 = ( n1969 ^ n1982 );
assign n1984 = { ( n1002 ), ( n1983 ) };
assign PSW_64 = n1984;
// 
// ACC_65
// 
assign n1985 = ( ACC ^ n1109 );
assign ACC_65 = n1985;
// 
// XRAM_ADDR_65
// 
assign XRAM_ADDR_65 = n1000;
// 
// PC_65
// 
assign PC_65 = n0610;
// 
// XRAM_DATA_OUT_65
// 
assign XRAM_DATA_OUT_65 = n1001;
// 
// PSW_65
// 
assign n1986 = n1985[7:7];
assign n1987 = n1985[6:6];
assign n1988 = n1985[5:5];
assign n1989 = n1985[4:4];
assign n1990 = n1985[3:3];
assign n1991 = n1985[2:2];
assign n1992 = n1985[1:1];
assign n1993 = n1985[0:0];
assign n1994 = ( n1992 ^ n1993 );
assign n1995 = ( n1991 ^ n1994 );
assign n1996 = ( n1990 ^ n1995 );
assign n1997 = ( n1989 ^ n1996 );
assign n1998 = ( n1988 ^ n1997 );
assign n1999 = ( n1987 ^ n1998 );
assign n2000 = ( n1986 ^ n1999 );
assign n2001 = { ( n1002 ), ( n2000 ) };
assign PSW_65 = n2001;
// 
// ACC_66
// 
assign n2002 = ( ACC ^ RD_IRAM_1 );
assign ACC_66 = n2002;
// 
// XRAM_ADDR_66
// 
assign XRAM_ADDR_66 = n1000;
// 
// PC_66
// 
assign PC_66 = n0612;
// 
// XRAM_DATA_OUT_66
// 
assign XRAM_DATA_OUT_66 = n1001;
// 
// PSW_66
// 
assign n2003 = n2002[7:7];
assign n2004 = n2002[6:6];
assign n2005 = n2002[5:5];
assign n2006 = n2002[4:4];
assign n2007 = n2002[3:3];
assign n2008 = n2002[2:2];
assign n2009 = n2002[1:1];
assign n2010 = n2002[0:0];
assign n2011 = ( n2009 ^ n2010 );
assign n2012 = ( n2008 ^ n2011 );
assign n2013 = ( n2007 ^ n2012 );
assign n2014 = ( n2006 ^ n2013 );
assign n2015 = ( n2005 ^ n2014 );
assign n2016 = ( n2004 ^ n2015 );
assign n2017 = ( n2003 ^ n2016 );
assign n2018 = { ( n1002 ), ( n2017 ) };
assign PSW_66 = n2018;
// 
// ACC_67
// 
assign ACC_67 = n2002;
// 
// XRAM_ADDR_67
// 
assign XRAM_ADDR_67 = n1000;
// 
// PC_67
// 
assign PC_67 = n0612;
// 
// XRAM_DATA_OUT_67
// 
assign XRAM_DATA_OUT_67 = n1001;
// 
// PSW_67
// 
assign PSW_67 = n2018;
// 
// ACC_68
// 
assign n2019 = ( ACC ^ RD_IRAM_0 );
assign ACC_68 = n2019;
// 
// XRAM_ADDR_68
// 
assign XRAM_ADDR_68 = n1000;
// 
// PC_68
// 
assign PC_68 = n0612;
// 
// XRAM_DATA_OUT_68
// 
assign XRAM_DATA_OUT_68 = n1001;
// 
// PSW_68
// 
assign n2020 = n2019[7:7];
assign n2021 = n2019[6:6];
assign n2022 = n2019[5:5];
assign n2023 = n2019[4:4];
assign n2024 = n2019[3:3];
assign n2025 = n2019[2:2];
assign n2026 = n2019[1:1];
assign n2027 = n2019[0:0];
assign n2028 = ( n2026 ^ n2027 );
assign n2029 = ( n2025 ^ n2028 );
assign n2030 = ( n2024 ^ n2029 );
assign n2031 = ( n2023 ^ n2030 );
assign n2032 = ( n2022 ^ n2031 );
assign n2033 = ( n2021 ^ n2032 );
assign n2034 = ( n2020 ^ n2033 );
assign n2035 = { ( n1002 ), ( n2034 ) };
assign PSW_68 = n2035;
// 
// ACC_69
// 
assign ACC_69 = n2019;
// 
// XRAM_ADDR_69
// 
assign XRAM_ADDR_69 = n1000;
// 
// PC_69
// 
assign PC_69 = n0612;
// 
// XRAM_DATA_OUT_69
// 
assign XRAM_DATA_OUT_69 = n1001;
// 
// PSW_69
// 
assign PSW_69 = n2035;
// 
// ACC_6a
// 
assign ACC_6a = n2019;
// 
// XRAM_ADDR_6a
// 
assign XRAM_ADDR_6a = n1000;
// 
// PC_6a
// 
assign PC_6a = n0612;
// 
// XRAM_DATA_OUT_6a
// 
assign XRAM_DATA_OUT_6a = n1001;
// 
// PSW_6a
// 
assign PSW_6a = n2035;
// 
// ACC_6b
// 
assign ACC_6b = n2019;
// 
// XRAM_ADDR_6b
// 
assign XRAM_ADDR_6b = n1000;
// 
// PC_6b
// 
assign PC_6b = n0612;
// 
// XRAM_DATA_OUT_6b
// 
assign XRAM_DATA_OUT_6b = n1001;
// 
// PSW_6b
// 
assign PSW_6b = n2035;
// 
// ACC_6c
// 
assign ACC_6c = n2019;
// 
// XRAM_ADDR_6c
// 
assign XRAM_ADDR_6c = n1000;
// 
// PC_6c
// 
assign PC_6c = n0612;
// 
// XRAM_DATA_OUT_6c
// 
assign XRAM_DATA_OUT_6c = n1001;
// 
// PSW_6c
// 
assign PSW_6c = n2035;
// 
// ACC_6d
// 
assign ACC_6d = n2019;
// 
// XRAM_ADDR_6d
// 
assign XRAM_ADDR_6d = n1000;
// 
// PC_6d
// 
assign PC_6d = n0612;
// 
// XRAM_DATA_OUT_6d
// 
assign XRAM_DATA_OUT_6d = n1001;
// 
// PSW_6d
// 
assign PSW_6d = n2035;
// 
// ACC_6e
// 
assign ACC_6e = n2019;
// 
// XRAM_ADDR_6e
// 
assign XRAM_ADDR_6e = n1000;
// 
// PC_6e
// 
assign PC_6e = n0612;
// 
// XRAM_DATA_OUT_6e
// 
assign XRAM_DATA_OUT_6e = n1001;
// 
// PSW_6e
// 
assign PSW_6e = n2035;
// 
// ACC_6f
// 
assign ACC_6f = n2019;
// 
// XRAM_ADDR_6f
// 
assign XRAM_ADDR_6f = n1000;
// 
// PC_6f
// 
assign PC_6f = n0612;
// 
// XRAM_DATA_OUT_6f
// 
assign XRAM_DATA_OUT_6f = n1001;
// 
// PSW_6f
// 
assign PSW_6f = n2035;
// 
// XRAM_ADDR_70
// 
assign XRAM_ADDR_70 = n1000;
// 
// PC_70
// 
assign n2036 = !( n1909 );
assign n2037 = ( n2036 ) ? ( n1689 ) : ( n0610 );
assign PC_70 = n2037;
// 
// XRAM_DATA_OUT_70
// 
assign XRAM_DATA_OUT_70 = n1001;
// 
// PSW_70
// 
assign PSW_70 = n1018;
// 
// XRAM_ADDR_71
// 
assign XRAM_ADDR_71 = n1000;
// 
// PC_71
// 
assign PC_71 = n1023;
// 
// IRAM_71
// 
// 
// XRAM_DATA_OUT_71
// 
assign XRAM_DATA_OUT_71 = n1001;
// 
// SP_71
// 
assign SP_71 = n1234;
// 
// PSW_71
// 
assign PSW_71 = n1018;
// 
// XRAM_ADDR_72
// 
assign XRAM_ADDR_72 = n1000;
// 
// PC_72
// 
assign PC_72 = n0610;
// 
// XRAM_DATA_OUT_72
// 
assign XRAM_DATA_OUT_72 = n1001;
// 
// PSW_72
// 
assign n2038 = n1191[n1151];
assign n2039 = ( n1237 | n2038 );
assign n2040 = PSW[6:0];
assign n2041 = { ( n2039 ), ( n2040 ) };
assign n2042 = n2041[7:1];
assign n2043 = { ( n2042 ), ( n1017 ) };
assign PSW_72 = n2043;
// 
// XRAM_ADDR_73
// 
assign XRAM_ADDR_73 = n1000;
// 
// PC_73
// 
assign n2044 = ( n0745 + n0713 );
assign PC_73 = n2044;
// 
// XRAM_DATA_OUT_73
// 
assign XRAM_DATA_OUT_73 = n1001;
// 
// PSW_73
// 
assign PSW_73 = n1018;
// 
// ACC_74
// 
assign ACC_74 = RD_ROM_1;
// 
// XRAM_ADDR_74
// 
assign XRAM_ADDR_74 = n1000;
// 
// PC_74
// 
assign PC_74 = n0610;
// 
// XRAM_DATA_OUT_74
// 
assign XRAM_DATA_OUT_74 = n1001;
// 
// PSW_74
// 
assign n2045 = RD_ROM_1[6:6];
assign n2046 = RD_ROM_1[5:5];
assign n2047 = RD_ROM_1[4:4];
assign n2048 = RD_ROM_1[3:3];
assign n2049 = RD_ROM_1[2:2];
assign n2050 = RD_ROM_1[1:1];
assign n2051 = RD_ROM_1[0:0];
assign n2052 = ( n2050 ^ n2051 );
assign n2053 = ( n2049 ^ n2052 );
assign n2054 = ( n2048 ^ n2053 );
assign n2055 = ( n2047 ^ n2054 );
assign n2056 = ( n2046 ^ n2055 );
assign n2057 = ( n2045 ^ n2056 );
assign n2058 = ( n0042 ^ n2057 );
assign n2059 = { ( n1002 ), ( n2058 ) };
assign PSW_74 = n2059;
// 
// ACC_75
// 
assign n2060 = ( n1060 ) ? ( RD_ROM_2 ) : ( ACC );
assign ACC_75 = n2060;
// 
// P1_75
// 
assign n2061 = ( n1078 ) ? ( RD_ROM_2 ) : ( P1 );
assign P1_75 = n2061;
// 
// DPL_75
// 
assign n2062 = ( n1067 ) ? ( RD_ROM_2 ) : ( DPL );
assign DPL_75 = n2062;
// 
// DPH_75
// 
assign n2063 = ( n1069 ) ? ( RD_ROM_2 ) : ( DPH );
assign DPH_75 = n2063;
// 
// XRAM_ADDR_75
// 
assign XRAM_ADDR_75 = n1000;
// 
// PC_75
// 
assign PC_75 = n1198;
// 
// P2_75
// 
assign n2064 = ( n1081 ) ? ( RD_ROM_2 ) : ( P2 );
assign P2_75 = n2064;
// 
// P3_75
// 
assign n2065 = ( n1083 ) ? ( RD_ROM_2 ) : ( P3 );
assign P3_75 = n2065;
// 
// P0_75
// 
assign n2066 = ( n1064 ) ? ( RD_ROM_2 ) : ( P0 );
assign P0_75 = n2066;
// 
// B_75
// 
assign n2067 = ( n1087 ) ? ( RD_ROM_2 ) : ( B );
assign B_75 = n2067;
// 
// IRAM_75
// 
// 
// XRAM_DATA_OUT_75
// 
assign XRAM_DATA_OUT_75 = n1001;
// 
// SP_75
// 
assign n2068 = ( n1066 ) ? ( RD_ROM_2 ) : ( SP );
assign SP_75 = n2068;
// 
// PSW_75
// 
assign n2069 = ( n1085 ) ? ( RD_ROM_2 ) : ( PSW );
assign n2070 = n2069[7:1];
assign n2071 = n2060[7:7];
assign n2072 = n2060[6:6];
assign n2073 = n2060[5:5];
assign n2074 = n2060[4:4];
assign n2075 = n2060[3:3];
assign n2076 = n2060[2:2];
assign n2077 = n2060[1:1];
assign n2078 = n2060[0:0];
assign n2079 = ( n2077 ^ n2078 );
assign n2080 = ( n2076 ^ n2079 );
assign n2081 = ( n2075 ^ n2080 );
assign n2082 = ( n2074 ^ n2081 );
assign n2083 = ( n2073 ^ n2082 );
assign n2084 = ( n2072 ^ n2083 );
assign n2085 = ( n2071 ^ n2084 );
assign n2086 = { ( n2070 ), ( n2085 ) };
assign PSW_75 = n2086;
// 
// XRAM_ADDR_76
// 
assign XRAM_ADDR_76 = n1000;
// 
// PC_76
// 
assign PC_76 = n0610;
// 
// IRAM_76
// 
// 
// XRAM_DATA_OUT_76
// 
assign XRAM_DATA_OUT_76 = n1001;
// 
// PSW_76
// 
assign PSW_76 = n1018;
// 
// XRAM_ADDR_77
// 
assign XRAM_ADDR_77 = n1000;
// 
// PC_77
// 
assign PC_77 = n0610;
// 
// IRAM_77
// 
// 
// XRAM_DATA_OUT_77
// 
assign XRAM_DATA_OUT_77 = n1001;
// 
// PSW_77
// 
assign PSW_77 = n1018;
// 
// XRAM_ADDR_78
// 
assign XRAM_ADDR_78 = n1000;
// 
// PC_78
// 
assign PC_78 = n0610;
// 
// IRAM_78
// 
// 
// XRAM_DATA_OUT_78
// 
assign XRAM_DATA_OUT_78 = n1001;
// 
// PSW_78
// 
assign PSW_78 = n1018;
// 
// XRAM_ADDR_79
// 
assign XRAM_ADDR_79 = n1000;
// 
// PC_79
// 
assign PC_79 = n0610;
// 
// IRAM_79
// 
// 
// XRAM_DATA_OUT_79
// 
assign XRAM_DATA_OUT_79 = n1001;
// 
// PSW_79
// 
assign PSW_79 = n1018;
// 
// XRAM_ADDR_7a
// 
assign XRAM_ADDR_7a = n1000;
// 
// PC_7a
// 
assign PC_7a = n0610;
// 
// IRAM_7a
// 
// 
// XRAM_DATA_OUT_7a
// 
assign XRAM_DATA_OUT_7a = n1001;
// 
// PSW_7a
// 
assign PSW_7a = n1018;
// 
// XRAM_ADDR_7b
// 
assign XRAM_ADDR_7b = n1000;
// 
// PC_7b
// 
assign PC_7b = n0610;
// 
// IRAM_7b
// 
// 
// XRAM_DATA_OUT_7b
// 
assign XRAM_DATA_OUT_7b = n1001;
// 
// PSW_7b
// 
assign PSW_7b = n1018;
// 
// XRAM_ADDR_7c
// 
assign XRAM_ADDR_7c = n1000;
// 
// PC_7c
// 
assign PC_7c = n0610;
// 
// IRAM_7c
// 
// 
// XRAM_DATA_OUT_7c
// 
assign XRAM_DATA_OUT_7c = n1001;
// 
// PSW_7c
// 
assign PSW_7c = n1018;
// 
// XRAM_ADDR_7d
// 
assign XRAM_ADDR_7d = n1000;
// 
// PC_7d
// 
assign PC_7d = n0610;
// 
// IRAM_7d
// 
// 
// XRAM_DATA_OUT_7d
// 
assign XRAM_DATA_OUT_7d = n1001;
// 
// PSW_7d
// 
assign PSW_7d = n1018;
// 
// XRAM_ADDR_7e
// 
assign XRAM_ADDR_7e = n1000;
// 
// PC_7e
// 
assign PC_7e = n0610;
// 
// IRAM_7e
// 
// 
// XRAM_DATA_OUT_7e
// 
assign XRAM_DATA_OUT_7e = n1001;
// 
// PSW_7e
// 
assign PSW_7e = n1018;
// 
// XRAM_ADDR_7f
// 
assign XRAM_ADDR_7f = n1000;
// 
// PC_7f
// 
assign PC_7f = n0610;
// 
// IRAM_7f
// 
// 
// XRAM_DATA_OUT_7f
// 
assign XRAM_DATA_OUT_7f = n1001;
// 
// PSW_7f
// 
assign PSW_7f = n1018;
// 
// XRAM_ADDR_80
// 
assign XRAM_ADDR_80 = n1000;
// 
// PC_80
// 
assign PC_80 = n1689;
// 
// XRAM_DATA_OUT_80
// 
assign XRAM_DATA_OUT_80 = n1001;
// 
// PSW_80
// 
assign PSW_80 = n1018;
// 
// XRAM_ADDR_81
// 
assign XRAM_ADDR_81 = n1000;
// 
// PC_81
// 
assign PC_81 = n1023;
// 
// XRAM_DATA_OUT_81
// 
assign XRAM_DATA_OUT_81 = n1001;
// 
// PSW_81
// 
assign PSW_81 = n1018;
// 
// XRAM_ADDR_82
// 
assign XRAM_ADDR_82 = n1000;
// 
// PC_82
// 
assign PC_82 = n0610;
// 
// XRAM_DATA_OUT_82
// 
assign XRAM_DATA_OUT_82 = n1001;
// 
// PSW_82
// 
assign n2087 = ( n1237 & n2038 );
assign n2088 = { ( n2087 ), ( n2040 ) };
assign n2089 = n2088[7:1];
assign n2090 = { ( n2089 ), ( n1017 ) };
assign PSW_82 = n2090;
// 
// ACC_83
// 
assign ACC_83 = RD_ROM_1;
// 
// XRAM_ADDR_83
// 
assign XRAM_ADDR_83 = n1000;
// 
// PC_83
// 
assign PC_83 = n0612;
// 
// XRAM_DATA_OUT_83
// 
assign XRAM_DATA_OUT_83 = n1001;
// 
// PSW_83
// 
assign PSW_83 = n2059;
// 
// ACC_84
// 
assign n2091 = ( B == n1001 );
assign n2092 = 8'hff;
assign n2093 = ( ACC / B );
assign n2094 = ( n2091 ) ? ( n2092 ) : ( n2093 );
assign ACC_84 = n2094;
// 
// B_84
// 
assign n2095 = ( ACC % B );
assign n2096 = ( n2091 ) ? ( ACC ) : ( n2095 );
assign B_84 = n2096;
// 
// XRAM_ADDR_84
// 
assign XRAM_ADDR_84 = n1000;
// 
// PC_84
// 
assign PC_84 = n0612;
// 
// XRAM_DATA_OUT_84
// 
assign XRAM_DATA_OUT_84 = n1001;
// 
// PSW_84
// 
assign n2097 = PSW[6:3];
assign n2098 = ( n2091 ) ? ( n0043 ) : ( n1061 );
assign n2099 = { ( n1061 ), ( n2097 ), ( n2098 ), ( n1244 ) };
assign n2100 = n2099[7:1];
assign n2101 = n2094[7:7];
assign n2102 = n2094[6:6];
assign n2103 = n2094[5:5];
assign n2104 = n2094[4:4];
assign n2105 = n2094[3:3];
assign n2106 = n2094[2:2];
assign n2107 = n2094[1:1];
assign n2108 = n2094[0:0];
assign n2109 = ( n2107 ^ n2108 );
assign n2110 = ( n2106 ^ n2109 );
assign n2111 = ( n2105 ^ n2110 );
assign n2112 = ( n2104 ^ n2111 );
assign n2113 = ( n2103 ^ n2112 );
assign n2114 = ( n2102 ^ n2113 );
assign n2115 = ( n2101 ^ n2114 );
assign n2116 = { ( n2100 ), ( n2115 ) };
assign PSW_84 = n2116;
// 
// ACC_85
// 
assign n2117 = RD_ROM_2[7:7];
assign n2118 = ( n2117 == n1061 );
assign n2119 = ( RD_ROM_2 == n1063 );
assign n2120 = ( RD_ROM_2 == n1065 );
assign n2121 = ( RD_ROM_2 == n0208 );
assign n2122 = ( RD_ROM_2 == n1068 );
assign n2123 = ( RD_ROM_2 == n0214 );
assign n2124 = ( RD_ROM_2 == n0216 );
assign n2125 = ( RD_ROM_2 == n0218 );
assign n2126 = ( RD_ROM_2 == n0220 );
assign n2127 = ( RD_ROM_2 == n0224 );
assign n2128 = ( RD_ROM_2 == n0222 );
assign n2129 = ( RD_ROM_2 == n0226 );
assign n2130 = ( RD_ROM_2 == n1077 );
assign n2131 = ( RD_ROM_2 == n0240 );
assign n2132 = ( RD_ROM_2 == n0242 );
assign n2133 = ( RD_ROM_2 == n0256 );
assign n2134 = ( RD_ROM_2 == n0264 );
assign n2135 = ( RD_ROM_2 == n0280 );
assign n2136 = ( RD_ROM_2 == n0290 );
assign n2137 = ( RD_ROM_2 == n0332 );
assign n2138 = ( RD_ROM_2 == n1059 );
assign n2139 = ( RD_ROM_2 == n1086 );
assign n2140 = ( n2139 ) ? ( B ) : ( n1001 );
assign n2141 = ( n2138 ) ? ( ACC ) : ( n2140 );
assign n2142 = ( n2137 ) ? ( PSW ) : ( n2141 );
assign n2143 = ( n2136 ) ? ( IP ) : ( n2142 );
assign n2144 = ( n2135 ) ? ( P3INREG ) : ( n2143 );
assign n2145 = ( n2134 ) ? ( IE ) : ( n2144 );
assign n2146 = ( n2133 ) ? ( P2INREG ) : ( n2145 );
assign n2147 = ( n2132 ) ? ( SBUF ) : ( n2146 );
assign n2148 = ( n2131 ) ? ( SCON ) : ( n2147 );
assign n2149 = ( n2130 ) ? ( P1INREG ) : ( n2148 );
assign n2150 = ( n2129 ) ? ( TH1 ) : ( n2149 );
assign n2151 = ( n2128 ) ? ( TL1 ) : ( n2150 );
assign n2152 = ( n2127 ) ? ( TH0 ) : ( n2151 );
assign n2153 = ( n2126 ) ? ( TL0 ) : ( n2152 );
assign n2154 = ( n2125 ) ? ( TMOD ) : ( n2153 );
assign n2155 = ( n2124 ) ? ( TCON ) : ( n2154 );
assign n2156 = ( n2123 ) ? ( PCON ) : ( n2155 );
assign n2157 = ( n2122 ) ? ( DPH ) : ( n2156 );
assign n2158 = ( n2121 ) ? ( DPL ) : ( n2157 );
assign n2159 = ( n2120 ) ? ( SP ) : ( n2158 );
assign n2160 = ( n2119 ) ? ( P0INREG ) : ( n2159 );
assign n2161 = ( n2118 ) ? ( RD_IRAM_0 ) : ( n2160 );
assign n2162 = ( n1060 ) ? ( n2161 ) : ( ACC );
assign ACC_85 = n2162;
// 
// P1_85
// 
assign n2163 = ( n1078 ) ? ( n2161 ) : ( P1 );
assign P1_85 = n2163;
// 
// DPL_85
// 
assign n2164 = ( n1067 ) ? ( n2161 ) : ( DPL );
assign DPL_85 = n2164;
// 
// DPH_85
// 
assign n2165 = ( n1069 ) ? ( n2161 ) : ( DPH );
assign DPH_85 = n2165;
// 
// XRAM_ADDR_85
// 
assign XRAM_ADDR_85 = n1000;
// 
// PC_85
// 
assign PC_85 = n1198;
// 
// P2_85
// 
assign n2166 = ( n1081 ) ? ( n2161 ) : ( P2 );
assign P2_85 = n2166;
// 
// P3_85
// 
assign n2167 = ( n1083 ) ? ( n2161 ) : ( P3 );
assign P3_85 = n2167;
// 
// P0_85
// 
assign n2168 = ( n1064 ) ? ( n2161 ) : ( P0 );
assign P0_85 = n2168;
// 
// B_85
// 
assign n2169 = ( n1087 ) ? ( n2161 ) : ( B );
assign B_85 = n2169;
// 
// IRAM_85
// 
// 
// XRAM_DATA_OUT_85
// 
assign XRAM_DATA_OUT_85 = n1001;
// 
// SP_85
// 
assign n2170 = ( n1066 ) ? ( n2161 ) : ( SP );
assign SP_85 = n2170;
// 
// PSW_85
// 
assign n2171 = ( n1085 ) ? ( n2161 ) : ( PSW );
assign n2172 = n2171[7:1];
assign n2173 = n2162[7:7];
assign n2174 = n2162[6:6];
assign n2175 = n2162[5:5];
assign n2176 = n2162[4:4];
assign n2177 = n2162[3:3];
assign n2178 = n2162[2:2];
assign n2179 = n2162[1:1];
assign n2180 = n2162[0:0];
assign n2181 = ( n2179 ^ n2180 );
assign n2182 = ( n2178 ^ n2181 );
assign n2183 = ( n2177 ^ n2182 );
assign n2184 = ( n2176 ^ n2183 );
assign n2185 = ( n2175 ^ n2184 );
assign n2186 = ( n2174 ^ n2185 );
assign n2187 = ( n2173 ^ n2186 );
assign n2188 = { ( n2172 ), ( n2187 ) };
assign PSW_85 = n2188;
// 
// ACC_86
// 
assign n2189 = ( n1060 ) ? ( RD_IRAM_1 ) : ( ACC );
assign ACC_86 = n2189;
// 
// P1_86
// 
assign n2190 = ( n1078 ) ? ( RD_IRAM_1 ) : ( P1 );
assign P1_86 = n2190;
// 
// DPL_86
// 
assign n2191 = ( n1067 ) ? ( RD_IRAM_1 ) : ( DPL );
assign DPL_86 = n2191;
// 
// DPH_86
// 
assign n2192 = ( n1069 ) ? ( RD_IRAM_1 ) : ( DPH );
assign DPH_86 = n2192;
// 
// XRAM_ADDR_86
// 
assign XRAM_ADDR_86 = n1000;
// 
// PC_86
// 
assign PC_86 = n0610;
// 
// P2_86
// 
assign n2193 = ( n1081 ) ? ( RD_IRAM_1 ) : ( P2 );
assign P2_86 = n2193;
// 
// P3_86
// 
assign n2194 = ( n1083 ) ? ( RD_IRAM_1 ) : ( P3 );
assign P3_86 = n2194;
// 
// P0_86
// 
assign n2195 = ( n1064 ) ? ( RD_IRAM_1 ) : ( P0 );
assign P0_86 = n2195;
// 
// B_86
// 
assign n2196 = ( n1087 ) ? ( RD_IRAM_1 ) : ( B );
assign B_86 = n2196;
// 
// IRAM_86
// 
// 
// XRAM_DATA_OUT_86
// 
assign XRAM_DATA_OUT_86 = n1001;
// 
// SP_86
// 
assign n2197 = ( n1066 ) ? ( RD_IRAM_1 ) : ( SP );
assign SP_86 = n2197;
// 
// PSW_86
// 
assign n2198 = ( n1085 ) ? ( RD_IRAM_1 ) : ( PSW );
assign n2199 = n2198[7:1];
assign n2200 = n2189[7:7];
assign n2201 = n2189[6:6];
assign n2202 = n2189[5:5];
assign n2203 = n2189[4:4];
assign n2204 = n2189[3:3];
assign n2205 = n2189[2:2];
assign n2206 = n2189[1:1];
assign n2207 = n2189[0:0];
assign n2208 = ( n2206 ^ n2207 );
assign n2209 = ( n2205 ^ n2208 );
assign n2210 = ( n2204 ^ n2209 );
assign n2211 = ( n2203 ^ n2210 );
assign n2212 = ( n2202 ^ n2211 );
assign n2213 = ( n2201 ^ n2212 );
assign n2214 = ( n2200 ^ n2213 );
assign n2215 = { ( n2199 ), ( n2214 ) };
assign PSW_86 = n2215;
// 
// ACC_87
// 
assign ACC_87 = n2189;
// 
// B_87
// 
assign B_87 = n2196;
// 
// DPL_87
// 
assign DPL_87 = n2191;
// 
// DPH_87
// 
assign DPH_87 = n2192;
// 
// XRAM_ADDR_87
// 
assign XRAM_ADDR_87 = n1000;
// 
// PC_87
// 
assign PC_87 = n0610;
// 
// P2_87
// 
assign P2_87 = n2193;
// 
// P3_87
// 
assign P3_87 = n2194;
// 
// P0_87
// 
assign P0_87 = n2195;
// 
// P1_87
// 
assign P1_87 = n2190;
// 
// IRAM_87
// 
// 
// XRAM_DATA_OUT_87
// 
assign XRAM_DATA_OUT_87 = n1001;
// 
// SP_87
// 
assign SP_87 = n2197;
// 
// PSW_87
// 
assign PSW_87 = n2215;
// 
// ACC_88
// 
assign n2216 = ( n1060 ) ? ( RD_IRAM_0 ) : ( ACC );
assign ACC_88 = n2216;
// 
// B_88
// 
assign n2217 = ( n1087 ) ? ( RD_IRAM_0 ) : ( B );
assign B_88 = n2217;
// 
// DPL_88
// 
assign n2218 = ( n1067 ) ? ( RD_IRAM_0 ) : ( DPL );
assign DPL_88 = n2218;
// 
// DPH_88
// 
assign n2219 = ( n1069 ) ? ( RD_IRAM_0 ) : ( DPH );
assign DPH_88 = n2219;
// 
// XRAM_ADDR_88
// 
assign XRAM_ADDR_88 = n1000;
// 
// PC_88
// 
assign PC_88 = n0610;
// 
// P2_88
// 
assign n2220 = ( n1081 ) ? ( RD_IRAM_0 ) : ( P2 );
assign P2_88 = n2220;
// 
// P3_88
// 
assign n2221 = ( n1083 ) ? ( RD_IRAM_0 ) : ( P3 );
assign P3_88 = n2221;
// 
// P0_88
// 
assign n2222 = ( n1064 ) ? ( RD_IRAM_0 ) : ( P0 );
assign P0_88 = n2222;
// 
// P1_88
// 
assign n2223 = ( n1078 ) ? ( RD_IRAM_0 ) : ( P1 );
assign P1_88 = n2223;
// 
// IRAM_88
// 
// 
// XRAM_DATA_OUT_88
// 
assign XRAM_DATA_OUT_88 = n1001;
// 
// SP_88
// 
assign n2224 = ( n1066 ) ? ( RD_IRAM_0 ) : ( SP );
assign SP_88 = n2224;
// 
// PSW_88
// 
assign n2225 = ( n1085 ) ? ( RD_IRAM_0 ) : ( PSW );
assign n2226 = n2225[7:1];
assign n2227 = n2216[7:7];
assign n2228 = n2216[6:6];
assign n2229 = n2216[5:5];
assign n2230 = n2216[4:4];
assign n2231 = n2216[3:3];
assign n2232 = n2216[2:2];
assign n2233 = n2216[1:1];
assign n2234 = n2216[0:0];
assign n2235 = ( n2233 ^ n2234 );
assign n2236 = ( n2232 ^ n2235 );
assign n2237 = ( n2231 ^ n2236 );
assign n2238 = ( n2230 ^ n2237 );
assign n2239 = ( n2229 ^ n2238 );
assign n2240 = ( n2228 ^ n2239 );
assign n2241 = ( n2227 ^ n2240 );
assign n2242 = { ( n2226 ), ( n2241 ) };
assign PSW_88 = n2242;
// 
// ACC_89
// 
assign ACC_89 = n2216;
// 
// B_89
// 
assign B_89 = n2217;
// 
// DPL_89
// 
assign DPL_89 = n2218;
// 
// DPH_89
// 
assign DPH_89 = n2219;
// 
// XRAM_ADDR_89
// 
assign XRAM_ADDR_89 = n1000;
// 
// PC_89
// 
assign PC_89 = n0610;
// 
// P2_89
// 
assign P2_89 = n2220;
// 
// P3_89
// 
assign P3_89 = n2221;
// 
// P0_89
// 
assign P0_89 = n2222;
// 
// P1_89
// 
assign P1_89 = n2223;
// 
// IRAM_89
// 
// 
// XRAM_DATA_OUT_89
// 
assign XRAM_DATA_OUT_89 = n1001;
// 
// SP_89
// 
assign SP_89 = n2224;
// 
// PSW_89
// 
assign PSW_89 = n2242;
// 
// ACC_8a
// 
assign ACC_8a = n2216;
// 
// P1_8a
// 
assign P1_8a = n2223;
// 
// DPL_8a
// 
assign DPL_8a = n2218;
// 
// DPH_8a
// 
assign DPH_8a = n2219;
// 
// XRAM_ADDR_8a
// 
assign XRAM_ADDR_8a = n1000;
// 
// PC_8a
// 
assign PC_8a = n0610;
// 
// P2_8a
// 
assign P2_8a = n2220;
// 
// P3_8a
// 
assign P3_8a = n2221;
// 
// P0_8a
// 
assign P0_8a = n2222;
// 
// B_8a
// 
assign B_8a = n2217;
// 
// IRAM_8a
// 
// 
// XRAM_DATA_OUT_8a
// 
assign XRAM_DATA_OUT_8a = n1001;
// 
// SP_8a
// 
assign SP_8a = n2224;
// 
// PSW_8a
// 
assign PSW_8a = n2242;
// 
// ACC_8b
// 
assign ACC_8b = n2216;
// 
// B_8b
// 
assign B_8b = n2217;
// 
// DPL_8b
// 
assign DPL_8b = n2218;
// 
// DPH_8b
// 
assign DPH_8b = n2219;
// 
// XRAM_ADDR_8b
// 
assign XRAM_ADDR_8b = n1000;
// 
// PC_8b
// 
assign PC_8b = n0610;
// 
// P2_8b
// 
assign P2_8b = n2220;
// 
// P3_8b
// 
assign P3_8b = n2221;
// 
// P0_8b
// 
assign P0_8b = n2222;
// 
// P1_8b
// 
assign P1_8b = n2223;
// 
// IRAM_8b
// 
// 
// XRAM_DATA_OUT_8b
// 
assign XRAM_DATA_OUT_8b = n1001;
// 
// SP_8b
// 
assign SP_8b = n2224;
// 
// PSW_8b
// 
assign PSW_8b = n2242;
// 
// ACC_8c
// 
assign ACC_8c = n2216;
// 
// B_8c
// 
assign B_8c = n2217;
// 
// DPL_8c
// 
assign DPL_8c = n2218;
// 
// DPH_8c
// 
assign DPH_8c = n2219;
// 
// XRAM_ADDR_8c
// 
assign XRAM_ADDR_8c = n1000;
// 
// PC_8c
// 
assign PC_8c = n0610;
// 
// P2_8c
// 
assign P2_8c = n2220;
// 
// P3_8c
// 
assign P3_8c = n2221;
// 
// P0_8c
// 
assign P0_8c = n2222;
// 
// P1_8c
// 
assign P1_8c = n2223;
// 
// IRAM_8c
// 
// 
// XRAM_DATA_OUT_8c
// 
assign XRAM_DATA_OUT_8c = n1001;
// 
// SP_8c
// 
assign SP_8c = n2224;
// 
// PSW_8c
// 
assign PSW_8c = n2242;
// 
// ACC_8d
// 
assign ACC_8d = n2216;
// 
// B_8d
// 
assign B_8d = n2217;
// 
// DPL_8d
// 
assign DPL_8d = n2218;
// 
// DPH_8d
// 
assign DPH_8d = n2219;
// 
// XRAM_ADDR_8d
// 
assign XRAM_ADDR_8d = n1000;
// 
// PC_8d
// 
assign PC_8d = n0610;
// 
// P2_8d
// 
assign P2_8d = n2220;
// 
// P3_8d
// 
assign P3_8d = n2221;
// 
// P0_8d
// 
assign P0_8d = n2222;
// 
// P1_8d
// 
assign P1_8d = n2223;
// 
// IRAM_8d
// 
// 
// XRAM_DATA_OUT_8d
// 
assign XRAM_DATA_OUT_8d = n1001;
// 
// SP_8d
// 
assign SP_8d = n2224;
// 
// PSW_8d
// 
assign PSW_8d = n2242;
// 
// ACC_8e
// 
assign ACC_8e = n2216;
// 
// B_8e
// 
assign B_8e = n2217;
// 
// DPL_8e
// 
assign DPL_8e = n2218;
// 
// DPH_8e
// 
assign DPH_8e = n2219;
// 
// XRAM_ADDR_8e
// 
assign XRAM_ADDR_8e = n1000;
// 
// PC_8e
// 
assign PC_8e = n0610;
// 
// P2_8e
// 
assign P2_8e = n2220;
// 
// P3_8e
// 
assign P3_8e = n2221;
// 
// P0_8e
// 
assign P0_8e = n2222;
// 
// P1_8e
// 
assign P1_8e = n2223;
// 
// IRAM_8e
// 
// 
// XRAM_DATA_OUT_8e
// 
assign XRAM_DATA_OUT_8e = n1001;
// 
// SP_8e
// 
assign SP_8e = n2224;
// 
// PSW_8e
// 
assign PSW_8e = n2242;
// 
// ACC_8f
// 
assign ACC_8f = n2216;
// 
// B_8f
// 
assign B_8f = n2217;
// 
// DPL_8f
// 
assign DPL_8f = n2218;
// 
// DPH_8f
// 
assign DPH_8f = n2219;
// 
// XRAM_ADDR_8f
// 
assign XRAM_ADDR_8f = n1000;
// 
// PC_8f
// 
assign PC_8f = n0610;
// 
// P2_8f
// 
assign P2_8f = n2220;
// 
// P3_8f
// 
assign P3_8f = n2221;
// 
// P0_8f
// 
assign P0_8f = n2222;
// 
// P1_8f
// 
assign P1_8f = n2223;
// 
// IRAM_8f
// 
// 
// XRAM_DATA_OUT_8f
// 
assign XRAM_DATA_OUT_8f = n1001;
// 
// SP_8f
// 
assign SP_8f = n2224;
// 
// PSW_8f
// 
assign PSW_8f = n2242;
// 
// DPL_90
// 
assign n2243 = n1024[7:0];
assign DPL_90 = n2243;
// 
// DPH_90
// 
assign n2244 = n1024[15:8];
assign DPH_90 = n2244;
// 
// XRAM_ADDR_90
// 
assign XRAM_ADDR_90 = n1000;
// 
// PC_90
// 
assign PC_90 = n1198;
// 
// XRAM_DATA_OUT_90
// 
assign XRAM_DATA_OUT_90 = n1001;
// 
// PSW_90
// 
assign PSW_90 = n1018;
// 
// XRAM_ADDR_91
// 
assign XRAM_ADDR_91 = n1000;
// 
// PC_91
// 
assign PC_91 = n1023;
// 
// IRAM_91
// 
// 
// XRAM_DATA_OUT_91
// 
assign XRAM_DATA_OUT_91 = n1001;
// 
// SP_91
// 
assign SP_91 = n1234;
// 
// PSW_91
// 
assign PSW_91 = n1018;
// 
// ACC_92
// 
assign n2245 = ( n1552 << n1152 );
assign n2246 = ( n1179 | n2245 );
assign n2247 = ( n1150 ) ? ( n2246 ) : ( ACC );
assign ACC_92 = n2247;
// 
// P1_92
// 
assign n2248 = ( n1192 | n2245 );
assign n2249 = ( n1159 ) ? ( n2248 ) : ( P1 );
assign P1_92 = n2249;
// 
// XRAM_ADDR_92
// 
assign XRAM_ADDR_92 = n1000;
// 
// PC_92
// 
assign PC_92 = n0610;
// 
// P2_92
// 
assign n2250 = ( n1161 ) ? ( n2248 ) : ( P2 );
assign P2_92 = n2250;
// 
// P3_92
// 
assign n2251 = ( n1163 ) ? ( n2248 ) : ( P3 );
assign P3_92 = n2251;
// 
// P0_92
// 
assign n2252 = ( n1157 ) ? ( n2248 ) : ( P0 );
assign P0_92 = n2252;
// 
// B_92
// 
assign n2253 = ( n1166 ) ? ( n2246 ) : ( B );
assign B_92 = n2253;
// 
// IRAM_92
// 
// 
// XRAM_DATA_OUT_92
// 
assign XRAM_DATA_OUT_92 = n1001;
// 
// PSW_92
// 
assign n2254 = ( n1165 ) ? ( n2246 ) : ( PSW );
assign n2255 = n2254[7:1];
assign n2256 = n2247[7:7];
assign n2257 = n2247[6:6];
assign n2258 = n2247[5:5];
assign n2259 = n2247[4:4];
assign n2260 = n2247[3:3];
assign n2261 = n2247[2:2];
assign n2262 = n2247[1:1];
assign n2263 = n2247[0:0];
assign n2264 = ( n2262 ^ n2263 );
assign n2265 = ( n2261 ^ n2264 );
assign n2266 = ( n2260 ^ n2265 );
assign n2267 = ( n2259 ^ n2266 );
assign n2268 = ( n2258 ^ n2267 );
assign n2269 = ( n2257 ^ n2268 );
assign n2270 = ( n2256 ^ n2269 );
assign n2271 = { ( n2255 ), ( n2270 ) };
assign PSW_92 = n2271;
// 
// ACC_93
// 
assign ACC_93 = RD_ROM_1;
// 
// XRAM_ADDR_93
// 
assign XRAM_ADDR_93 = n1000;
// 
// PC_93
// 
assign PC_93 = n0612;
// 
// XRAM_DATA_OUT_93
// 
assign XRAM_DATA_OUT_93 = n1001;
// 
// PSW_93
// 
assign PSW_93 = n2059;
// 
// ACC_94
// 
assign n2272 = ( ACC - RD_ROM_1 );
assign n2273 = { n1237[0], n1237[0], n1237[0], n1237[0], n1237[0], n1237[0], n1237[0], n1237 };
assign n2274 = ( n2272 + n2273 );
assign ACC_94 = n2274;
// 
// XRAM_ADDR_94
// 
assign XRAM_ADDR_94 = n1000;
// 
// PC_94
// 
assign PC_94 = n0610;
// 
// XRAM_DATA_OUT_94
// 
assign XRAM_DATA_OUT_94 = n1001;
// 
// PSW_94
// 
assign n2275 = ( n1330 < n1556 );
assign n2276 = ( n2275 ) ? ( n0043 ) : ( n1061 );
assign n2277 = ( n1337 < n1560 );
assign n2278 = ( n2277 ) ? ( n0043 ) : ( n1061 );
assign n2279 = ( n1343 - n1563 );
assign n2280 = n2279[8:8];
assign n2281 = n2279[7:7];
assign n2282 = ( n2280 == n2281 );
assign n2283 = !( n2282 );
assign n2284 = ( n2283 ) ? ( n0043 ) : ( n1061 );
assign n2285 = { ( n2276 ), ( n2278 ), ( n1242 ), ( n2284 ), ( n1244 ) };
assign n2286 = n2285[7:1];
assign n2287 = n2274[7:7];
assign n2288 = n2274[6:6];
assign n2289 = n2274[5:5];
assign n2290 = n2274[4:4];
assign n2291 = n2274[3:3];
assign n2292 = n2274[2:2];
assign n2293 = n2274[1:1];
assign n2294 = n2274[0:0];
assign n2295 = ( n2293 ^ n2294 );
assign n2296 = ( n2292 ^ n2295 );
assign n2297 = ( n2291 ^ n2296 );
assign n2298 = ( n2290 ^ n2297 );
assign n2299 = ( n2289 ^ n2298 );
assign n2300 = ( n2288 ^ n2299 );
assign n2301 = ( n2287 ^ n2300 );
assign n2302 = { ( n2286 ), ( n2301 ) };
assign PSW_94 = n2302;
// 
// ACC_95
// 
assign n2303 = ( ACC - n1387 );
assign n2304 = ( n2303 + n2273 );
assign ACC_95 = n2304;
// 
// XRAM_ADDR_95
// 
assign XRAM_ADDR_95 = n1000;
// 
// PC_95
// 
assign PC_95 = n0610;
// 
// XRAM_DATA_OUT_95
// 
assign XRAM_DATA_OUT_95 = n1001;
// 
// PSW_95
// 
assign n2305 = ( n1330 < n1590 );
assign n2306 = ( n2305 ) ? ( n0043 ) : ( n1061 );
assign n2307 = ( n1337 < n1593 );
assign n2308 = ( n2307 ) ? ( n0043 ) : ( n1061 );
assign n2309 = ( n1343 - n1596 );
assign n2310 = n2309[8:8];
assign n2311 = n2309[7:7];
assign n2312 = ( n2310 == n2311 );
assign n2313 = !( n2312 );
assign n2314 = ( n2313 ) ? ( n0043 ) : ( n1061 );
assign n2315 = { ( n2306 ), ( n2308 ), ( n1242 ), ( n2314 ), ( n1244 ) };
assign n2316 = n2315[7:1];
assign n2317 = n2304[7:7];
assign n2318 = n2304[6:6];
assign n2319 = n2304[5:5];
assign n2320 = n2304[4:4];
assign n2321 = n2304[3:3];
assign n2322 = n2304[2:2];
assign n2323 = n2304[1:1];
assign n2324 = n2304[0:0];
assign n2325 = ( n2323 ^ n2324 );
assign n2326 = ( n2322 ^ n2325 );
assign n2327 = ( n2321 ^ n2326 );
assign n2328 = ( n2320 ^ n2327 );
assign n2329 = ( n2319 ^ n2328 );
assign n2330 = ( n2318 ^ n2329 );
assign n2331 = ( n2317 ^ n2330 );
assign n2332 = { ( n2316 ), ( n2331 ) };
assign PSW_95 = n2332;
// 
// ACC_96
// 
assign n2333 = ( ACC - RD_IRAM_1 );
assign n2334 = ( n2333 + n2273 );
assign ACC_96 = n2334;
// 
// XRAM_ADDR_96
// 
assign XRAM_ADDR_96 = n1000;
// 
// PC_96
// 
assign PC_96 = n0612;
// 
// XRAM_DATA_OUT_96
// 
assign XRAM_DATA_OUT_96 = n1001;
// 
// PSW_96
// 
assign n2335 = ( n1330 < n1623 );
assign n2336 = ( n2335 ) ? ( n0043 ) : ( n1061 );
assign n2337 = ( n1337 < n1626 );
assign n2338 = ( n2337 ) ? ( n0043 ) : ( n1061 );
assign n2339 = ( n1343 - n1629 );
assign n2340 = n2339[8:8];
assign n2341 = n2339[7:7];
assign n2342 = ( n2340 == n2341 );
assign n2343 = !( n2342 );
assign n2344 = ( n2343 ) ? ( n0043 ) : ( n1061 );
assign n2345 = { ( n2336 ), ( n2338 ), ( n1242 ), ( n2344 ), ( n1244 ) };
assign n2346 = n2345[7:1];
assign n2347 = n2334[7:7];
assign n2348 = n2334[6:6];
assign n2349 = n2334[5:5];
assign n2350 = n2334[4:4];
assign n2351 = n2334[3:3];
assign n2352 = n2334[2:2];
assign n2353 = n2334[1:1];
assign n2354 = n2334[0:0];
assign n2355 = ( n2353 ^ n2354 );
assign n2356 = ( n2352 ^ n2355 );
assign n2357 = ( n2351 ^ n2356 );
assign n2358 = ( n2350 ^ n2357 );
assign n2359 = ( n2349 ^ n2358 );
assign n2360 = ( n2348 ^ n2359 );
assign n2361 = ( n2347 ^ n2360 );
assign n2362 = { ( n2346 ), ( n2361 ) };
assign PSW_96 = n2362;
// 
// ACC_97
// 
assign ACC_97 = n2334;
// 
// XRAM_ADDR_97
// 
assign XRAM_ADDR_97 = n1000;
// 
// PC_97
// 
assign PC_97 = n0612;
// 
// XRAM_DATA_OUT_97
// 
assign XRAM_DATA_OUT_97 = n1001;
// 
// PSW_97
// 
assign PSW_97 = n2362;
// 
// ACC_98
// 
assign n2363 = ( ACC - RD_IRAM_0 );
assign n2364 = ( n2363 + n2273 );
assign ACC_98 = n2364;
// 
// XRAM_ADDR_98
// 
assign XRAM_ADDR_98 = n1000;
// 
// PC_98
// 
assign PC_98 = n0612;
// 
// XRAM_DATA_OUT_98
// 
assign XRAM_DATA_OUT_98 = n1001;
// 
// PSW_98
// 
assign n2365 = ( n1330 < n1656 );
assign n2366 = ( n2365 ) ? ( n0043 ) : ( n1061 );
assign n2367 = ( n1337 < n1659 );
assign n2368 = ( n2367 ) ? ( n0043 ) : ( n1061 );
assign n2369 = ( n1343 - n1662 );
assign n2370 = n2369[8:8];
assign n2371 = n2369[7:7];
assign n2372 = ( n2370 == n2371 );
assign n2373 = !( n2372 );
assign n2374 = ( n2373 ) ? ( n0043 ) : ( n1061 );
assign n2375 = { ( n2366 ), ( n2368 ), ( n1242 ), ( n2374 ), ( n1244 ) };
assign n2376 = n2375[7:1];
assign n2377 = n2364[7:7];
assign n2378 = n2364[6:6];
assign n2379 = n2364[5:5];
assign n2380 = n2364[4:4];
assign n2381 = n2364[3:3];
assign n2382 = n2364[2:2];
assign n2383 = n2364[1:1];
assign n2384 = n2364[0:0];
assign n2385 = ( n2383 ^ n2384 );
assign n2386 = ( n2382 ^ n2385 );
assign n2387 = ( n2381 ^ n2386 );
assign n2388 = ( n2380 ^ n2387 );
assign n2389 = ( n2379 ^ n2388 );
assign n2390 = ( n2378 ^ n2389 );
assign n2391 = ( n2377 ^ n2390 );
assign n2392 = { ( n2376 ), ( n2391 ) };
assign PSW_98 = n2392;
// 
// ACC_99
// 
assign ACC_99 = n2364;
// 
// XRAM_ADDR_99
// 
assign XRAM_ADDR_99 = n1000;
// 
// PC_99
// 
assign PC_99 = n0612;
// 
// XRAM_DATA_OUT_99
// 
assign XRAM_DATA_OUT_99 = n1001;
// 
// PSW_99
// 
assign PSW_99 = n2392;
// 
// ACC_9a
// 
assign ACC_9a = n2364;
// 
// XRAM_ADDR_9a
// 
assign XRAM_ADDR_9a = n1000;
// 
// PC_9a
// 
assign PC_9a = n0612;
// 
// XRAM_DATA_OUT_9a
// 
assign XRAM_DATA_OUT_9a = n1001;
// 
// PSW_9a
// 
assign PSW_9a = n2392;
// 
// ACC_9b
// 
assign ACC_9b = n2364;
// 
// XRAM_ADDR_9b
// 
assign XRAM_ADDR_9b = n1000;
// 
// PC_9b
// 
assign PC_9b = n0612;
// 
// XRAM_DATA_OUT_9b
// 
assign XRAM_DATA_OUT_9b = n1001;
// 
// PSW_9b
// 
assign PSW_9b = n2392;
// 
// ACC_9c
// 
assign ACC_9c = n2364;
// 
// XRAM_ADDR_9c
// 
assign XRAM_ADDR_9c = n1000;
// 
// PC_9c
// 
assign PC_9c = n0612;
// 
// XRAM_DATA_OUT_9c
// 
assign XRAM_DATA_OUT_9c = n1001;
// 
// PSW_9c
// 
assign PSW_9c = n2392;
// 
// ACC_9d
// 
assign ACC_9d = n2364;
// 
// XRAM_ADDR_9d
// 
assign XRAM_ADDR_9d = n1000;
// 
// PC_9d
// 
assign PC_9d = n0612;
// 
// XRAM_DATA_OUT_9d
// 
assign XRAM_DATA_OUT_9d = n1001;
// 
// PSW_9d
// 
assign PSW_9d = n2392;
// 
// ACC_9e
// 
assign ACC_9e = n2364;
// 
// XRAM_ADDR_9e
// 
assign XRAM_ADDR_9e = n1000;
// 
// PC_9e
// 
assign PC_9e = n0612;
// 
// XRAM_DATA_OUT_9e
// 
assign XRAM_DATA_OUT_9e = n1001;
// 
// PSW_9e
// 
assign PSW_9e = n2392;
// 
// ACC_9f
// 
assign ACC_9f = n2364;
// 
// XRAM_ADDR_9f
// 
assign XRAM_ADDR_9f = n1000;
// 
// PC_9f
// 
assign PC_9f = n0612;
// 
// XRAM_DATA_OUT_9f
// 
assign XRAM_DATA_OUT_9f = n1001;
// 
// PSW_9f
// 
assign PSW_9f = n2392;
// 
// XRAM_ADDR_a0
// 
assign XRAM_ADDR_a0 = n1000;
// 
// PC_a0
// 
assign PC_a0 = n0610;
// 
// XRAM_DATA_OUT_a0
// 
assign XRAM_DATA_OUT_a0 = n1001;
// 
// PSW_a0
// 
assign n2393 = ~( n2038 );
assign n2394 = ( n1237 | n2393 );
assign n2395 = { ( n2394 ), ( n2040 ) };
assign n2396 = n2395[7:1];
assign n2397 = { ( n2396 ), ( n1017 ) };
assign PSW_a0 = n2397;
// 
// XRAM_ADDR_a1
// 
assign XRAM_ADDR_a1 = n1000;
// 
// PC_a1
// 
assign PC_a1 = n1023;
// 
// XRAM_DATA_OUT_a1
// 
assign XRAM_DATA_OUT_a1 = n1001;
// 
// PSW_a1
// 
assign PSW_a1 = n1018;
// 
// XRAM_ADDR_a2
// 
assign XRAM_ADDR_a2 = n1000;
// 
// PC_a2
// 
assign PC_a2 = n0610;
// 
// XRAM_DATA_OUT_a2
// 
assign XRAM_DATA_OUT_a2 = n1001;
// 
// PSW_a2
// 
assign n2398 = { ( n1195 ), ( n2040 ) };
assign n2399 = n2398[7:1];
assign n2400 = { ( n2399 ), ( n1017 ) };
assign PSW_a2 = n2400;
// 
// DPL_a3
// 
assign n2401 = ( n0745 + n0607 );
assign n2402 = n2401[7:0];
assign DPL_a3 = n2402;
// 
// DPH_a3
// 
assign n2403 = n2401[15:8];
assign DPH_a3 = n2403;
// 
// XRAM_ADDR_a3
// 
assign XRAM_ADDR_a3 = n1000;
// 
// PC_a3
// 
assign PC_a3 = n0612;
// 
// XRAM_DATA_OUT_a3
// 
assign XRAM_DATA_OUT_a3 = n1001;
// 
// PSW_a3
// 
assign PSW_a3 = n1018;
// 
// ACC_a4
// 
assign n2404 = { 8'b0, B };
assign n2405 = ( n0713 * n2404 );
assign n2406 = n2405[7:0];
assign ACC_a4 = n2406;
// 
// XRAM_ADDR_a4
// 
assign XRAM_ADDR_a4 = n1000;
// 
// PC_a4
// 
assign PC_a4 = n0612;
// 
// B_a4
// 
assign n2407 = n2405[15:8];
assign B_a4 = n2407;
// 
// XRAM_DATA_OUT_a4
// 
assign XRAM_DATA_OUT_a4 = n1001;
// 
// PSW_a4
// 
assign n2408 = ( n2407 == n1001 );
assign n2409 = !( n2408 );
assign n2410 = ( n2409 ) ? ( n0043 ) : ( n1061 );
assign n2411 = { ( n1061 ), ( n2097 ), ( n2410 ), ( n1244 ) };
assign n2412 = n2411[7:1];
assign n2413 = n2406[7:7];
assign n2414 = n2406[6:6];
assign n2415 = n2406[5:5];
assign n2416 = n2406[4:4];
assign n2417 = n2406[3:3];
assign n2418 = n2406[2:2];
assign n2419 = n2406[1:1];
assign n2420 = n2406[0:0];
assign n2421 = ( n2419 ^ n2420 );
assign n2422 = ( n2418 ^ n2421 );
assign n2423 = ( n2417 ^ n2422 );
assign n2424 = ( n2416 ^ n2423 );
assign n2425 = ( n2415 ^ n2424 );
assign n2426 = ( n2414 ^ n2425 );
assign n2427 = ( n2413 ^ n2426 );
assign n2428 = { ( n2412 ), ( n2427 ) };
assign PSW_a4 = n2428;
// 
// XRAM_ADDR_a5
// 
assign XRAM_ADDR_a5 = n1000;
// 
// PC_a5
// 
assign PC_a5 = n0612;
// 
// XRAM_DATA_OUT_a5
// 
assign XRAM_DATA_OUT_a5 = n1001;
// 
// PSW_a5
// 
assign PSW_a5 = n1018;
// 
// XRAM_ADDR_a6
// 
assign XRAM_ADDR_a6 = n1000;
// 
// PC_a6
// 
assign PC_a6 = n0610;
// 
// IRAM_a6
// 
assign n2429 = ( n1062 ) ? ( RD_IRAM_1 ) : ( n1386 );
// 
// XRAM_DATA_OUT_a6
// 
assign XRAM_DATA_OUT_a6 = n1001;
// 
// PSW_a6
// 
assign PSW_a6 = n1018;
// 
// XRAM_ADDR_a7
// 
assign XRAM_ADDR_a7 = n1000;
// 
// PC_a7
// 
assign PC_a7 = n0610;
// 
// IRAM_a7
// 
// 
// XRAM_DATA_OUT_a7
// 
assign XRAM_DATA_OUT_a7 = n1001;
// 
// PSW_a7
// 
assign PSW_a7 = n1018;
// 
// XRAM_ADDR_a8
// 
assign XRAM_ADDR_a8 = n1000;
// 
// PC_a8
// 
assign PC_a8 = n0610;
// 
// IRAM_a8
// 
// 
// XRAM_DATA_OUT_a8
// 
assign XRAM_DATA_OUT_a8 = n1001;
// 
// PSW_a8
// 
assign PSW_a8 = n1018;
// 
// XRAM_ADDR_a9
// 
assign XRAM_ADDR_a9 = n1000;
// 
// PC_a9
// 
assign PC_a9 = n0610;
// 
// IRAM_a9
// 
// 
// XRAM_DATA_OUT_a9
// 
assign XRAM_DATA_OUT_a9 = n1001;
// 
// PSW_a9
// 
assign PSW_a9 = n1018;
// 
// XRAM_ADDR_aa
// 
assign XRAM_ADDR_aa = n1000;
// 
// PC_aa
// 
assign PC_aa = n0610;
// 
// IRAM_aa
// 
// 
// XRAM_DATA_OUT_aa
// 
assign XRAM_DATA_OUT_aa = n1001;
// 
// PSW_aa
// 
assign PSW_aa = n1018;
// 
// XRAM_ADDR_ab
// 
assign XRAM_ADDR_ab = n1000;
// 
// PC_ab
// 
assign PC_ab = n0610;
// 
// IRAM_ab
// 
// 
// XRAM_DATA_OUT_ab
// 
assign XRAM_DATA_OUT_ab = n1001;
// 
// PSW_ab
// 
assign PSW_ab = n1018;
// 
// XRAM_ADDR_ac
// 
assign XRAM_ADDR_ac = n1000;
// 
// PC_ac
// 
assign PC_ac = n0610;
// 
// IRAM_ac
// 
// 
// XRAM_DATA_OUT_ac
// 
assign XRAM_DATA_OUT_ac = n1001;
// 
// PSW_ac
// 
assign PSW_ac = n1018;
// 
// XRAM_ADDR_ad
// 
assign XRAM_ADDR_ad = n1000;
// 
// PC_ad
// 
assign PC_ad = n0610;
// 
// IRAM_ad
// 
// 
// XRAM_DATA_OUT_ad
// 
assign XRAM_DATA_OUT_ad = n1001;
// 
// PSW_ad
// 
assign PSW_ad = n1018;
// 
// XRAM_ADDR_ae
// 
assign XRAM_ADDR_ae = n1000;
// 
// PC_ae
// 
assign PC_ae = n0610;
// 
// IRAM_ae
// 
// 
// XRAM_DATA_OUT_ae
// 
assign XRAM_DATA_OUT_ae = n1001;
// 
// PSW_ae
// 
assign PSW_ae = n1018;
// 
// XRAM_ADDR_af
// 
assign XRAM_ADDR_af = n1000;
// 
// PC_af
// 
assign PC_af = n0610;
// 
// IRAM_af
// 
// 
// XRAM_DATA_OUT_af
// 
assign XRAM_DATA_OUT_af = n1001;
// 
// PSW_af
// 
assign PSW_af = n1018;
// 
// XRAM_ADDR_b0
// 
assign XRAM_ADDR_b0 = n1000;
// 
// PC_b0
// 
assign PC_b0 = n0610;
// 
// XRAM_DATA_OUT_b0
// 
assign XRAM_DATA_OUT_b0 = n1001;
// 
// PSW_b0
// 
assign n2430 = ( n1237 & n2393 );
assign n2431 = { ( n2430 ), ( n2040 ) };
assign n2432 = n2431[7:1];
assign n2433 = { ( n2432 ), ( n1017 ) };
assign PSW_b0 = n2433;
// 
// XRAM_ADDR_b1
// 
assign XRAM_ADDR_b1 = n1000;
// 
// PC_b1
// 
assign PC_b1 = n1023;
// 
// IRAM_b1
// 
// 
// XRAM_DATA_OUT_b1
// 
assign XRAM_DATA_OUT_b1 = n1001;
// 
// SP_b1
// 
assign SP_b1 = n1234;
// 
// PSW_b1
// 
assign PSW_b1 = n1018;
// 
// ACC_b2
// 
assign n2434 = { 7'b0, n2393 };
assign n2435 = ( n2434 << n1152 );
assign n2436 = ( n1192 | n2435 );
assign n2437 = ( n1150 ) ? ( n2436 ) : ( ACC );
assign ACC_b2 = n2437;
// 
// B_b2
// 
assign n2438 = ( n1166 ) ? ( n2436 ) : ( B );
assign B_b2 = n2438;
// 
// XRAM_ADDR_b2
// 
assign XRAM_ADDR_b2 = n1000;
// 
// PC_b2
// 
assign PC_b2 = n0610;
// 
// P2_b2
// 
assign n2439 = ( n1161 ) ? ( n2436 ) : ( P2 );
assign P2_b2 = n2439;
// 
// P3_b2
// 
assign n2440 = ( n1163 ) ? ( n2436 ) : ( P3 );
assign P3_b2 = n2440;
// 
// P0_b2
// 
assign n2441 = ( n1157 ) ? ( n2436 ) : ( P0 );
assign P0_b2 = n2441;
// 
// P1_b2
// 
assign n2442 = ( n1159 ) ? ( n2436 ) : ( P1 );
assign P1_b2 = n2442;
// 
// IRAM_b2
// 
// 
// XRAM_DATA_OUT_b2
// 
assign XRAM_DATA_OUT_b2 = n1001;
// 
// PSW_b2
// 
assign n2443 = ( n1165 ) ? ( n2436 ) : ( PSW );
assign n2444 = n2443[7:1];
assign n2445 = n2437[7:7];
assign n2446 = n2437[6:6];
assign n2447 = n2437[5:5];
assign n2448 = n2437[4:4];
assign n2449 = n2437[3:3];
assign n2450 = n2437[2:2];
assign n2451 = n2437[1:1];
assign n2452 = n2437[0:0];
assign n2453 = ( n2451 ^ n2452 );
assign n2454 = ( n2450 ^ n2453 );
assign n2455 = ( n2449 ^ n2454 );
assign n2456 = ( n2448 ^ n2455 );
assign n2457 = ( n2447 ^ n2456 );
assign n2458 = ( n2446 ^ n2457 );
assign n2459 = ( n2445 ^ n2458 );
assign n2460 = { ( n2444 ), ( n2459 ) };
assign PSW_b2 = n2460;
// 
// XRAM_ADDR_b3
// 
assign XRAM_ADDR_b3 = n1000;
// 
// PC_b3
// 
assign PC_b3 = n0612;
// 
// XRAM_DATA_OUT_b3
// 
assign XRAM_DATA_OUT_b3 = n1001;
// 
// PSW_b3
// 
assign n2461 = ~( n1237 );
assign n2462 = { ( n2461 ), ( n2040 ) };
assign n2463 = n2462[7:1];
assign n2464 = { ( n2463 ), ( n1017 ) };
assign PSW_b3 = n2464;
// 
// XRAM_ADDR_b4
// 
assign XRAM_ADDR_b4 = n1000;
// 
// PC_b4
// 
assign n2465 = ( ACC == RD_ROM_1 );
assign n2466 = !( n2465 );
assign n2467 = ( n2466 ) ? ( n1200 ) : ( n1198 );
assign PC_b4 = n2467;
// 
// XRAM_DATA_OUT_b4
// 
assign XRAM_DATA_OUT_b4 = n1001;
// 
// PSW_b4
// 
assign n2468 = ( ACC < RD_ROM_1 );
assign n2469 = ( n2468 ) ? ( n0043 ) : ( n1061 );
assign n2470 = { ( n2469 ), ( n2040 ) };
assign n2471 = n2470[7:1];
assign n2472 = { ( n2471 ), ( n1017 ) };
assign PSW_b4 = n2472;
// 
// XRAM_ADDR_b5
// 
assign XRAM_ADDR_b5 = n1000;
// 
// PC_b5
// 
assign n2473 = ( ACC == n1387 );
assign n2474 = !( n2473 );
assign n2475 = ( n2474 ) ? ( n1200 ) : ( n1198 );
assign PC_b5 = n2475;
// 
// XRAM_DATA_OUT_b5
// 
assign XRAM_DATA_OUT_b5 = n1001;
// 
// PSW_b5
// 
assign n2476 = ( ACC < n1387 );
assign n2477 = ( n2476 ) ? ( n0043 ) : ( n1061 );
assign n2478 = { ( n2477 ), ( n2040 ) };
assign n2479 = n2478[7:1];
assign n2480 = { ( n2479 ), ( n1017 ) };
assign PSW_b5 = n2480;
// 
// XRAM_ADDR_b6
// 
assign XRAM_ADDR_b6 = n1000;
// 
// PC_b6
// 
assign n2481 = ( RD_IRAM_1 == RD_ROM_1 );
assign n2482 = !( n2481 );
assign n2483 = ( n2482 ) ? ( n1200 ) : ( n1198 );
assign PC_b6 = n2483;
// 
// XRAM_DATA_OUT_b6
// 
assign XRAM_DATA_OUT_b6 = n1001;
// 
// PSW_b6
// 
assign n2484 = ( RD_IRAM_1 < RD_ROM_1 );
assign n2485 = ( n2484 ) ? ( n0043 ) : ( n1061 );
assign n2486 = { ( n2485 ), ( n2040 ) };
assign n2487 = n2486[7:1];
assign n2488 = { ( n2487 ), ( n1017 ) };
assign PSW_b6 = n2488;
// 
// XRAM_ADDR_b7
// 
assign XRAM_ADDR_b7 = n1000;
// 
// PC_b7
// 
assign PC_b7 = n2483;
// 
// XRAM_DATA_OUT_b7
// 
assign XRAM_DATA_OUT_b7 = n1001;
// 
// PSW_b7
// 
assign PSW_b7 = n2488;
// 
// XRAM_ADDR_b8
// 
assign XRAM_ADDR_b8 = n1000;
// 
// PC_b8
// 
assign n2489 = ( RD_IRAM_0 == RD_ROM_1 );
assign n2490 = !( n2489 );
assign n2491 = ( n2490 ) ? ( n1200 ) : ( n1198 );
assign PC_b8 = n2491;
// 
// XRAM_DATA_OUT_b8
// 
assign XRAM_DATA_OUT_b8 = n1001;
// 
// PSW_b8
// 
assign n2492 = ( RD_IRAM_0 < RD_ROM_1 );
assign n2493 = ( n2492 ) ? ( n0043 ) : ( n1061 );
assign n2494 = { ( n2493 ), ( n2040 ) };
assign n2495 = n2494[7:1];
assign n2496 = { ( n2495 ), ( n1017 ) };
assign PSW_b8 = n2496;
// 
// XRAM_ADDR_b9
// 
assign XRAM_ADDR_b9 = n1000;
// 
// PC_b9
// 
assign PC_b9 = n2491;
// 
// XRAM_DATA_OUT_b9
// 
assign XRAM_DATA_OUT_b9 = n1001;
// 
// PSW_b9
// 
assign PSW_b9 = n2496;
// 
// XRAM_ADDR_ba
// 
assign XRAM_ADDR_ba = n1000;
// 
// PC_ba
// 
assign PC_ba = n2491;
// 
// XRAM_DATA_OUT_ba
// 
assign XRAM_DATA_OUT_ba = n1001;
// 
// PSW_ba
// 
assign PSW_ba = n2496;
// 
// XRAM_ADDR_bb
// 
assign XRAM_ADDR_bb = n1000;
// 
// PC_bb
// 
assign PC_bb = n2491;
// 
// XRAM_DATA_OUT_bb
// 
assign XRAM_DATA_OUT_bb = n1001;
// 
// PSW_bb
// 
assign PSW_bb = n2496;
// 
// XRAM_ADDR_bc
// 
assign XRAM_ADDR_bc = n1000;
// 
// PC_bc
// 
assign PC_bc = n2491;
// 
// XRAM_DATA_OUT_bc
// 
assign XRAM_DATA_OUT_bc = n1001;
// 
// PSW_bc
// 
assign PSW_bc = n2496;
// 
// XRAM_ADDR_bd
// 
assign XRAM_ADDR_bd = n1000;
// 
// PC_bd
// 
assign PC_bd = n2491;
// 
// XRAM_DATA_OUT_bd
// 
assign XRAM_DATA_OUT_bd = n1001;
// 
// PSW_bd
// 
assign PSW_bd = n2496;
// 
// XRAM_ADDR_be
// 
assign XRAM_ADDR_be = n1000;
// 
// PC_be
// 
assign PC_be = n2491;
// 
// XRAM_DATA_OUT_be
// 
assign XRAM_DATA_OUT_be = n1001;
// 
// PSW_be
// 
assign PSW_be = n2496;
// 
// XRAM_ADDR_bf
// 
assign XRAM_ADDR_bf = n1000;
// 
// PC_bf
// 
assign PC_bf = n2491;
// 
// XRAM_DATA_OUT_bf
// 
assign XRAM_DATA_OUT_bf = n1001;
// 
// PSW_bf
// 
assign PSW_bf = n2496;
// 
// XRAM_ADDR_c0
// 
assign XRAM_ADDR_c0 = n1000;
// 
// PC_c0
// 
assign PC_c0 = n0610;
// 
// IRAM_c0
// 
// 
// XRAM_DATA_OUT_c0
// 
assign XRAM_DATA_OUT_c0 = n1001;
// 
// SP_c0
// 
assign SP_c0 = n1227;
// 
// PSW_c0
// 
assign PSW_c0 = n1018;
// 
// XRAM_ADDR_c1
// 
assign XRAM_ADDR_c1 = n1000;
// 
// PC_c1
// 
assign PC_c1 = n1023;
// 
// XRAM_DATA_OUT_c1
// 
assign XRAM_DATA_OUT_c1 = n1001;
// 
// PSW_c1
// 
assign PSW_c1 = n1018;
// 
// ACC_c2
// 
assign n2497 = ( n1150 ) ? ( n1193 ) : ( ACC );
assign ACC_c2 = n2497;
// 
// P1_c2
// 
assign P1_c2 = n1194;
// 
// XRAM_ADDR_c2
// 
assign XRAM_ADDR_c2 = n1000;
// 
// PC_c2
// 
assign PC_c2 = n0610;
// 
// P2_c2
// 
assign P2_c2 = n1202;
// 
// P3_c2
// 
assign P3_c2 = n1203;
// 
// P0_c2
// 
assign P0_c2 = n1204;
// 
// B_c2
// 
assign n2498 = ( n1166 ) ? ( n1193 ) : ( B );
assign B_c2 = n2498;
// 
// IRAM_c2
// 
// 
// XRAM_DATA_OUT_c2
// 
assign XRAM_DATA_OUT_c2 = n1001;
// 
// PSW_c2
// 
assign n2499 = ( n1165 ) ? ( n1193 ) : ( PSW );
assign n2500 = n2499[7:1];
assign n2501 = n2497[7:7];
assign n2502 = n2497[6:6];
assign n2503 = n2497[5:5];
assign n2504 = n2497[4:4];
assign n2505 = n2497[3:3];
assign n2506 = n2497[2:2];
assign n2507 = n2497[1:1];
assign n2508 = n2497[0:0];
assign n2509 = ( n2507 ^ n2508 );
assign n2510 = ( n2506 ^ n2509 );
assign n2511 = ( n2505 ^ n2510 );
assign n2512 = ( n2504 ^ n2511 );
assign n2513 = ( n2503 ^ n2512 );
assign n2514 = ( n2502 ^ n2513 );
assign n2515 = ( n2501 ^ n2514 );
assign n2516 = { ( n2500 ), ( n2515 ) };
assign PSW_c2 = n2516;
// 
// XRAM_ADDR_c3
// 
assign XRAM_ADDR_c3 = n1000;
// 
// PC_c3
// 
assign PC_c3 = n0612;
// 
// XRAM_DATA_OUT_c3
// 
assign XRAM_DATA_OUT_c3 = n1001;
// 
// PSW_c3
// 
assign n2517 = { ( n1061 ), ( n2040 ) };
assign n2518 = n2517[7:1];
assign n2519 = { ( n2518 ), ( n1017 ) };
assign PSW_c3 = n2519;
// 
// ACC_c4
// 
assign n2520 = ACC[7:4];
assign n2521 = { ( n1336 ), ( n2520 ) };
assign ACC_c4 = n2521;
// 
// XRAM_ADDR_c4
// 
assign XRAM_ADDR_c4 = n1000;
// 
// PC_c4
// 
assign PC_c4 = n0612;
// 
// XRAM_DATA_OUT_c4
// 
assign XRAM_DATA_OUT_c4 = n1001;
// 
// PSW_c4
// 
assign n2522 = n2521[7:7];
assign n2523 = n2521[6:6];
assign n2524 = n2521[5:5];
assign n2525 = n2521[4:4];
assign n2526 = n2521[3:3];
assign n2527 = n2521[2:2];
assign n2528 = n2521[1:1];
assign n2529 = n2521[0:0];
assign n2530 = ( n2528 ^ n2529 );
assign n2531 = ( n2527 ^ n2530 );
assign n2532 = ( n2526 ^ n2531 );
assign n2533 = ( n2525 ^ n2532 );
assign n2534 = ( n2524 ^ n2533 );
assign n2535 = ( n2523 ^ n2534 );
assign n2536 = ( n2522 ^ n2535 );
assign n2537 = { ( n1002 ), ( n2536 ) };
assign PSW_c4 = n2537;
// 
// ACC_c5
// 
assign ACC_c5 = n1387;
// 
// B_c5
// 
assign n2538 = ( n1087 ) ? ( ACC ) : ( B );
assign B_c5 = n2538;
// 
// DPL_c5
// 
assign n2539 = ( n1067 ) ? ( ACC ) : ( DPL );
assign DPL_c5 = n2539;
// 
// DPH_c5
// 
assign n2540 = ( n1069 ) ? ( ACC ) : ( DPH );
assign DPH_c5 = n2540;
// 
// XRAM_ADDR_c5
// 
assign XRAM_ADDR_c5 = n1000;
// 
// PC_c5
// 
assign PC_c5 = n0610;
// 
// P2_c5
// 
assign n2541 = ( n1081 ) ? ( ACC ) : ( P2 );
assign P2_c5 = n2541;
// 
// P3_c5
// 
assign n2542 = ( n1083 ) ? ( ACC ) : ( P3 );
assign P3_c5 = n2542;
// 
// P0_c5
// 
assign n2543 = ( n1064 ) ? ( ACC ) : ( P0 );
assign P0_c5 = n2543;
// 
// P1_c5
// 
assign n2544 = ( n1078 ) ? ( ACC ) : ( P1 );
assign P1_c5 = n2544;
// 
// IRAM_c5
// 
// 
// XRAM_DATA_OUT_c5
// 
assign XRAM_DATA_OUT_c5 = n1001;
// 
// SP_c5
// 
assign n2545 = ( n1066 ) ? ( ACC ) : ( SP );
assign SP_c5 = n2545;
// 
// PSW_c5
// 
assign n2546 = ( n1085 ) ? ( ACC ) : ( PSW );
assign n2547 = n2546[7:1];
assign n2548 = n1387[7:7];
assign n2549 = n1387[6:6];
assign n2550 = n1387[5:5];
assign n2551 = n1387[4:4];
assign n2552 = n1387[3:3];
assign n2553 = n1387[2:2];
assign n2554 = n1387[1:1];
assign n2555 = n1387[0:0];
assign n2556 = ( n2554 ^ n2555 );
assign n2557 = ( n2553 ^ n2556 );
assign n2558 = ( n2552 ^ n2557 );
assign n2559 = ( n2551 ^ n2558 );
assign n2560 = ( n2550 ^ n2559 );
assign n2561 = ( n2549 ^ n2560 );
assign n2562 = ( n2548 ^ n2561 );
assign n2563 = { ( n2547 ), ( n2562 ) };
assign PSW_c5 = n2563;
// 
// ACC_c6
// 
assign ACC_c6 = RD_IRAM_1;
// 
// XRAM_ADDR_c6
// 
assign XRAM_ADDR_c6 = n1000;
// 
// PC_c6
// 
assign PC_c6 = n0612;
// 
// IRAM_c6
// 
// 
// XRAM_DATA_OUT_c6
// 
assign XRAM_DATA_OUT_c6 = n1001;
// 
// PSW_c6
// 
assign n2564 = RD_IRAM_1[7:7];
assign n2565 = RD_IRAM_1[6:6];
assign n2566 = RD_IRAM_1[5:5];
assign n2567 = RD_IRAM_1[4:4];
assign n2568 = RD_IRAM_1[3:3];
assign n2569 = RD_IRAM_1[2:2];
assign n2570 = RD_IRAM_1[1:1];
assign n2571 = RD_IRAM_1[0:0];
assign n2572 = ( n2570 ^ n2571 );
assign n2573 = ( n2569 ^ n2572 );
assign n2574 = ( n2568 ^ n2573 );
assign n2575 = ( n2567 ^ n2574 );
assign n2576 = ( n2566 ^ n2575 );
assign n2577 = ( n2565 ^ n2576 );
assign n2578 = ( n2564 ^ n2577 );
assign n2579 = { ( n1002 ), ( n2578 ) };
assign PSW_c6 = n2579;
// 
// ACC_c7
// 
assign ACC_c7 = RD_IRAM_1;
// 
// XRAM_ADDR_c7
// 
assign XRAM_ADDR_c7 = n1000;
// 
// PC_c7
// 
assign PC_c7 = n0612;
// 
// IRAM_c7
// 
// 
// XRAM_DATA_OUT_c7
// 
assign XRAM_DATA_OUT_c7 = n1001;
// 
// PSW_c7
// 
assign PSW_c7 = n2579;
// 
// ACC_c8
// 
assign ACC_c8 = RD_IRAM_0;
// 
// XRAM_ADDR_c8
// 
assign XRAM_ADDR_c8 = n1000;
// 
// PC_c8
// 
assign PC_c8 = n0612;
// 
// IRAM_c8
// 
// 
// XRAM_DATA_OUT_c8
// 
assign XRAM_DATA_OUT_c8 = n1001;
// 
// PSW_c8
// 
assign n2580 = RD_IRAM_0[7:7];
assign n2581 = RD_IRAM_0[6:6];
assign n2582 = RD_IRAM_0[5:5];
assign n2583 = RD_IRAM_0[4:4];
assign n2584 = RD_IRAM_0[3:3];
assign n2585 = RD_IRAM_0[2:2];
assign n2586 = RD_IRAM_0[1:1];
assign n2587 = RD_IRAM_0[0:0];
assign n2588 = ( n2586 ^ n2587 );
assign n2589 = ( n2585 ^ n2588 );
assign n2590 = ( n2584 ^ n2589 );
assign n2591 = ( n2583 ^ n2590 );
assign n2592 = ( n2582 ^ n2591 );
assign n2593 = ( n2581 ^ n2592 );
assign n2594 = ( n2580 ^ n2593 );
assign n2595 = { ( n1002 ), ( n2594 ) };
assign PSW_c8 = n2595;
// 
// ACC_c9
// 
assign ACC_c9 = RD_IRAM_0;
// 
// XRAM_ADDR_c9
// 
assign XRAM_ADDR_c9 = n1000;
// 
// PC_c9
// 
assign PC_c9 = n0612;
// 
// IRAM_c9
// 
// 
// XRAM_DATA_OUT_c9
// 
assign XRAM_DATA_OUT_c9 = n1001;
// 
// PSW_c9
// 
assign PSW_c9 = n2595;
// 
// ACC_ca
// 
assign ACC_ca = RD_IRAM_0;
// 
// XRAM_ADDR_ca
// 
assign XRAM_ADDR_ca = n1000;
// 
// PC_ca
// 
assign PC_ca = n0612;
// 
// IRAM_ca
// 
// 
// XRAM_DATA_OUT_ca
// 
assign XRAM_DATA_OUT_ca = n1001;
// 
// PSW_ca
// 
assign PSW_ca = n2595;
// 
// ACC_cb
// 
assign ACC_cb = RD_IRAM_0;
// 
// XRAM_ADDR_cb
// 
assign XRAM_ADDR_cb = n1000;
// 
// PC_cb
// 
assign PC_cb = n0612;
// 
// IRAM_cb
// 
// 
// XRAM_DATA_OUT_cb
// 
assign XRAM_DATA_OUT_cb = n1001;
// 
// PSW_cb
// 
assign PSW_cb = n2595;
// 
// ACC_cc
// 
assign ACC_cc = RD_IRAM_0;
// 
// XRAM_ADDR_cc
// 
assign XRAM_ADDR_cc = n1000;
// 
// PC_cc
// 
assign PC_cc = n0612;
// 
// IRAM_cc
// 
// 
// XRAM_DATA_OUT_cc
// 
assign XRAM_DATA_OUT_cc = n1001;
// 
// PSW_cc
// 
assign PSW_cc = n2595;
// 
// ACC_cd
// 
assign ACC_cd = RD_IRAM_0;
// 
// XRAM_ADDR_cd
// 
assign XRAM_ADDR_cd = n1000;
// 
// PC_cd
// 
assign PC_cd = n0612;
// 
// IRAM_cd
// 
// 
// XRAM_DATA_OUT_cd
// 
assign XRAM_DATA_OUT_cd = n1001;
// 
// PSW_cd
// 
assign PSW_cd = n2595;
// 
// ACC_ce
// 
assign ACC_ce = RD_IRAM_0;
// 
// XRAM_ADDR_ce
// 
assign XRAM_ADDR_ce = n1000;
// 
// PC_ce
// 
assign PC_ce = n0612;
// 
// IRAM_ce
// 
// 
// XRAM_DATA_OUT_ce
// 
assign XRAM_DATA_OUT_ce = n1001;
// 
// PSW_ce
// 
assign PSW_ce = n2595;
// 
// ACC_cf
// 
assign ACC_cf = RD_IRAM_0;
// 
// XRAM_ADDR_cf
// 
assign XRAM_ADDR_cf = n1000;
// 
// PC_cf
// 
assign PC_cf = n0612;
// 
// IRAM_cf
// 
// 
// XRAM_DATA_OUT_cf
// 
assign XRAM_DATA_OUT_cf = n1001;
// 
// PSW_cf
// 
assign PSW_cf = n2595;
// 
// ACC_d0
// 
assign ACC_d0 = n2216;
// 
// P1_d0
// 
assign P1_d0 = n2223;
// 
// DPL_d0
// 
assign DPL_d0 = n2218;
// 
// DPH_d0
// 
assign DPH_d0 = n2219;
// 
// XRAM_ADDR_d0
// 
assign XRAM_ADDR_d0 = n1000;
// 
// PC_d0
// 
assign PC_d0 = n0610;
// 
// P2_d0
// 
assign P2_d0 = n2220;
// 
// P3_d0
// 
assign P3_d0 = n2221;
// 
// P0_d0
// 
assign P0_d0 = n2222;
// 
// B_d0
// 
assign B_d0 = n2217;
// 
// IRAM_d0
// 
// 
// XRAM_DATA_OUT_d0
// 
assign XRAM_DATA_OUT_d0 = n1001;
// 
// SP_d0
// 
assign n2596 = ( n1066 ) ? ( RD_IRAM_0 ) : ( n1311 );
assign n2597 = ( n1066 ) ? ( n2596 ) : ( n0575 );
assign SP_d0 = n2597;
// 
// PSW_d0
// 
assign PSW_d0 = n2242;
// 
// XRAM_ADDR_d1
// 
assign XRAM_ADDR_d1 = n1000;
// 
// PC_d1
// 
assign PC_d1 = n1023;
// 
// IRAM_d1
// 
// 
// XRAM_DATA_OUT_d1
// 
assign XRAM_DATA_OUT_d1 = n1001;
// 
// SP_d1
// 
assign SP_d1 = n1234;
// 
// PSW_d1
// 
assign PSW_d1 = n1018;
// 
// ACC_d2
// 
assign n2598 = { 7'b0, n0043 };
assign n2599 = ( n2598 << n1152 );
assign n2600 = ( n1192 | n2599 );
assign n2601 = ( n1150 ) ? ( n2600 ) : ( ACC );
assign ACC_d2 = n2601;
// 
// B_d2
// 
assign n2602 = ( n1166 ) ? ( n2600 ) : ( B );
assign B_d2 = n2602;
// 
// XRAM_ADDR_d2
// 
assign XRAM_ADDR_d2 = n1000;
// 
// PC_d2
// 
assign PC_d2 = n0610;
// 
// P2_d2
// 
assign n2603 = ( n1161 ) ? ( n2600 ) : ( P2 );
assign P2_d2 = n2603;
// 
// P3_d2
// 
assign n2604 = ( n1163 ) ? ( n2600 ) : ( P3 );
assign P3_d2 = n2604;
// 
// P0_d2
// 
assign n2605 = ( n1157 ) ? ( n2600 ) : ( P0 );
assign P0_d2 = n2605;
// 
// P1_d2
// 
assign n2606 = ( n1159 ) ? ( n2600 ) : ( P1 );
assign P1_d2 = n2606;
// 
// IRAM_d2
// 
// 
// XRAM_DATA_OUT_d2
// 
assign XRAM_DATA_OUT_d2 = n1001;
// 
// PSW_d2
// 
assign n2607 = ( n1165 ) ? ( n2600 ) : ( PSW );
assign n2608 = n2607[7:1];
assign n2609 = n2601[7:7];
assign n2610 = n2601[6:6];
assign n2611 = n2601[5:5];
assign n2612 = n2601[4:4];
assign n2613 = n2601[3:3];
assign n2614 = n2601[2:2];
assign n2615 = n2601[1:1];
assign n2616 = n2601[0:0];
assign n2617 = ( n2615 ^ n2616 );
assign n2618 = ( n2614 ^ n2617 );
assign n2619 = ( n2613 ^ n2618 );
assign n2620 = ( n2612 ^ n2619 );
assign n2621 = ( n2611 ^ n2620 );
assign n2622 = ( n2610 ^ n2621 );
assign n2623 = ( n2609 ^ n2622 );
assign n2624 = { ( n2608 ), ( n2623 ) };
assign PSW_d2 = n2624;
// 
// XRAM_ADDR_d3
// 
assign XRAM_ADDR_d3 = n1000;
// 
// PC_d3
// 
assign PC_d3 = n0612;
// 
// XRAM_DATA_OUT_d3
// 
assign XRAM_DATA_OUT_d3 = n1001;
// 
// PSW_d3
// 
assign n2625 = { ( n0043 ), ( n2040 ) };
assign n2626 = n2625[7:1];
assign n2627 = { ( n2626 ), ( n1017 ) };
assign PSW_d3 = n2627;
// 
// ACC_d4
// 
assign n2628 = ( n1241 == n0043 );
assign n2629 = 4'h9;
assign n2630 = ( n1336 > n2629 );
assign n2631 = ( n2628 || n2630 );
assign n2632 = 9'h6;
assign n2633 = ( n1330 + n2632 );
assign n2634 = ( n2631 ) ? ( n2633 ) : ( n1330 );
assign n2635 = n2634[8:8];
assign n2636 = ( n2635 | n1237 );
assign n2637 = ( n2636 == n0043 );
assign n2638 = n2634[7:4];
assign n2639 = ( n2638 > n2629 );
assign n2640 = ( n2637 || n2639 );
assign n2641 = 9'h60;
assign n2642 = ( n2634 + n2641 );
assign n2643 = ( n2640 ) ? ( n2642 ) : ( n2634 );
assign n2644 = n2643[7:0];
assign ACC_d4 = n2644;
// 
// XRAM_ADDR_d4
// 
assign XRAM_ADDR_d4 = n1000;
// 
// PC_d4
// 
assign PC_d4 = n0612;
// 
// XRAM_DATA_OUT_d4
// 
assign XRAM_DATA_OUT_d4 = n1001;
// 
// PSW_d4
// 
assign n2645 = n2643[8:8];
assign n2646 = ( n2645 | n2636 );
assign n2647 = { ( n2646 ), ( n2040 ) };
assign n2648 = n2647[7:1];
assign n2649 = n2644[7:7];
assign n2650 = n2644[6:6];
assign n2651 = n2644[5:5];
assign n2652 = n2644[4:4];
assign n2653 = n2644[3:3];
assign n2654 = n2644[2:2];
assign n2655 = n2644[1:1];
assign n2656 = n2644[0:0];
assign n2657 = ( n2655 ^ n2656 );
assign n2658 = ( n2654 ^ n2657 );
assign n2659 = ( n2653 ^ n2658 );
assign n2660 = ( n2652 ^ n2659 );
assign n2661 = ( n2651 ^ n2660 );
assign n2662 = ( n2650 ^ n2661 );
assign n2663 = ( n2649 ^ n2662 );
assign n2664 = { ( n2648 ), ( n2663 ) };
assign PSW_d4 = n2664;
// 
// ACC_d5
// 
assign ACC_d5 = n1281;
// 
// B_d5
// 
assign B_d5 = n1288;
// 
// DPL_d5
// 
assign DPL_d5 = n1283;
// 
// DPH_d5
// 
assign DPH_d5 = n1284;
// 
// XRAM_ADDR_d5
// 
assign XRAM_ADDR_d5 = n1000;
// 
// PC_d5
// 
assign n2665 = ( n1109 == n0574 );
assign n2666 = !( n2665 );
assign n2667 = ( n2666 ) ? ( n1200 ) : ( n1198 );
assign PC_d5 = n2667;
// 
// P2_d5
// 
assign P2_d5 = n1285;
// 
// P3_d5
// 
assign P3_d5 = n1286;
// 
// P0_d5
// 
assign P0_d5 = n1287;
// 
// P1_d5
// 
assign P1_d5 = n1282;
// 
// IRAM_d5
// 
// 
// XRAM_DATA_OUT_d5
// 
assign XRAM_DATA_OUT_d5 = n1001;
// 
// SP_d5
// 
assign SP_d5 = n1289;
// 
// PSW_d5
// 
assign PSW_d5 = n1307;
// 
// ACC_d6
// 
assign n2668 = { ( n2520 ), ( n1431 ) };
assign ACC_d6 = n2668;
// 
// XRAM_ADDR_d6
// 
assign XRAM_ADDR_d6 = n1000;
// 
// PC_d6
// 
assign PC_d6 = n0612;
// 
// IRAM_d6
// 
assign n2669 = RD_IRAM_1[7:4];
assign n2670 = { ( n2669 ), ( n1336 ) };
// 
// XRAM_DATA_OUT_d6
// 
assign XRAM_DATA_OUT_d6 = n1001;
// 
// PSW_d6
// 
assign n2671 = n2668[7:7];
assign n2672 = n2668[6:6];
assign n2673 = n2668[5:5];
assign n2674 = n2668[4:4];
assign n2675 = n2668[3:3];
assign n2676 = n2668[2:2];
assign n2677 = n2668[1:1];
assign n2678 = n2668[0:0];
assign n2679 = ( n2677 ^ n2678 );
assign n2680 = ( n2676 ^ n2679 );
assign n2681 = ( n2675 ^ n2680 );
assign n2682 = ( n2674 ^ n2681 );
assign n2683 = ( n2673 ^ n2682 );
assign n2684 = ( n2672 ^ n2683 );
assign n2685 = ( n2671 ^ n2684 );
assign n2686 = { ( n1002 ), ( n2685 ) };
assign PSW_d6 = n2686;
// 
// ACC_d7
// 
assign ACC_d7 = n2668;
// 
// XRAM_ADDR_d7
// 
assign XRAM_ADDR_d7 = n1000;
// 
// PC_d7
// 
assign PC_d7 = n0612;
// 
// IRAM_d7
// 
// 
// XRAM_DATA_OUT_d7
// 
assign XRAM_DATA_OUT_d7 = n1001;
// 
// PSW_d7
// 
assign PSW_d7 = n2686;
// 
// XRAM_ADDR_d8
// 
assign XRAM_ADDR_d8 = n1000;
// 
// PC_d8
// 
assign n2687 = ( RD_IRAM_0 == n0574 );
assign n2688 = !( n2687 );
assign n2689 = ( n2688 ) ? ( n1689 ) : ( n0610 );
assign PC_d8 = n2689;
// 
// IRAM_d8
// 
// 
// XRAM_DATA_OUT_d8
// 
assign XRAM_DATA_OUT_d8 = n1001;
// 
// PSW_d8
// 
assign PSW_d8 = n1018;
// 
// XRAM_ADDR_d9
// 
assign XRAM_ADDR_d9 = n1000;
// 
// PC_d9
// 
assign PC_d9 = n2689;
// 
// IRAM_d9
// 
// 
// XRAM_DATA_OUT_d9
// 
assign XRAM_DATA_OUT_d9 = n1001;
// 
// PSW_d9
// 
assign PSW_d9 = n1018;
// 
// XRAM_ADDR_da
// 
assign XRAM_ADDR_da = n1000;
// 
// PC_da
// 
assign PC_da = n2689;
// 
// IRAM_da
// 
// 
// XRAM_DATA_OUT_da
// 
assign XRAM_DATA_OUT_da = n1001;
// 
// PSW_da
// 
assign PSW_da = n1018;
// 
// XRAM_ADDR_db
// 
assign XRAM_ADDR_db = n1000;
// 
// PC_db
// 
assign PC_db = n2689;
// 
// IRAM_db
// 
// 
// XRAM_DATA_OUT_db
// 
assign XRAM_DATA_OUT_db = n1001;
// 
// PSW_db
// 
assign PSW_db = n1018;
// 
// XRAM_ADDR_dc
// 
assign XRAM_ADDR_dc = n1000;
// 
// PC_dc
// 
assign PC_dc = n2689;
// 
// IRAM_dc
// 
// 
// XRAM_DATA_OUT_dc
// 
assign XRAM_DATA_OUT_dc = n1001;
// 
// PSW_dc
// 
assign PSW_dc = n1018;
// 
// XRAM_ADDR_dd
// 
assign XRAM_ADDR_dd = n1000;
// 
// PC_dd
// 
assign PC_dd = n2689;
// 
// IRAM_dd
// 
// 
// XRAM_DATA_OUT_dd
// 
assign XRAM_DATA_OUT_dd = n1001;
// 
// PSW_dd
// 
assign PSW_dd = n1018;
// 
// XRAM_ADDR_de
// 
assign XRAM_ADDR_de = n1000;
// 
// PC_de
// 
assign PC_de = n2689;
// 
// IRAM_de
// 
// 
// XRAM_DATA_OUT_de
// 
assign XRAM_DATA_OUT_de = n1001;
// 
// PSW_de
// 
assign PSW_de = n1018;
// 
// XRAM_ADDR_df
// 
assign XRAM_ADDR_df = n1000;
// 
// PC_df
// 
assign PC_df = n2689;
// 
// IRAM_df
// 
// 
// XRAM_DATA_OUT_df
// 
assign XRAM_DATA_OUT_df = n1001;
// 
// PSW_df
// 
assign PSW_df = n1018;
// 
// ACC_e0
// 
assign ACC_e0 = XRAM_DATA_IN;
// 
// XRAM_ADDR_e0
// 
assign XRAM_ADDR_e0 = n0745;
// 
// PC_e0
// 
assign PC_e0 = n0612;
// 
// XRAM_DATA_OUT_e0
// 
assign XRAM_DATA_OUT_e0 = n1001;
// 
// PSW_e0
// 
assign n2690 = XRAM_DATA_IN[7:7];
assign n2691 = XRAM_DATA_IN[6:6];
assign n2692 = XRAM_DATA_IN[5:5];
assign n2693 = XRAM_DATA_IN[4:4];
assign n2694 = XRAM_DATA_IN[3:3];
assign n2695 = XRAM_DATA_IN[2:2];
assign n2696 = XRAM_DATA_IN[1:1];
assign n2697 = XRAM_DATA_IN[0:0];
assign n2698 = ( n2696 ^ n2697 );
assign n2699 = ( n2695 ^ n2698 );
assign n2700 = ( n2694 ^ n2699 );
assign n2701 = ( n2693 ^ n2700 );
assign n2702 = ( n2692 ^ n2701 );
assign n2703 = ( n2691 ^ n2702 );
assign n2704 = ( n2690 ^ n2703 );
assign n2705 = { ( n1002 ), ( n2704 ) };
assign PSW_e0 = n2705;
// 
// XRAM_ADDR_e1
// 
assign XRAM_ADDR_e1 = n1000;
// 
// PC_e1
// 
assign PC_e1 = n1023;
// 
// XRAM_DATA_OUT_e1
// 
assign XRAM_DATA_OUT_e1 = n1001;
// 
// PSW_e1
// 
assign PSW_e1 = n1018;
// 
// ACC_e2
// 
assign ACC_e2 = XRAM_DATA_IN;
// 
// XRAM_ADDR_e2
// 
assign n2706 = { ( n1001 ), ( RD_IRAM_0 ) };
assign XRAM_ADDR_e2 = n2706;
// 
// PC_e2
// 
assign PC_e2 = n0612;
// 
// XRAM_DATA_OUT_e2
// 
assign XRAM_DATA_OUT_e2 = n1001;
// 
// PSW_e2
// 
assign PSW_e2 = n2705;
// 
// ACC_e3
// 
assign ACC_e3 = XRAM_DATA_IN;
// 
// XRAM_ADDR_e3
// 
assign XRAM_ADDR_e3 = n2706;
// 
// PC_e3
// 
assign PC_e3 = n0612;
// 
// XRAM_DATA_OUT_e3
// 
assign XRAM_DATA_OUT_e3 = n1001;
// 
// PSW_e3
// 
assign PSW_e3 = n2705;
// 
// ACC_e4
// 
assign ACC_e4 = n1001;
// 
// XRAM_ADDR_e4
// 
assign XRAM_ADDR_e4 = n1000;
// 
// PC_e4
// 
assign PC_e4 = n0612;
// 
// XRAM_DATA_OUT_e4
// 
assign XRAM_DATA_OUT_e4 = n1001;
// 
// PSW_e4
// 
assign n2707 = n1001[7:7];
assign n2708 = n1001[6:6];
assign n2709 = n1001[5:5];
assign n2710 = n1001[4:4];
assign n2711 = n1001[3:3];
assign n2712 = n1001[2:2];
assign n2713 = n1001[1:1];
assign n2714 = n1001[0:0];
assign n2715 = ( n2713 ^ n2714 );
assign n2716 = ( n2712 ^ n2715 );
assign n2717 = ( n2711 ^ n2716 );
assign n2718 = ( n2710 ^ n2717 );
assign n2719 = ( n2709 ^ n2718 );
assign n2720 = ( n2708 ^ n2719 );
assign n2721 = ( n2707 ^ n2720 );
assign n2722 = { ( n1002 ), ( n2721 ) };
assign PSW_e4 = n2722;
// 
// ACC_e5
// 
assign ACC_e5 = n1387;
// 
// XRAM_ADDR_e5
// 
assign XRAM_ADDR_e5 = n1000;
// 
// PC_e5
// 
assign PC_e5 = n0610;
// 
// XRAM_DATA_OUT_e5
// 
assign XRAM_DATA_OUT_e5 = n1001;
// 
// PSW_e5
// 
assign n2723 = { ( n1002 ), ( n2562 ) };
assign PSW_e5 = n2723;
// 
// ACC_e6
// 
assign ACC_e6 = RD_IRAM_1;
// 
// XRAM_ADDR_e6
// 
assign XRAM_ADDR_e6 = n1000;
// 
// PC_e6
// 
assign PC_e6 = n0612;
// 
// XRAM_DATA_OUT_e6
// 
assign XRAM_DATA_OUT_e6 = n1001;
// 
// PSW_e6
// 
assign PSW_e6 = n2579;
// 
// ACC_e7
// 
assign ACC_e7 = RD_IRAM_1;
// 
// XRAM_ADDR_e7
// 
assign XRAM_ADDR_e7 = n1000;
// 
// PC_e7
// 
assign PC_e7 = n0612;
// 
// XRAM_DATA_OUT_e7
// 
assign XRAM_DATA_OUT_e7 = n1001;
// 
// PSW_e7
// 
assign PSW_e7 = n2579;
// 
// ACC_e8
// 
assign ACC_e8 = RD_IRAM_0;
// 
// XRAM_ADDR_e8
// 
assign XRAM_ADDR_e8 = n1000;
// 
// PC_e8
// 
assign PC_e8 = n0612;
// 
// XRAM_DATA_OUT_e8
// 
assign XRAM_DATA_OUT_e8 = n1001;
// 
// PSW_e8
// 
assign PSW_e8 = n2595;
// 
// ACC_e9
// 
assign ACC_e9 = RD_IRAM_0;
// 
// XRAM_ADDR_e9
// 
assign XRAM_ADDR_e9 = n1000;
// 
// PC_e9
// 
assign PC_e9 = n0612;
// 
// XRAM_DATA_OUT_e9
// 
assign XRAM_DATA_OUT_e9 = n1001;
// 
// PSW_e9
// 
assign PSW_e9 = n2595;
// 
// ACC_ea
// 
assign ACC_ea = RD_IRAM_0;
// 
// XRAM_ADDR_ea
// 
assign XRAM_ADDR_ea = n1000;
// 
// PC_ea
// 
assign PC_ea = n0612;
// 
// XRAM_DATA_OUT_ea
// 
assign XRAM_DATA_OUT_ea = n1001;
// 
// PSW_ea
// 
assign PSW_ea = n2595;
// 
// ACC_eb
// 
assign ACC_eb = RD_IRAM_0;
// 
// XRAM_ADDR_eb
// 
assign XRAM_ADDR_eb = n1000;
// 
// PC_eb
// 
assign PC_eb = n0612;
// 
// XRAM_DATA_OUT_eb
// 
assign XRAM_DATA_OUT_eb = n1001;
// 
// PSW_eb
// 
assign PSW_eb = n2595;
// 
// ACC_ec
// 
assign ACC_ec = RD_IRAM_0;
// 
// XRAM_ADDR_ec
// 
assign XRAM_ADDR_ec = n1000;
// 
// PC_ec
// 
assign PC_ec = n0612;
// 
// XRAM_DATA_OUT_ec
// 
assign XRAM_DATA_OUT_ec = n1001;
// 
// PSW_ec
// 
assign PSW_ec = n2595;
// 
// ACC_ed
// 
assign ACC_ed = RD_IRAM_0;
// 
// XRAM_ADDR_ed
// 
assign XRAM_ADDR_ed = n1000;
// 
// PC_ed
// 
assign PC_ed = n0612;
// 
// XRAM_DATA_OUT_ed
// 
assign XRAM_DATA_OUT_ed = n1001;
// 
// PSW_ed
// 
assign PSW_ed = n2595;
// 
// ACC_ee
// 
assign ACC_ee = RD_IRAM_0;
// 
// XRAM_ADDR_ee
// 
assign XRAM_ADDR_ee = n1000;
// 
// PC_ee
// 
assign PC_ee = n0612;
// 
// XRAM_DATA_OUT_ee
// 
assign XRAM_DATA_OUT_ee = n1001;
// 
// PSW_ee
// 
assign PSW_ee = n2595;
// 
// ACC_ef
// 
assign ACC_ef = RD_IRAM_0;
// 
// XRAM_ADDR_ef
// 
assign XRAM_ADDR_ef = n1000;
// 
// PC_ef
// 
assign PC_ef = n0612;
// 
// XRAM_DATA_OUT_ef
// 
assign XRAM_DATA_OUT_ef = n1001;
// 
// PSW_ef
// 
assign PSW_ef = n2595;
// 
// XRAM_ADDR_f0
// 
assign XRAM_ADDR_f0 = n0745;
// 
// PC_f0
// 
assign PC_f0 = n0612;
// 
// XRAM_DATA_OUT_f0
// 
assign XRAM_DATA_OUT_f0 = ACC;
// 
// PSW_f0
// 
assign PSW_f0 = n1018;
// 
// XRAM_ADDR_f1
// 
assign XRAM_ADDR_f1 = n1000;
// 
// PC_f1
// 
assign PC_f1 = n1023;
// 
// IRAM_f1
// 
// 
// XRAM_DATA_OUT_f1
// 
assign XRAM_DATA_OUT_f1 = n1001;
// 
// SP_f1
// 
assign SP_f1 = n1234;
// 
// PSW_f1
// 
assign PSW_f1 = n1018;
// 
// XRAM_ADDR_f2
// 
assign XRAM_ADDR_f2 = n2706;
// 
// PC_f2
// 
assign PC_f2 = n0612;
// 
// XRAM_DATA_OUT_f2
// 
assign XRAM_DATA_OUT_f2 = ACC;
// 
// PSW_f2
// 
assign PSW_f2 = n1018;
// 
// XRAM_ADDR_f3
// 
assign XRAM_ADDR_f3 = n2706;
// 
// PC_f3
// 
assign PC_f3 = n0612;
// 
// XRAM_DATA_OUT_f3
// 
assign XRAM_DATA_OUT_f3 = ACC;
// 
// PSW_f3
// 
assign PSW_f3 = n1018;
// 
// ACC_f4
// 
assign n2724 = ~( ACC );
assign ACC_f4 = n2724;
// 
// XRAM_ADDR_f4
// 
assign XRAM_ADDR_f4 = n1000;
// 
// PC_f4
// 
assign PC_f4 = n0612;
// 
// XRAM_DATA_OUT_f4
// 
assign XRAM_DATA_OUT_f4 = n1001;
// 
// PSW_f4
// 
assign n2725 = n2724[7:7];
assign n2726 = n2724[6:6];
assign n2727 = n2724[5:5];
assign n2728 = n2724[4:4];
assign n2729 = n2724[3:3];
assign n2730 = n2724[2:2];
assign n2731 = n2724[1:1];
assign n2732 = n2724[0:0];
assign n2733 = ( n2731 ^ n2732 );
assign n2734 = ( n2730 ^ n2733 );
assign n2735 = ( n2729 ^ n2734 );
assign n2736 = ( n2728 ^ n2735 );
assign n2737 = ( n2727 ^ n2736 );
assign n2738 = ( n2726 ^ n2737 );
assign n2739 = ( n2725 ^ n2738 );
assign n2740 = { ( n1002 ), ( n2739 ) };
assign PSW_f4 = n2740;
// 
// B_f5
// 
assign B_f5 = n2538;
// 
// DPL_f5
// 
assign DPL_f5 = n2539;
// 
// DPH_f5
// 
assign DPH_f5 = n2540;
// 
// XRAM_ADDR_f5
// 
assign XRAM_ADDR_f5 = n1000;
// 
// PC_f5
// 
assign PC_f5 = n0610;
// 
// P2_f5
// 
assign P2_f5 = n2541;
// 
// P3_f5
// 
assign P3_f5 = n2542;
// 
// P0_f5
// 
assign P0_f5 = n2543;
// 
// P1_f5
// 
assign P1_f5 = n2544;
// 
// IRAM_f5
// 
// 
// XRAM_DATA_OUT_f5
// 
assign XRAM_DATA_OUT_f5 = n1001;
// 
// SP_f5
// 
assign SP_f5 = n2545;
// 
// PSW_f5
// 
assign n2741 = { ( n2547 ), ( n1017 ) };
assign PSW_f5 = n2741;
// 
// XRAM_ADDR_f6
// 
assign XRAM_ADDR_f6 = n1000;
// 
// PC_f6
// 
assign PC_f6 = n0612;
// 
// IRAM_f6
// 
// 
// XRAM_DATA_OUT_f6
// 
assign XRAM_DATA_OUT_f6 = n1001;
// 
// PSW_f6
// 
assign PSW_f6 = n1018;
// 
// XRAM_ADDR_f7
// 
assign XRAM_ADDR_f7 = n1000;
// 
// PC_f7
// 
assign PC_f7 = n0612;
// 
// IRAM_f7
// 
// 
// XRAM_DATA_OUT_f7
// 
assign XRAM_DATA_OUT_f7 = n1001;
// 
// PSW_f7
// 
assign PSW_f7 = n1018;
// 
// XRAM_ADDR_f8
// 
assign XRAM_ADDR_f8 = n1000;
// 
// PC_f8
// 
assign PC_f8 = n0612;
// 
// IRAM_f8
// 
// 
// XRAM_DATA_OUT_f8
// 
assign XRAM_DATA_OUT_f8 = n1001;
// 
// PSW_f8
// 
assign PSW_f8 = n1018;
// 
// XRAM_ADDR_f9
// 
assign XRAM_ADDR_f9 = n1000;
// 
// PC_f9
// 
assign PC_f9 = n0612;
// 
// IRAM_f9
// 
// 
// XRAM_DATA_OUT_f9
// 
assign XRAM_DATA_OUT_f9 = n1001;
// 
// PSW_f9
// 
assign PSW_f9 = n1018;
// 
// XRAM_ADDR_fa
// 
assign XRAM_ADDR_fa = n1000;
// 
// PC_fa
// 
assign PC_fa = n0612;
// 
// IRAM_fa
// 
// 
// XRAM_DATA_OUT_fa
// 
assign XRAM_DATA_OUT_fa = n1001;
// 
// PSW_fa
// 
assign PSW_fa = n1018;
// 
// XRAM_ADDR_fb
// 
assign XRAM_ADDR_fb = n1000;
// 
// PC_fb
// 
assign PC_fb = n0612;
// 
// IRAM_fb
// 
// 
// XRAM_DATA_OUT_fb
// 
assign XRAM_DATA_OUT_fb = n1001;
// 
// PSW_fb
// 
assign PSW_fb = n1018;
// 
// XRAM_ADDR_fc
// 
assign XRAM_ADDR_fc = n1000;
// 
// PC_fc
// 
assign PC_fc = n0612;
// 
// IRAM_fc
// 
// 
// XRAM_DATA_OUT_fc
// 
assign XRAM_DATA_OUT_fc = n1001;
// 
// PSW_fc
// 
assign PSW_fc = n1018;
// 
// XRAM_ADDR_fd
// 
assign XRAM_ADDR_fd = n1000;
// 
// PC_fd
// 
assign PC_fd = n0612;
// 
// IRAM_fd
// 
// 
// XRAM_DATA_OUT_fd
// 
assign XRAM_DATA_OUT_fd = n1001;
// 
// PSW_fd
// 
assign PSW_fd = n1018;
// 
// XRAM_ADDR_fe
// 
assign XRAM_ADDR_fe = n1000;
// 
// PC_fe
// 
assign PC_fe = n0612;
// 
// IRAM_fe
// 
// 
// XRAM_DATA_OUT_fe
// 
assign XRAM_DATA_OUT_fe = n1001;
// 
// PSW_fe
// 
assign PSW_fe = n1018;
// 
// XRAM_ADDR_ff
// 
assign XRAM_ADDR_ff = n1000;
// 
// PC_ff
// 
assign PC_ff = n0612;
// 
// IRAM_ff
// 
// 
// XRAM_DATA_OUT_ff
// 
assign XRAM_DATA_OUT_ff = n1001;
// 
// PSW_ff
// 
assign PSW_ff = n1018;
assign n2742 = 8'h3;
assign n2743 = ( RD_ROM_0 == n2742 );
assign n2744 = 8'h4;
assign n2745 = ( RD_ROM_0 == n2744 );
assign n2746 = 8'h13;
assign n2747 = ( RD_ROM_0 == n2746 );
assign n2748 = 8'h14;
assign n2749 = ( RD_ROM_0 == n2748 );
assign n2750 = 8'h23;
assign n2751 = ( RD_ROM_0 == n2750 );
assign n2752 = 8'h24;
assign n2753 = ( RD_ROM_0 == n2752 );
assign n2754 = 8'h33;
assign n2755 = ( RD_ROM_0 == n2754 );
assign n2756 = 8'h34;
assign n2757 = ( RD_ROM_0 == n2756 );
assign n2758 = 8'h44;
assign n2759 = ( RD_ROM_0 == n2758 );
assign n2760 = 8'h54;
assign n2761 = ( RD_ROM_0 == n2760 );
assign n2762 = 8'h64;
assign n2763 = ( RD_ROM_0 == n2762 );
assign n2764 = 8'h74;
assign n2765 = ( RD_ROM_0 == n2764 );
assign n2766 = 8'h75;
assign n2767 = ( RD_ROM_0 == n2766 );
assign n2768 = ( RD_ROM_0 == n1068 );
assign n2769 = 8'h84;
assign n2770 = ( RD_ROM_0 == n2769 );
assign n2771 = 8'h93;
assign n2772 = ( RD_ROM_0 == n2771 );
assign n2773 = 8'h94;
assign n2774 = ( RD_ROM_0 == n2773 );
assign n2775 = 8'ha4;
assign n2776 = ( RD_ROM_0 == n2775 );
assign n2777 = 8'hc4;
assign n2778 = ( RD_ROM_0 == n2777 );
assign n2779 = 8'hd4;
assign n2780 = ( RD_ROM_0 == n2779 );
assign n2781 = ( RD_ROM_0 == n1059 );
assign n2782 = 8'he4;
assign n2783 = ( RD_ROM_0 == n2782 );
assign n2784 = 8'hf4;
assign n2785 = ( RD_ROM_0 == n2784 );
assign ACC_next = 
  ( n2743 ) ? ACC_03 : 
  ( n2745 ) ? ACC_04 : 
  ( n0002 ) ? ACC_05 : 
  ( n0041 ) ? ACC_10 : 
  ( n2747 ) ? ACC_13 : 
  ( n2749 ) ? ACC_14 : 
  ( n0052 ) ? ACC_15 : 
  ( n2751 ) ? ACC_23 : 
  ( n2753 ) ? ACC_24 : 
  ( n0077 ) ? ACC_25 : 
  ( n0079 ) ? ACC_26 : 
  ( n0081 ) ? ACC_27 : 
  ( n0083 ) ? ACC_28 : 
  ( n0085 ) ? ACC_29 : 
  ( n0087 ) ? ACC_2a : 
  ( n0089 ) ? ACC_2b : 
  ( n0091 ) ? ACC_2c : 
  ( n0093 ) ? ACC_2d : 
  ( n0095 ) ? ACC_2e : 
  ( n0097 ) ? ACC_2f : 
  ( n2755 ) ? ACC_33 : 
  ( n2757 ) ? ACC_34 : 
  ( n0103 ) ? ACC_35 : 
  ( n0105 ) ? ACC_36 : 
  ( n0107 ) ? ACC_37 : 
  ( n0109 ) ? ACC_38 : 
  ( n0111 ) ? ACC_39 : 
  ( n0113 ) ? ACC_3a : 
  ( n0115 ) ? ACC_3b : 
  ( n0117 ) ? ACC_3c : 
  ( n0119 ) ? ACC_3d : 
  ( n0121 ) ? ACC_3e : 
  ( n0123 ) ? ACC_3f : 
  ( n0127 ) ? ACC_43 : 
  ( n2759 ) ? ACC_44 : 
  ( n0129 ) ? ACC_45 : 
  ( n0131 ) ? ACC_46 : 
  ( n0133 ) ? ACC_47 : 
  ( n0135 ) ? ACC_48 : 
  ( n0137 ) ? ACC_49 : 
  ( n0139 ) ? ACC_4a : 
  ( n0141 ) ? ACC_4b : 
  ( n0143 ) ? ACC_4c : 
  ( n0145 ) ? ACC_4d : 
  ( n0147 ) ? ACC_4e : 
  ( n0149 ) ? ACC_4f : 
  ( n0153 ) ? ACC_53 : 
  ( n2761 ) ? ACC_54 : 
  ( n0155 ) ? ACC_55 : 
  ( n0157 ) ? ACC_56 : 
  ( n0159 ) ? ACC_57 : 
  ( n0161 ) ? ACC_58 : 
  ( n0163 ) ? ACC_59 : 
  ( n0165 ) ? ACC_5a : 
  ( n0167 ) ? ACC_5b : 
  ( n0169 ) ? ACC_5c : 
  ( n0171 ) ? ACC_5d : 
  ( n0173 ) ? ACC_5e : 
  ( n0175 ) ? ACC_5f : 
  ( n0177 ) ? ACC_62 : 
  ( n0179 ) ? ACC_63 : 
  ( n2763 ) ? ACC_64 : 
  ( n0181 ) ? ACC_65 : 
  ( n0183 ) ? ACC_66 : 
  ( n0185 ) ? ACC_67 : 
  ( n0187 ) ? ACC_68 : 
  ( n0189 ) ? ACC_69 : 
  ( n0191 ) ? ACC_6a : 
  ( n0193 ) ? ACC_6b : 
  ( n0195 ) ? ACC_6c : 
  ( n0197 ) ? ACC_6d : 
  ( n0199 ) ? ACC_6e : 
  ( n0201 ) ? ACC_6f : 
  ( n2765 ) ? ACC_74 : 
  ( n2767 ) ? ACC_75 : 
  ( n2768 ) ? ACC_83 : 
  ( n2770 ) ? ACC_84 : 
  ( n0211 ) ? ACC_85 : 
  ( n0213 ) ? ACC_86 : 
  ( n0215 ) ? ACC_87 : 
  ( n0217 ) ? ACC_88 : 
  ( n0219 ) ? ACC_89 : 
  ( n0221 ) ? ACC_8a : 
  ( n0223 ) ? ACC_8b : 
  ( n0225 ) ? ACC_8c : 
  ( n0227 ) ? ACC_8d : 
  ( n0229 ) ? ACC_8e : 
  ( n0231 ) ? ACC_8f : 
  ( n0233 ) ? ACC_92 : 
  ( n2772 ) ? ACC_93 : 
  ( n2774 ) ? ACC_94 : 
  ( n0235 ) ? ACC_95 : 
  ( n0237 ) ? ACC_96 : 
  ( n0239 ) ? ACC_97 : 
  ( n0241 ) ? ACC_98 : 
  ( n0243 ) ? ACC_99 : 
  ( n0245 ) ? ACC_9a : 
  ( n0247 ) ? ACC_9b : 
  ( n0249 ) ? ACC_9c : 
  ( n0251 ) ? ACC_9d : 
  ( n0253 ) ? ACC_9e : 
  ( n0255 ) ? ACC_9f : 
  ( n2776 ) ? ACC_a4 : 
  ( n0283 ) ? ACC_b2 : 
  ( n0309 ) ? ACC_c2 : 
  ( n2778 ) ? ACC_c4 : 
  ( n0311 ) ? ACC_c5 : 
  ( n0313 ) ? ACC_c6 : 
  ( n0315 ) ? ACC_c7 : 
  ( n0317 ) ? ACC_c8 : 
  ( n0319 ) ? ACC_c9 : 
  ( n0321 ) ? ACC_ca : 
  ( n0323 ) ? ACC_cb : 
  ( n0325 ) ? ACC_cc : 
  ( n0327 ) ? ACC_cd : 
  ( n0329 ) ? ACC_ce : 
  ( n0331 ) ? ACC_cf : 
  ( n0333 ) ? ACC_d0 : 
  ( n0335 ) ? ACC_d2 : 
  ( n2780 ) ? ACC_d4 : 
  ( n0337 ) ? ACC_d5 : 
  ( n0339 ) ? ACC_d6 : 
  ( n0341 ) ? ACC_d7 : 
  ( n2781 ) ? ACC_e0 : 
  ( n0359 ) ? ACC_e2 : 
  ( n0361 ) ? ACC_e3 : 
  ( n2783 ) ? ACC_e4 : 
  ( n0363 ) ? ACC_e5 : 
  ( n0365 ) ? ACC_e6 : 
  ( n0367 ) ? ACC_e7 : 
  ( n0369 ) ? ACC_e8 : 
  ( n0371 ) ? ACC_e9 : 
  ( n0373 ) ? ACC_ea : 
  ( n0375 ) ? ACC_eb : 
  ( n0377 ) ? ACC_ec : 
  ( n0379 ) ? ACC_ed : 
  ( n0381 ) ? ACC_ee : 
  ( n0383 ) ? ACC_ef : 
  ( n2785 ) ? ACC_f4 : 
  ( ACC );
assign n2786 = 8'hf5;
assign n2787 = ( RD_ROM_0 == n2786 );
assign P2_next = 
  ( n0002 ) ? P2_05 : 
  ( n0041 ) ? P2_10 : 
  ( n0052 ) ? P2_15 : 
  ( n0125 ) ? P2_42 : 
  ( n0127 ) ? P2_43 : 
  ( n0151 ) ? P2_52 : 
  ( n0153 ) ? P2_53 : 
  ( n0177 ) ? P2_62 : 
  ( n0179 ) ? P2_63 : 
  ( n2767 ) ? P2_75 : 
  ( n0211 ) ? P2_85 : 
  ( n0213 ) ? P2_86 : 
  ( n0215 ) ? P2_87 : 
  ( n0217 ) ? P2_88 : 
  ( n0219 ) ? P2_89 : 
  ( n0221 ) ? P2_8a : 
  ( n0223 ) ? P2_8b : 
  ( n0225 ) ? P2_8c : 
  ( n0227 ) ? P2_8d : 
  ( n0229 ) ? P2_8e : 
  ( n0231 ) ? P2_8f : 
  ( n0233 ) ? P2_92 : 
  ( n0283 ) ? P2_b2 : 
  ( n0309 ) ? P2_c2 : 
  ( n0311 ) ? P2_c5 : 
  ( n0333 ) ? P2_d0 : 
  ( n0335 ) ? P2_d2 : 
  ( n0337 ) ? P2_d5 : 
  ( n2787 ) ? P2_f5 : 
  ( P2 );
assign P0_next = 
  ( n0002 ) ? P0_05 : 
  ( n0041 ) ? P0_10 : 
  ( n0052 ) ? P0_15 : 
  ( n0125 ) ? P0_42 : 
  ( n0127 ) ? P0_43 : 
  ( n0151 ) ? P0_52 : 
  ( n0153 ) ? P0_53 : 
  ( n0177 ) ? P0_62 : 
  ( n0179 ) ? P0_63 : 
  ( n2767 ) ? P0_75 : 
  ( n0211 ) ? P0_85 : 
  ( n0213 ) ? P0_86 : 
  ( n0215 ) ? P0_87 : 
  ( n0217 ) ? P0_88 : 
  ( n0219 ) ? P0_89 : 
  ( n0221 ) ? P0_8a : 
  ( n0223 ) ? P0_8b : 
  ( n0225 ) ? P0_8c : 
  ( n0227 ) ? P0_8d : 
  ( n0229 ) ? P0_8e : 
  ( n0231 ) ? P0_8f : 
  ( n0233 ) ? P0_92 : 
  ( n0283 ) ? P0_b2 : 
  ( n0309 ) ? P0_c2 : 
  ( n0311 ) ? P0_c5 : 
  ( n0333 ) ? P0_d0 : 
  ( n0335 ) ? P0_d2 : 
  ( n0337 ) ? P0_d5 : 
  ( n2787 ) ? P0_f5 : 
  ( P0 );
assign B_next = 
  ( n0002 ) ? B_05 : 
  ( n0041 ) ? B_10 : 
  ( n0052 ) ? B_15 : 
  ( n0125 ) ? B_42 : 
  ( n0127 ) ? B_43 : 
  ( n0151 ) ? B_52 : 
  ( n0153 ) ? B_53 : 
  ( n0177 ) ? B_62 : 
  ( n0179 ) ? B_63 : 
  ( n2767 ) ? B_75 : 
  ( n2770 ) ? B_84 : 
  ( n0211 ) ? B_85 : 
  ( n0213 ) ? B_86 : 
  ( n0215 ) ? B_87 : 
  ( n0217 ) ? B_88 : 
  ( n0219 ) ? B_89 : 
  ( n0221 ) ? B_8a : 
  ( n0223 ) ? B_8b : 
  ( n0225 ) ? B_8c : 
  ( n0227 ) ? B_8d : 
  ( n0229 ) ? B_8e : 
  ( n0231 ) ? B_8f : 
  ( n0233 ) ? B_92 : 
  ( n2776 ) ? B_a4 : 
  ( n0283 ) ? B_b2 : 
  ( n0309 ) ? B_c2 : 
  ( n0311 ) ? B_c5 : 
  ( n0333 ) ? B_d0 : 
  ( n0335 ) ? B_d2 : 
  ( n0337 ) ? B_d5 : 
  ( n2787 ) ? B_f5 : 
  ( B );
assign P1_next = 
  ( n0002 ) ? P1_05 : 
  ( n0041 ) ? P1_10 : 
  ( n0052 ) ? P1_15 : 
  ( n0125 ) ? P1_42 : 
  ( n0127 ) ? P1_43 : 
  ( n0151 ) ? P1_52 : 
  ( n0153 ) ? P1_53 : 
  ( n0177 ) ? P1_62 : 
  ( n0179 ) ? P1_63 : 
  ( n2767 ) ? P1_75 : 
  ( n0211 ) ? P1_85 : 
  ( n0213 ) ? P1_86 : 
  ( n0215 ) ? P1_87 : 
  ( n0217 ) ? P1_88 : 
  ( n0219 ) ? P1_89 : 
  ( n0221 ) ? P1_8a : 
  ( n0223 ) ? P1_8b : 
  ( n0225 ) ? P1_8c : 
  ( n0227 ) ? P1_8d : 
  ( n0229 ) ? P1_8e : 
  ( n0231 ) ? P1_8f : 
  ( n0233 ) ? P1_92 : 
  ( n0283 ) ? P1_b2 : 
  ( n0309 ) ? P1_c2 : 
  ( n0311 ) ? P1_c5 : 
  ( n0333 ) ? P1_d0 : 
  ( n0335 ) ? P1_d2 : 
  ( n0337 ) ? P1_d5 : 
  ( n2787 ) ? P1_f5 : 
  ( P1 );
assign n2788 = ( RD_ROM_0 == n1001 );
assign n2789 = ( RD_ROM_0 == n0574 );
assign n2790 = ( RD_ROM_0 == n1233 );
assign n2791 = 8'h11;
assign n2792 = ( RD_ROM_0 == n2791 );
assign n2793 = 8'h12;
assign n2794 = ( RD_ROM_0 == n2793 );
assign n2795 = 8'h21;
assign n2796 = ( RD_ROM_0 == n2795 );
assign n2797 = 8'h31;
assign n2798 = ( RD_ROM_0 == n2797 );
assign n2799 = 8'h40;
assign n2800 = ( RD_ROM_0 == n2799 );
assign n2801 = 8'h41;
assign n2802 = ( RD_ROM_0 == n2801 );
assign n2803 = 8'h50;
assign n2804 = ( RD_ROM_0 == n2803 );
assign n2805 = 8'h51;
assign n2806 = ( RD_ROM_0 == n2805 );
assign n2807 = 8'h60;
assign n2808 = ( RD_ROM_0 == n2807 );
assign n2809 = 8'h61;
assign n2810 = ( RD_ROM_0 == n2809 );
assign n2811 = 8'h70;
assign n2812 = ( RD_ROM_0 == n2811 );
assign n2813 = 8'h71;
assign n2814 = ( RD_ROM_0 == n2813 );
assign n2815 = 8'h73;
assign n2816 = ( RD_ROM_0 == n2815 );
assign n2817 = 8'h78;
assign n2818 = ( RD_ROM_0 == n2817 );
assign n2819 = 8'h79;
assign n2820 = ( RD_ROM_0 == n2819 );
assign n2821 = 8'h7a;
assign n2822 = ( RD_ROM_0 == n2821 );
assign n2823 = 8'h7b;
assign n2824 = ( RD_ROM_0 == n2823 );
assign n2825 = 8'h7c;
assign n2826 = ( RD_ROM_0 == n2825 );
assign n2827 = 8'h7d;
assign n2828 = ( RD_ROM_0 == n2827 );
assign n2829 = 8'h7e;
assign n2830 = ( RD_ROM_0 == n2829 );
assign n2831 = 8'h7f;
assign n2832 = ( RD_ROM_0 == n2831 );
assign n2833 = ( RD_ROM_0 == n1063 );
assign n2834 = ( RD_ROM_0 == n1065 );
assign n2835 = ( RD_ROM_0 == n1077 );
assign n2836 = 8'h91;
assign n2837 = ( RD_ROM_0 == n2836 );
assign n2838 = 8'ha1;
assign n2839 = ( RD_ROM_0 == n2838 );
assign n2840 = 8'ha3;
assign n2841 = ( RD_ROM_0 == n2840 );
assign n2842 = 8'ha5;
assign n2843 = ( RD_ROM_0 == n2842 );
assign n2844 = 8'hb1;
assign n2845 = ( RD_ROM_0 == n2844 );
assign n2846 = 8'hb3;
assign n2847 = ( RD_ROM_0 == n2846 );
assign n2848 = 8'hb4;
assign n2849 = ( RD_ROM_0 == n2848 );
assign n2850 = 8'hc1;
assign n2851 = ( RD_ROM_0 == n2850 );
assign n2852 = 8'hc3;
assign n2853 = ( RD_ROM_0 == n2852 );
assign n2854 = 8'hd1;
assign n2855 = ( RD_ROM_0 == n2854 );
assign n2856 = 8'hd3;
assign n2857 = ( RD_ROM_0 == n2856 );
assign n2858 = 8'he1;
assign n2859 = ( RD_ROM_0 == n2858 );
assign n2860 = ( RD_ROM_0 == n1086 );
assign n2861 = 8'hf1;
assign n2862 = ( RD_ROM_0 == n2861 );
assign n2863 = 8'hf7;
assign n2864 = ( RD_ROM_0 == n2863 );
assign n2865 = 8'hf8;
assign n2866 = ( RD_ROM_0 == n2865 );
assign n2867 = 8'hf9;
assign n2868 = ( RD_ROM_0 == n2867 );
assign n2869 = 8'hfa;
assign n2870 = ( RD_ROM_0 == n2869 );
assign n2871 = 8'hfb;
assign n2872 = ( RD_ROM_0 == n2871 );
assign n2873 = 8'hfc;
assign n2874 = ( RD_ROM_0 == n2873 );
assign n2875 = 8'hfd;
assign n2876 = ( RD_ROM_0 == n2875 );
assign n2877 = 8'hfe;
assign n2878 = ( RD_ROM_0 == n2877 );
assign n2879 = ( RD_ROM_0 == n2092 );
assign XRAM_ADDR_next = 
  ( n2788 ) ? XRAM_ADDR_00 : 
  ( n2789 ) ? XRAM_ADDR_01 : 
  ( n2790 ) ? XRAM_ADDR_02 : 
  ( n2743 ) ? XRAM_ADDR_03 : 
  ( n2745 ) ? XRAM_ADDR_04 : 
  ( n0002 ) ? XRAM_ADDR_05 : 
  ( n0004 ) ? XRAM_ADDR_06 : 
  ( n0009 ) ? XRAM_ADDR_07 : 
  ( n0013 ) ? XRAM_ADDR_08 : 
  ( n0015 ) ? XRAM_ADDR_09 : 
  ( n0017 ) ? XRAM_ADDR_0a : 
  ( n0021 ) ? XRAM_ADDR_0b : 
  ( n0025 ) ? XRAM_ADDR_0c : 
  ( n0029 ) ? XRAM_ADDR_0d : 
  ( n0033 ) ? XRAM_ADDR_0e : 
  ( n0037 ) ? XRAM_ADDR_0f : 
  ( n0041 ) ? XRAM_ADDR_10 : 
  ( n2792 ) ? XRAM_ADDR_11 : 
  ( n2794 ) ? XRAM_ADDR_12 : 
  ( n2747 ) ? XRAM_ADDR_13 : 
  ( n2749 ) ? XRAM_ADDR_14 : 
  ( n0052 ) ? XRAM_ADDR_15 : 
  ( n0054 ) ? XRAM_ADDR_16 : 
  ( n0056 ) ? XRAM_ADDR_17 : 
  ( n0058 ) ? XRAM_ADDR_18 : 
  ( n0060 ) ? XRAM_ADDR_19 : 
  ( n0062 ) ? XRAM_ADDR_1a : 
  ( n0064 ) ? XRAM_ADDR_1b : 
  ( n0066 ) ? XRAM_ADDR_1c : 
  ( n0068 ) ? XRAM_ADDR_1d : 
  ( n0070 ) ? XRAM_ADDR_1e : 
  ( n0072 ) ? XRAM_ADDR_1f : 
  ( n0073 ) ? XRAM_ADDR_20 : 
  ( n2796 ) ? XRAM_ADDR_21 : 
  ( n0075 ) ? XRAM_ADDR_22 : 
  ( n2751 ) ? XRAM_ADDR_23 : 
  ( n2753 ) ? XRAM_ADDR_24 : 
  ( n0077 ) ? XRAM_ADDR_25 : 
  ( n0079 ) ? XRAM_ADDR_26 : 
  ( n0081 ) ? XRAM_ADDR_27 : 
  ( n0083 ) ? XRAM_ADDR_28 : 
  ( n0085 ) ? XRAM_ADDR_29 : 
  ( n0087 ) ? XRAM_ADDR_2a : 
  ( n0089 ) ? XRAM_ADDR_2b : 
  ( n0091 ) ? XRAM_ADDR_2c : 
  ( n0093 ) ? XRAM_ADDR_2d : 
  ( n0095 ) ? XRAM_ADDR_2e : 
  ( n0097 ) ? XRAM_ADDR_2f : 
  ( n0099 ) ? XRAM_ADDR_30 : 
  ( n2798 ) ? XRAM_ADDR_31 : 
  ( n0101 ) ? XRAM_ADDR_32 : 
  ( n2755 ) ? XRAM_ADDR_33 : 
  ( n2757 ) ? XRAM_ADDR_34 : 
  ( n0103 ) ? XRAM_ADDR_35 : 
  ( n0105 ) ? XRAM_ADDR_36 : 
  ( n0107 ) ? XRAM_ADDR_37 : 
  ( n0109 ) ? XRAM_ADDR_38 : 
  ( n0111 ) ? XRAM_ADDR_39 : 
  ( n0113 ) ? XRAM_ADDR_3a : 
  ( n0115 ) ? XRAM_ADDR_3b : 
  ( n0117 ) ? XRAM_ADDR_3c : 
  ( n0119 ) ? XRAM_ADDR_3d : 
  ( n0121 ) ? XRAM_ADDR_3e : 
  ( n0123 ) ? XRAM_ADDR_3f : 
  ( n2800 ) ? XRAM_ADDR_40 : 
  ( n2802 ) ? XRAM_ADDR_41 : 
  ( n0125 ) ? XRAM_ADDR_42 : 
  ( n0127 ) ? XRAM_ADDR_43 : 
  ( n2759 ) ? XRAM_ADDR_44 : 
  ( n0129 ) ? XRAM_ADDR_45 : 
  ( n0131 ) ? XRAM_ADDR_46 : 
  ( n0133 ) ? XRAM_ADDR_47 : 
  ( n0135 ) ? XRAM_ADDR_48 : 
  ( n0137 ) ? XRAM_ADDR_49 : 
  ( n0139 ) ? XRAM_ADDR_4a : 
  ( n0141 ) ? XRAM_ADDR_4b : 
  ( n0143 ) ? XRAM_ADDR_4c : 
  ( n0145 ) ? XRAM_ADDR_4d : 
  ( n0147 ) ? XRAM_ADDR_4e : 
  ( n0149 ) ? XRAM_ADDR_4f : 
  ( n2804 ) ? XRAM_ADDR_50 : 
  ( n2806 ) ? XRAM_ADDR_51 : 
  ( n0151 ) ? XRAM_ADDR_52 : 
  ( n0153 ) ? XRAM_ADDR_53 : 
  ( n2761 ) ? XRAM_ADDR_54 : 
  ( n0155 ) ? XRAM_ADDR_55 : 
  ( n0157 ) ? XRAM_ADDR_56 : 
  ( n0159 ) ? XRAM_ADDR_57 : 
  ( n0161 ) ? XRAM_ADDR_58 : 
  ( n0163 ) ? XRAM_ADDR_59 : 
  ( n0165 ) ? XRAM_ADDR_5a : 
  ( n0167 ) ? XRAM_ADDR_5b : 
  ( n0169 ) ? XRAM_ADDR_5c : 
  ( n0171 ) ? XRAM_ADDR_5d : 
  ( n0173 ) ? XRAM_ADDR_5e : 
  ( n0175 ) ? XRAM_ADDR_5f : 
  ( n2808 ) ? XRAM_ADDR_60 : 
  ( n2810 ) ? XRAM_ADDR_61 : 
  ( n0177 ) ? XRAM_ADDR_62 : 
  ( n0179 ) ? XRAM_ADDR_63 : 
  ( n2763 ) ? XRAM_ADDR_64 : 
  ( n0181 ) ? XRAM_ADDR_65 : 
  ( n0183 ) ? XRAM_ADDR_66 : 
  ( n0185 ) ? XRAM_ADDR_67 : 
  ( n0187 ) ? XRAM_ADDR_68 : 
  ( n0189 ) ? XRAM_ADDR_69 : 
  ( n0191 ) ? XRAM_ADDR_6a : 
  ( n0193 ) ? XRAM_ADDR_6b : 
  ( n0195 ) ? XRAM_ADDR_6c : 
  ( n0197 ) ? XRAM_ADDR_6d : 
  ( n0199 ) ? XRAM_ADDR_6e : 
  ( n0201 ) ? XRAM_ADDR_6f : 
  ( n2812 ) ? XRAM_ADDR_70 : 
  ( n2814 ) ? XRAM_ADDR_71 : 
  ( n0203 ) ? XRAM_ADDR_72 : 
  ( n2816 ) ? XRAM_ADDR_73 : 
  ( n2765 ) ? XRAM_ADDR_74 : 
  ( n2767 ) ? XRAM_ADDR_75 : 
  ( n0205 ) ? XRAM_ADDR_76 : 
  ( n0207 ) ? XRAM_ADDR_77 : 
  ( n2818 ) ? XRAM_ADDR_78 : 
  ( n2820 ) ? XRAM_ADDR_79 : 
  ( n2822 ) ? XRAM_ADDR_7a : 
  ( n2824 ) ? XRAM_ADDR_7b : 
  ( n2826 ) ? XRAM_ADDR_7c : 
  ( n2828 ) ? XRAM_ADDR_7d : 
  ( n2830 ) ? XRAM_ADDR_7e : 
  ( n2832 ) ? XRAM_ADDR_7f : 
  ( n2833 ) ? XRAM_ADDR_80 : 
  ( n2834 ) ? XRAM_ADDR_81 : 
  ( n0209 ) ? XRAM_ADDR_82 : 
  ( n2768 ) ? XRAM_ADDR_83 : 
  ( n2770 ) ? XRAM_ADDR_84 : 
  ( n0211 ) ? XRAM_ADDR_85 : 
  ( n0213 ) ? XRAM_ADDR_86 : 
  ( n0215 ) ? XRAM_ADDR_87 : 
  ( n0217 ) ? XRAM_ADDR_88 : 
  ( n0219 ) ? XRAM_ADDR_89 : 
  ( n0221 ) ? XRAM_ADDR_8a : 
  ( n0223 ) ? XRAM_ADDR_8b : 
  ( n0225 ) ? XRAM_ADDR_8c : 
  ( n0227 ) ? XRAM_ADDR_8d : 
  ( n0229 ) ? XRAM_ADDR_8e : 
  ( n0231 ) ? XRAM_ADDR_8f : 
  ( n2835 ) ? XRAM_ADDR_90 : 
  ( n2837 ) ? XRAM_ADDR_91 : 
  ( n0233 ) ? XRAM_ADDR_92 : 
  ( n2772 ) ? XRAM_ADDR_93 : 
  ( n2774 ) ? XRAM_ADDR_94 : 
  ( n0235 ) ? XRAM_ADDR_95 : 
  ( n0237 ) ? XRAM_ADDR_96 : 
  ( n0239 ) ? XRAM_ADDR_97 : 
  ( n0241 ) ? XRAM_ADDR_98 : 
  ( n0243 ) ? XRAM_ADDR_99 : 
  ( n0245 ) ? XRAM_ADDR_9a : 
  ( n0247 ) ? XRAM_ADDR_9b : 
  ( n0249 ) ? XRAM_ADDR_9c : 
  ( n0251 ) ? XRAM_ADDR_9d : 
  ( n0253 ) ? XRAM_ADDR_9e : 
  ( n0255 ) ? XRAM_ADDR_9f : 
  ( n0257 ) ? XRAM_ADDR_a0 : 
  ( n2839 ) ? XRAM_ADDR_a1 : 
  ( n0259 ) ? XRAM_ADDR_a2 : 
  ( n2841 ) ? XRAM_ADDR_a3 : 
  ( n2776 ) ? XRAM_ADDR_a4 : 
  ( n2843 ) ? XRAM_ADDR_a5 : 
  ( n0261 ) ? XRAM_ADDR_a6 : 
  ( n0263 ) ? XRAM_ADDR_a7 : 
  ( n0265 ) ? XRAM_ADDR_a8 : 
  ( n0267 ) ? XRAM_ADDR_a9 : 
  ( n0269 ) ? XRAM_ADDR_aa : 
  ( n0271 ) ? XRAM_ADDR_ab : 
  ( n0273 ) ? XRAM_ADDR_ac : 
  ( n0275 ) ? XRAM_ADDR_ad : 
  ( n0277 ) ? XRAM_ADDR_ae : 
  ( n0279 ) ? XRAM_ADDR_af : 
  ( n0281 ) ? XRAM_ADDR_b0 : 
  ( n2845 ) ? XRAM_ADDR_b1 : 
  ( n0283 ) ? XRAM_ADDR_b2 : 
  ( n2847 ) ? XRAM_ADDR_b3 : 
  ( n2849 ) ? XRAM_ADDR_b4 : 
  ( n0285 ) ? XRAM_ADDR_b5 : 
  ( n0287 ) ? XRAM_ADDR_b6 : 
  ( n0289 ) ? XRAM_ADDR_b7 : 
  ( n0291 ) ? XRAM_ADDR_b8 : 
  ( n0293 ) ? XRAM_ADDR_b9 : 
  ( n0295 ) ? XRAM_ADDR_ba : 
  ( n0297 ) ? XRAM_ADDR_bb : 
  ( n0299 ) ? XRAM_ADDR_bc : 
  ( n0301 ) ? XRAM_ADDR_bd : 
  ( n0303 ) ? XRAM_ADDR_be : 
  ( n0305 ) ? XRAM_ADDR_bf : 
  ( n0307 ) ? XRAM_ADDR_c0 : 
  ( n2851 ) ? XRAM_ADDR_c1 : 
  ( n0309 ) ? XRAM_ADDR_c2 : 
  ( n2853 ) ? XRAM_ADDR_c3 : 
  ( n2778 ) ? XRAM_ADDR_c4 : 
  ( n0311 ) ? XRAM_ADDR_c5 : 
  ( n0313 ) ? XRAM_ADDR_c6 : 
  ( n0315 ) ? XRAM_ADDR_c7 : 
  ( n0317 ) ? XRAM_ADDR_c8 : 
  ( n0319 ) ? XRAM_ADDR_c9 : 
  ( n0321 ) ? XRAM_ADDR_ca : 
  ( n0323 ) ? XRAM_ADDR_cb : 
  ( n0325 ) ? XRAM_ADDR_cc : 
  ( n0327 ) ? XRAM_ADDR_cd : 
  ( n0329 ) ? XRAM_ADDR_ce : 
  ( n0331 ) ? XRAM_ADDR_cf : 
  ( n0333 ) ? XRAM_ADDR_d0 : 
  ( n2855 ) ? XRAM_ADDR_d1 : 
  ( n0335 ) ? XRAM_ADDR_d2 : 
  ( n2857 ) ? XRAM_ADDR_d3 : 
  ( n2780 ) ? XRAM_ADDR_d4 : 
  ( n0337 ) ? XRAM_ADDR_d5 : 
  ( n0339 ) ? XRAM_ADDR_d6 : 
  ( n0341 ) ? XRAM_ADDR_d7 : 
  ( n0343 ) ? XRAM_ADDR_d8 : 
  ( n0345 ) ? XRAM_ADDR_d9 : 
  ( n0347 ) ? XRAM_ADDR_da : 
  ( n0349 ) ? XRAM_ADDR_db : 
  ( n0351 ) ? XRAM_ADDR_dc : 
  ( n0353 ) ? XRAM_ADDR_dd : 
  ( n0355 ) ? XRAM_ADDR_de : 
  ( n0357 ) ? XRAM_ADDR_df : 
  ( n2781 ) ? XRAM_ADDR_e0 : 
  ( n2859 ) ? XRAM_ADDR_e1 : 
  ( n0359 ) ? XRAM_ADDR_e2 : 
  ( n0361 ) ? XRAM_ADDR_e3 : 
  ( n2783 ) ? XRAM_ADDR_e4 : 
  ( n0363 ) ? XRAM_ADDR_e5 : 
  ( n0365 ) ? XRAM_ADDR_e6 : 
  ( n0367 ) ? XRAM_ADDR_e7 : 
  ( n0369 ) ? XRAM_ADDR_e8 : 
  ( n0371 ) ? XRAM_ADDR_e9 : 
  ( n0373 ) ? XRAM_ADDR_ea : 
  ( n0375 ) ? XRAM_ADDR_eb : 
  ( n0377 ) ? XRAM_ADDR_ec : 
  ( n0379 ) ? XRAM_ADDR_ed : 
  ( n0381 ) ? XRAM_ADDR_ee : 
  ( n0383 ) ? XRAM_ADDR_ef : 
  ( n2860 ) ? XRAM_ADDR_f0 : 
  ( n2862 ) ? XRAM_ADDR_f1 : 
  ( n0385 ) ? XRAM_ADDR_f2 : 
  ( n0387 ) ? XRAM_ADDR_f3 : 
  ( n2785 ) ? XRAM_ADDR_f4 : 
  ( n2787 ) ? XRAM_ADDR_f5 : 
  ( n0389 ) ? XRAM_ADDR_f6 : 
  ( n2864 ) ? XRAM_ADDR_f7 : 
  ( n2866 ) ? XRAM_ADDR_f8 : 
  ( n2868 ) ? XRAM_ADDR_f9 : 
  ( n2870 ) ? XRAM_ADDR_fa : 
  ( n2872 ) ? XRAM_ADDR_fb : 
  ( n2874 ) ? XRAM_ADDR_fc : 
  ( n2876 ) ? XRAM_ADDR_fd : 
  ( n2878 ) ? XRAM_ADDR_fe : 
  ( n2879 ) ? XRAM_ADDR_ff : 
  ( XRAM_ADDR );
assign P3_next = 
  ( n0002 ) ? P3_05 : 
  ( n0041 ) ? P3_10 : 
  ( n0052 ) ? P3_15 : 
  ( n0125 ) ? P3_42 : 
  ( n0127 ) ? P3_43 : 
  ( n0151 ) ? P3_52 : 
  ( n0153 ) ? P3_53 : 
  ( n0177 ) ? P3_62 : 
  ( n0179 ) ? P3_63 : 
  ( n2767 ) ? P3_75 : 
  ( n0211 ) ? P3_85 : 
  ( n0213 ) ? P3_86 : 
  ( n0215 ) ? P3_87 : 
  ( n0217 ) ? P3_88 : 
  ( n0219 ) ? P3_89 : 
  ( n0221 ) ? P3_8a : 
  ( n0223 ) ? P3_8b : 
  ( n0225 ) ? P3_8c : 
  ( n0227 ) ? P3_8d : 
  ( n0229 ) ? P3_8e : 
  ( n0231 ) ? P3_8f : 
  ( n0233 ) ? P3_92 : 
  ( n0283 ) ? P3_b2 : 
  ( n0309 ) ? P3_c2 : 
  ( n0311 ) ? P3_c5 : 
  ( n0333 ) ? P3_d0 : 
  ( n0335 ) ? P3_d2 : 
  ( n0337 ) ? P3_d5 : 
  ( n2787 ) ? P3_f5 : 
  ( P3 );
assign SP_next = 
  ( n0002 ) ? SP_05 : 
  ( n2792 ) ? SP_11 : 
  ( n2794 ) ? SP_12 : 
  ( n0052 ) ? SP_15 : 
  ( n0075 ) ? SP_22 : 
  ( n2798 ) ? SP_31 : 
  ( n0101 ) ? SP_32 : 
  ( n0125 ) ? SP_42 : 
  ( n0127 ) ? SP_43 : 
  ( n2806 ) ? SP_51 : 
  ( n0151 ) ? SP_52 : 
  ( n0153 ) ? SP_53 : 
  ( n0177 ) ? SP_62 : 
  ( n0179 ) ? SP_63 : 
  ( n2814 ) ? SP_71 : 
  ( n2767 ) ? SP_75 : 
  ( n0211 ) ? SP_85 : 
  ( n0213 ) ? SP_86 : 
  ( n0215 ) ? SP_87 : 
  ( n0217 ) ? SP_88 : 
  ( n0219 ) ? SP_89 : 
  ( n0221 ) ? SP_8a : 
  ( n0223 ) ? SP_8b : 
  ( n0225 ) ? SP_8c : 
  ( n0227 ) ? SP_8d : 
  ( n0229 ) ? SP_8e : 
  ( n0231 ) ? SP_8f : 
  ( n2837 ) ? SP_91 : 
  ( n2845 ) ? SP_b1 : 
  ( n0307 ) ? SP_c0 : 
  ( n0311 ) ? SP_c5 : 
  ( n0333 ) ? SP_d0 : 
  ( n2855 ) ? SP_d1 : 
  ( n0337 ) ? SP_d5 : 
  ( n2862 ) ? SP_f1 : 
  ( n2787 ) ? SP_f5 : 
  ( SP );
assign PC_next = 
  ( n2788 ) ? PC_00 : 
  ( n2789 ) ? PC_01 : 
  ( n2790 ) ? PC_02 : 
  ( n2743 ) ? PC_03 : 
  ( n2745 ) ? PC_04 : 
  ( n0002 ) ? PC_05 : 
  ( n0004 ) ? PC_06 : 
  ( n0009 ) ? PC_07 : 
  ( n0013 ) ? PC_08 : 
  ( n0015 ) ? PC_09 : 
  ( n0017 ) ? PC_0a : 
  ( n0021 ) ? PC_0b : 
  ( n0025 ) ? PC_0c : 
  ( n0029 ) ? PC_0d : 
  ( n0033 ) ? PC_0e : 
  ( n0037 ) ? PC_0f : 
  ( n0041 ) ? PC_10 : 
  ( n2792 ) ? PC_11 : 
  ( n2794 ) ? PC_12 : 
  ( n2747 ) ? PC_13 : 
  ( n2749 ) ? PC_14 : 
  ( n0052 ) ? PC_15 : 
  ( n0054 ) ? PC_16 : 
  ( n0056 ) ? PC_17 : 
  ( n0058 ) ? PC_18 : 
  ( n0060 ) ? PC_19 : 
  ( n0062 ) ? PC_1a : 
  ( n0064 ) ? PC_1b : 
  ( n0066 ) ? PC_1c : 
  ( n0068 ) ? PC_1d : 
  ( n0070 ) ? PC_1e : 
  ( n0072 ) ? PC_1f : 
  ( n0073 ) ? PC_20 : 
  ( n2796 ) ? PC_21 : 
  ( n0075 ) ? PC_22 : 
  ( n2751 ) ? PC_23 : 
  ( n2753 ) ? PC_24 : 
  ( n0077 ) ? PC_25 : 
  ( n0079 ) ? PC_26 : 
  ( n0081 ) ? PC_27 : 
  ( n0083 ) ? PC_28 : 
  ( n0085 ) ? PC_29 : 
  ( n0087 ) ? PC_2a : 
  ( n0089 ) ? PC_2b : 
  ( n0091 ) ? PC_2c : 
  ( n0093 ) ? PC_2d : 
  ( n0095 ) ? PC_2e : 
  ( n0097 ) ? PC_2f : 
  ( n0099 ) ? PC_30 : 
  ( n2798 ) ? PC_31 : 
  ( n0101 ) ? PC_32 : 
  ( n2755 ) ? PC_33 : 
  ( n2757 ) ? PC_34 : 
  ( n0103 ) ? PC_35 : 
  ( n0105 ) ? PC_36 : 
  ( n0107 ) ? PC_37 : 
  ( n0109 ) ? PC_38 : 
  ( n0111 ) ? PC_39 : 
  ( n0113 ) ? PC_3a : 
  ( n0115 ) ? PC_3b : 
  ( n0117 ) ? PC_3c : 
  ( n0119 ) ? PC_3d : 
  ( n0121 ) ? PC_3e : 
  ( n0123 ) ? PC_3f : 
  ( n2800 ) ? PC_40 : 
  ( n2802 ) ? PC_41 : 
  ( n0125 ) ? PC_42 : 
  ( n0127 ) ? PC_43 : 
  ( n2759 ) ? PC_44 : 
  ( n0129 ) ? PC_45 : 
  ( n0131 ) ? PC_46 : 
  ( n0133 ) ? PC_47 : 
  ( n0135 ) ? PC_48 : 
  ( n0137 ) ? PC_49 : 
  ( n0139 ) ? PC_4a : 
  ( n0141 ) ? PC_4b : 
  ( n0143 ) ? PC_4c : 
  ( n0145 ) ? PC_4d : 
  ( n0147 ) ? PC_4e : 
  ( n0149 ) ? PC_4f : 
  ( n2804 ) ? PC_50 : 
  ( n2806 ) ? PC_51 : 
  ( n0151 ) ? PC_52 : 
  ( n0153 ) ? PC_53 : 
  ( n2761 ) ? PC_54 : 
  ( n0155 ) ? PC_55 : 
  ( n0157 ) ? PC_56 : 
  ( n0159 ) ? PC_57 : 
  ( n0161 ) ? PC_58 : 
  ( n0163 ) ? PC_59 : 
  ( n0165 ) ? PC_5a : 
  ( n0167 ) ? PC_5b : 
  ( n0169 ) ? PC_5c : 
  ( n0171 ) ? PC_5d : 
  ( n0173 ) ? PC_5e : 
  ( n0175 ) ? PC_5f : 
  ( n2808 ) ? PC_60 : 
  ( n2810 ) ? PC_61 : 
  ( n0177 ) ? PC_62 : 
  ( n0179 ) ? PC_63 : 
  ( n2763 ) ? PC_64 : 
  ( n0181 ) ? PC_65 : 
  ( n0183 ) ? PC_66 : 
  ( n0185 ) ? PC_67 : 
  ( n0187 ) ? PC_68 : 
  ( n0189 ) ? PC_69 : 
  ( n0191 ) ? PC_6a : 
  ( n0193 ) ? PC_6b : 
  ( n0195 ) ? PC_6c : 
  ( n0197 ) ? PC_6d : 
  ( n0199 ) ? PC_6e : 
  ( n0201 ) ? PC_6f : 
  ( n2812 ) ? PC_70 : 
  ( n2814 ) ? PC_71 : 
  ( n0203 ) ? PC_72 : 
  ( n2816 ) ? PC_73 : 
  ( n2765 ) ? PC_74 : 
  ( n2767 ) ? PC_75 : 
  ( n0205 ) ? PC_76 : 
  ( n0207 ) ? PC_77 : 
  ( n2818 ) ? PC_78 : 
  ( n2820 ) ? PC_79 : 
  ( n2822 ) ? PC_7a : 
  ( n2824 ) ? PC_7b : 
  ( n2826 ) ? PC_7c : 
  ( n2828 ) ? PC_7d : 
  ( n2830 ) ? PC_7e : 
  ( n2832 ) ? PC_7f : 
  ( n2833 ) ? PC_80 : 
  ( n2834 ) ? PC_81 : 
  ( n0209 ) ? PC_82 : 
  ( n2768 ) ? PC_83 : 
  ( n2770 ) ? PC_84 : 
  ( n0211 ) ? PC_85 : 
  ( n0213 ) ? PC_86 : 
  ( n0215 ) ? PC_87 : 
  ( n0217 ) ? PC_88 : 
  ( n0219 ) ? PC_89 : 
  ( n0221 ) ? PC_8a : 
  ( n0223 ) ? PC_8b : 
  ( n0225 ) ? PC_8c : 
  ( n0227 ) ? PC_8d : 
  ( n0229 ) ? PC_8e : 
  ( n0231 ) ? PC_8f : 
  ( n2835 ) ? PC_90 : 
  ( n2837 ) ? PC_91 : 
  ( n0233 ) ? PC_92 : 
  ( n2772 ) ? PC_93 : 
  ( n2774 ) ? PC_94 : 
  ( n0235 ) ? PC_95 : 
  ( n0237 ) ? PC_96 : 
  ( n0239 ) ? PC_97 : 
  ( n0241 ) ? PC_98 : 
  ( n0243 ) ? PC_99 : 
  ( n0245 ) ? PC_9a : 
  ( n0247 ) ? PC_9b : 
  ( n0249 ) ? PC_9c : 
  ( n0251 ) ? PC_9d : 
  ( n0253 ) ? PC_9e : 
  ( n0255 ) ? PC_9f : 
  ( n0257 ) ? PC_a0 : 
  ( n2839 ) ? PC_a1 : 
  ( n0259 ) ? PC_a2 : 
  ( n2841 ) ? PC_a3 : 
  ( n2776 ) ? PC_a4 : 
  ( n2843 ) ? PC_a5 : 
  ( n0261 ) ? PC_a6 : 
  ( n0263 ) ? PC_a7 : 
  ( n0265 ) ? PC_a8 : 
  ( n0267 ) ? PC_a9 : 
  ( n0269 ) ? PC_aa : 
  ( n0271 ) ? PC_ab : 
  ( n0273 ) ? PC_ac : 
  ( n0275 ) ? PC_ad : 
  ( n0277 ) ? PC_ae : 
  ( n0279 ) ? PC_af : 
  ( n0281 ) ? PC_b0 : 
  ( n2845 ) ? PC_b1 : 
  ( n0283 ) ? PC_b2 : 
  ( n2847 ) ? PC_b3 : 
  ( n2849 ) ? PC_b4 : 
  ( n0285 ) ? PC_b5 : 
  ( n0287 ) ? PC_b6 : 
  ( n0289 ) ? PC_b7 : 
  ( n0291 ) ? PC_b8 : 
  ( n0293 ) ? PC_b9 : 
  ( n0295 ) ? PC_ba : 
  ( n0297 ) ? PC_bb : 
  ( n0299 ) ? PC_bc : 
  ( n0301 ) ? PC_bd : 
  ( n0303 ) ? PC_be : 
  ( n0305 ) ? PC_bf : 
  ( n0307 ) ? PC_c0 : 
  ( n2851 ) ? PC_c1 : 
  ( n0309 ) ? PC_c2 : 
  ( n2853 ) ? PC_c3 : 
  ( n2778 ) ? PC_c4 : 
  ( n0311 ) ? PC_c5 : 
  ( n0313 ) ? PC_c6 : 
  ( n0315 ) ? PC_c7 : 
  ( n0317 ) ? PC_c8 : 
  ( n0319 ) ? PC_c9 : 
  ( n0321 ) ? PC_ca : 
  ( n0323 ) ? PC_cb : 
  ( n0325 ) ? PC_cc : 
  ( n0327 ) ? PC_cd : 
  ( n0329 ) ? PC_ce : 
  ( n0331 ) ? PC_cf : 
  ( n0333 ) ? PC_d0 : 
  ( n2855 ) ? PC_d1 : 
  ( n0335 ) ? PC_d2 : 
  ( n2857 ) ? PC_d3 : 
  ( n2780 ) ? PC_d4 : 
  ( n0337 ) ? PC_d5 : 
  ( n0339 ) ? PC_d6 : 
  ( n0341 ) ? PC_d7 : 
  ( n0343 ) ? PC_d8 : 
  ( n0345 ) ? PC_d9 : 
  ( n0347 ) ? PC_da : 
  ( n0349 ) ? PC_db : 
  ( n0351 ) ? PC_dc : 
  ( n0353 ) ? PC_dd : 
  ( n0355 ) ? PC_de : 
  ( n0357 ) ? PC_df : 
  ( n2781 ) ? PC_e0 : 
  ( n2859 ) ? PC_e1 : 
  ( n0359 ) ? PC_e2 : 
  ( n0361 ) ? PC_e3 : 
  ( n2783 ) ? PC_e4 : 
  ( n0363 ) ? PC_e5 : 
  ( n0365 ) ? PC_e6 : 
  ( n0367 ) ? PC_e7 : 
  ( n0369 ) ? PC_e8 : 
  ( n0371 ) ? PC_e9 : 
  ( n0373 ) ? PC_ea : 
  ( n0375 ) ? PC_eb : 
  ( n0377 ) ? PC_ec : 
  ( n0379 ) ? PC_ed : 
  ( n0381 ) ? PC_ee : 
  ( n0383 ) ? PC_ef : 
  ( n2860 ) ? PC_f0 : 
  ( n2862 ) ? PC_f1 : 
  ( n0385 ) ? PC_f2 : 
  ( n0387 ) ? PC_f3 : 
  ( n2785 ) ? PC_f4 : 
  ( n2787 ) ? PC_f5 : 
  ( n0389 ) ? PC_f6 : 
  ( n2864 ) ? PC_f7 : 
  ( n2866 ) ? PC_f8 : 
  ( n2868 ) ? PC_f9 : 
  ( n2870 ) ? PC_fa : 
  ( n2872 ) ? PC_fb : 
  ( n2874 ) ? PC_fc : 
  ( n2876 ) ? PC_fd : 
  ( n2878 ) ? PC_fe : 
  ( n2879 ) ? PC_ff : 
  ( PC );
assign XRAM_DATA_OUT_next = 
  ( n2788 ) ? XRAM_DATA_OUT_00 : 
  ( n2789 ) ? XRAM_DATA_OUT_01 : 
  ( n2790 ) ? XRAM_DATA_OUT_02 : 
  ( n2743 ) ? XRAM_DATA_OUT_03 : 
  ( n2745 ) ? XRAM_DATA_OUT_04 : 
  ( n0002 ) ? XRAM_DATA_OUT_05 : 
  ( n0004 ) ? XRAM_DATA_OUT_06 : 
  ( n0009 ) ? XRAM_DATA_OUT_07 : 
  ( n0013 ) ? XRAM_DATA_OUT_08 : 
  ( n0015 ) ? XRAM_DATA_OUT_09 : 
  ( n0017 ) ? XRAM_DATA_OUT_0a : 
  ( n0021 ) ? XRAM_DATA_OUT_0b : 
  ( n0025 ) ? XRAM_DATA_OUT_0c : 
  ( n0029 ) ? XRAM_DATA_OUT_0d : 
  ( n0033 ) ? XRAM_DATA_OUT_0e : 
  ( n0037 ) ? XRAM_DATA_OUT_0f : 
  ( n0041 ) ? XRAM_DATA_OUT_10 : 
  ( n2792 ) ? XRAM_DATA_OUT_11 : 
  ( n2794 ) ? XRAM_DATA_OUT_12 : 
  ( n2747 ) ? XRAM_DATA_OUT_13 : 
  ( n2749 ) ? XRAM_DATA_OUT_14 : 
  ( n0052 ) ? XRAM_DATA_OUT_15 : 
  ( n0054 ) ? XRAM_DATA_OUT_16 : 
  ( n0056 ) ? XRAM_DATA_OUT_17 : 
  ( n0058 ) ? XRAM_DATA_OUT_18 : 
  ( n0060 ) ? XRAM_DATA_OUT_19 : 
  ( n0062 ) ? XRAM_DATA_OUT_1a : 
  ( n0064 ) ? XRAM_DATA_OUT_1b : 
  ( n0066 ) ? XRAM_DATA_OUT_1c : 
  ( n0068 ) ? XRAM_DATA_OUT_1d : 
  ( n0070 ) ? XRAM_DATA_OUT_1e : 
  ( n0072 ) ? XRAM_DATA_OUT_1f : 
  ( n0073 ) ? XRAM_DATA_OUT_20 : 
  ( n2796 ) ? XRAM_DATA_OUT_21 : 
  ( n0075 ) ? XRAM_DATA_OUT_22 : 
  ( n2751 ) ? XRAM_DATA_OUT_23 : 
  ( n2753 ) ? XRAM_DATA_OUT_24 : 
  ( n0077 ) ? XRAM_DATA_OUT_25 : 
  ( n0079 ) ? XRAM_DATA_OUT_26 : 
  ( n0081 ) ? XRAM_DATA_OUT_27 : 
  ( n0083 ) ? XRAM_DATA_OUT_28 : 
  ( n0085 ) ? XRAM_DATA_OUT_29 : 
  ( n0087 ) ? XRAM_DATA_OUT_2a : 
  ( n0089 ) ? XRAM_DATA_OUT_2b : 
  ( n0091 ) ? XRAM_DATA_OUT_2c : 
  ( n0093 ) ? XRAM_DATA_OUT_2d : 
  ( n0095 ) ? XRAM_DATA_OUT_2e : 
  ( n0097 ) ? XRAM_DATA_OUT_2f : 
  ( n0099 ) ? XRAM_DATA_OUT_30 : 
  ( n2798 ) ? XRAM_DATA_OUT_31 : 
  ( n0101 ) ? XRAM_DATA_OUT_32 : 
  ( n2755 ) ? XRAM_DATA_OUT_33 : 
  ( n2757 ) ? XRAM_DATA_OUT_34 : 
  ( n0103 ) ? XRAM_DATA_OUT_35 : 
  ( n0105 ) ? XRAM_DATA_OUT_36 : 
  ( n0107 ) ? XRAM_DATA_OUT_37 : 
  ( n0109 ) ? XRAM_DATA_OUT_38 : 
  ( n0111 ) ? XRAM_DATA_OUT_39 : 
  ( n0113 ) ? XRAM_DATA_OUT_3a : 
  ( n0115 ) ? XRAM_DATA_OUT_3b : 
  ( n0117 ) ? XRAM_DATA_OUT_3c : 
  ( n0119 ) ? XRAM_DATA_OUT_3d : 
  ( n0121 ) ? XRAM_DATA_OUT_3e : 
  ( n0123 ) ? XRAM_DATA_OUT_3f : 
  ( n2800 ) ? XRAM_DATA_OUT_40 : 
  ( n2802 ) ? XRAM_DATA_OUT_41 : 
  ( n0125 ) ? XRAM_DATA_OUT_42 : 
  ( n0127 ) ? XRAM_DATA_OUT_43 : 
  ( n2759 ) ? XRAM_DATA_OUT_44 : 
  ( n0129 ) ? XRAM_DATA_OUT_45 : 
  ( n0131 ) ? XRAM_DATA_OUT_46 : 
  ( n0133 ) ? XRAM_DATA_OUT_47 : 
  ( n0135 ) ? XRAM_DATA_OUT_48 : 
  ( n0137 ) ? XRAM_DATA_OUT_49 : 
  ( n0139 ) ? XRAM_DATA_OUT_4a : 
  ( n0141 ) ? XRAM_DATA_OUT_4b : 
  ( n0143 ) ? XRAM_DATA_OUT_4c : 
  ( n0145 ) ? XRAM_DATA_OUT_4d : 
  ( n0147 ) ? XRAM_DATA_OUT_4e : 
  ( n0149 ) ? XRAM_DATA_OUT_4f : 
  ( n2804 ) ? XRAM_DATA_OUT_50 : 
  ( n2806 ) ? XRAM_DATA_OUT_51 : 
  ( n0151 ) ? XRAM_DATA_OUT_52 : 
  ( n0153 ) ? XRAM_DATA_OUT_53 : 
  ( n2761 ) ? XRAM_DATA_OUT_54 : 
  ( n0155 ) ? XRAM_DATA_OUT_55 : 
  ( n0157 ) ? XRAM_DATA_OUT_56 : 
  ( n0159 ) ? XRAM_DATA_OUT_57 : 
  ( n0161 ) ? XRAM_DATA_OUT_58 : 
  ( n0163 ) ? XRAM_DATA_OUT_59 : 
  ( n0165 ) ? XRAM_DATA_OUT_5a : 
  ( n0167 ) ? XRAM_DATA_OUT_5b : 
  ( n0169 ) ? XRAM_DATA_OUT_5c : 
  ( n0171 ) ? XRAM_DATA_OUT_5d : 
  ( n0173 ) ? XRAM_DATA_OUT_5e : 
  ( n0175 ) ? XRAM_DATA_OUT_5f : 
  ( n2808 ) ? XRAM_DATA_OUT_60 : 
  ( n2810 ) ? XRAM_DATA_OUT_61 : 
  ( n0177 ) ? XRAM_DATA_OUT_62 : 
  ( n0179 ) ? XRAM_DATA_OUT_63 : 
  ( n2763 ) ? XRAM_DATA_OUT_64 : 
  ( n0181 ) ? XRAM_DATA_OUT_65 : 
  ( n0183 ) ? XRAM_DATA_OUT_66 : 
  ( n0185 ) ? XRAM_DATA_OUT_67 : 
  ( n0187 ) ? XRAM_DATA_OUT_68 : 
  ( n0189 ) ? XRAM_DATA_OUT_69 : 
  ( n0191 ) ? XRAM_DATA_OUT_6a : 
  ( n0193 ) ? XRAM_DATA_OUT_6b : 
  ( n0195 ) ? XRAM_DATA_OUT_6c : 
  ( n0197 ) ? XRAM_DATA_OUT_6d : 
  ( n0199 ) ? XRAM_DATA_OUT_6e : 
  ( n0201 ) ? XRAM_DATA_OUT_6f : 
  ( n2812 ) ? XRAM_DATA_OUT_70 : 
  ( n2814 ) ? XRAM_DATA_OUT_71 : 
  ( n0203 ) ? XRAM_DATA_OUT_72 : 
  ( n2816 ) ? XRAM_DATA_OUT_73 : 
  ( n2765 ) ? XRAM_DATA_OUT_74 : 
  ( n2767 ) ? XRAM_DATA_OUT_75 : 
  ( n0205 ) ? XRAM_DATA_OUT_76 : 
  ( n0207 ) ? XRAM_DATA_OUT_77 : 
  ( n2818 ) ? XRAM_DATA_OUT_78 : 
  ( n2820 ) ? XRAM_DATA_OUT_79 : 
  ( n2822 ) ? XRAM_DATA_OUT_7a : 
  ( n2824 ) ? XRAM_DATA_OUT_7b : 
  ( n2826 ) ? XRAM_DATA_OUT_7c : 
  ( n2828 ) ? XRAM_DATA_OUT_7d : 
  ( n2830 ) ? XRAM_DATA_OUT_7e : 
  ( n2832 ) ? XRAM_DATA_OUT_7f : 
  ( n2833 ) ? XRAM_DATA_OUT_80 : 
  ( n2834 ) ? XRAM_DATA_OUT_81 : 
  ( n0209 ) ? XRAM_DATA_OUT_82 : 
  ( n2768 ) ? XRAM_DATA_OUT_83 : 
  ( n2770 ) ? XRAM_DATA_OUT_84 : 
  ( n0211 ) ? XRAM_DATA_OUT_85 : 
  ( n0213 ) ? XRAM_DATA_OUT_86 : 
  ( n0215 ) ? XRAM_DATA_OUT_87 : 
  ( n0217 ) ? XRAM_DATA_OUT_88 : 
  ( n0219 ) ? XRAM_DATA_OUT_89 : 
  ( n0221 ) ? XRAM_DATA_OUT_8a : 
  ( n0223 ) ? XRAM_DATA_OUT_8b : 
  ( n0225 ) ? XRAM_DATA_OUT_8c : 
  ( n0227 ) ? XRAM_DATA_OUT_8d : 
  ( n0229 ) ? XRAM_DATA_OUT_8e : 
  ( n0231 ) ? XRAM_DATA_OUT_8f : 
  ( n2835 ) ? XRAM_DATA_OUT_90 : 
  ( n2837 ) ? XRAM_DATA_OUT_91 : 
  ( n0233 ) ? XRAM_DATA_OUT_92 : 
  ( n2772 ) ? XRAM_DATA_OUT_93 : 
  ( n2774 ) ? XRAM_DATA_OUT_94 : 
  ( n0235 ) ? XRAM_DATA_OUT_95 : 
  ( n0237 ) ? XRAM_DATA_OUT_96 : 
  ( n0239 ) ? XRAM_DATA_OUT_97 : 
  ( n0241 ) ? XRAM_DATA_OUT_98 : 
  ( n0243 ) ? XRAM_DATA_OUT_99 : 
  ( n0245 ) ? XRAM_DATA_OUT_9a : 
  ( n0247 ) ? XRAM_DATA_OUT_9b : 
  ( n0249 ) ? XRAM_DATA_OUT_9c : 
  ( n0251 ) ? XRAM_DATA_OUT_9d : 
  ( n0253 ) ? XRAM_DATA_OUT_9e : 
  ( n0255 ) ? XRAM_DATA_OUT_9f : 
  ( n0257 ) ? XRAM_DATA_OUT_a0 : 
  ( n2839 ) ? XRAM_DATA_OUT_a1 : 
  ( n0259 ) ? XRAM_DATA_OUT_a2 : 
  ( n2841 ) ? XRAM_DATA_OUT_a3 : 
  ( n2776 ) ? XRAM_DATA_OUT_a4 : 
  ( n2843 ) ? XRAM_DATA_OUT_a5 : 
  ( n0261 ) ? XRAM_DATA_OUT_a6 : 
  ( n0263 ) ? XRAM_DATA_OUT_a7 : 
  ( n0265 ) ? XRAM_DATA_OUT_a8 : 
  ( n0267 ) ? XRAM_DATA_OUT_a9 : 
  ( n0269 ) ? XRAM_DATA_OUT_aa : 
  ( n0271 ) ? XRAM_DATA_OUT_ab : 
  ( n0273 ) ? XRAM_DATA_OUT_ac : 
  ( n0275 ) ? XRAM_DATA_OUT_ad : 
  ( n0277 ) ? XRAM_DATA_OUT_ae : 
  ( n0279 ) ? XRAM_DATA_OUT_af : 
  ( n0281 ) ? XRAM_DATA_OUT_b0 : 
  ( n2845 ) ? XRAM_DATA_OUT_b1 : 
  ( n0283 ) ? XRAM_DATA_OUT_b2 : 
  ( n2847 ) ? XRAM_DATA_OUT_b3 : 
  ( n2849 ) ? XRAM_DATA_OUT_b4 : 
  ( n0285 ) ? XRAM_DATA_OUT_b5 : 
  ( n0287 ) ? XRAM_DATA_OUT_b6 : 
  ( n0289 ) ? XRAM_DATA_OUT_b7 : 
  ( n0291 ) ? XRAM_DATA_OUT_b8 : 
  ( n0293 ) ? XRAM_DATA_OUT_b9 : 
  ( n0295 ) ? XRAM_DATA_OUT_ba : 
  ( n0297 ) ? XRAM_DATA_OUT_bb : 
  ( n0299 ) ? XRAM_DATA_OUT_bc : 
  ( n0301 ) ? XRAM_DATA_OUT_bd : 
  ( n0303 ) ? XRAM_DATA_OUT_be : 
  ( n0305 ) ? XRAM_DATA_OUT_bf : 
  ( n0307 ) ? XRAM_DATA_OUT_c0 : 
  ( n2851 ) ? XRAM_DATA_OUT_c1 : 
  ( n0309 ) ? XRAM_DATA_OUT_c2 : 
  ( n2853 ) ? XRAM_DATA_OUT_c3 : 
  ( n2778 ) ? XRAM_DATA_OUT_c4 : 
  ( n0311 ) ? XRAM_DATA_OUT_c5 : 
  ( n0313 ) ? XRAM_DATA_OUT_c6 : 
  ( n0315 ) ? XRAM_DATA_OUT_c7 : 
  ( n0317 ) ? XRAM_DATA_OUT_c8 : 
  ( n0319 ) ? XRAM_DATA_OUT_c9 : 
  ( n0321 ) ? XRAM_DATA_OUT_ca : 
  ( n0323 ) ? XRAM_DATA_OUT_cb : 
  ( n0325 ) ? XRAM_DATA_OUT_cc : 
  ( n0327 ) ? XRAM_DATA_OUT_cd : 
  ( n0329 ) ? XRAM_DATA_OUT_ce : 
  ( n0331 ) ? XRAM_DATA_OUT_cf : 
  ( n0333 ) ? XRAM_DATA_OUT_d0 : 
  ( n2855 ) ? XRAM_DATA_OUT_d1 : 
  ( n0335 ) ? XRAM_DATA_OUT_d2 : 
  ( n2857 ) ? XRAM_DATA_OUT_d3 : 
  ( n2780 ) ? XRAM_DATA_OUT_d4 : 
  ( n0337 ) ? XRAM_DATA_OUT_d5 : 
  ( n0339 ) ? XRAM_DATA_OUT_d6 : 
  ( n0341 ) ? XRAM_DATA_OUT_d7 : 
  ( n0343 ) ? XRAM_DATA_OUT_d8 : 
  ( n0345 ) ? XRAM_DATA_OUT_d9 : 
  ( n0347 ) ? XRAM_DATA_OUT_da : 
  ( n0349 ) ? XRAM_DATA_OUT_db : 
  ( n0351 ) ? XRAM_DATA_OUT_dc : 
  ( n0353 ) ? XRAM_DATA_OUT_dd : 
  ( n0355 ) ? XRAM_DATA_OUT_de : 
  ( n0357 ) ? XRAM_DATA_OUT_df : 
  ( n2781 ) ? XRAM_DATA_OUT_e0 : 
  ( n2859 ) ? XRAM_DATA_OUT_e1 : 
  ( n0359 ) ? XRAM_DATA_OUT_e2 : 
  ( n0361 ) ? XRAM_DATA_OUT_e3 : 
  ( n2783 ) ? XRAM_DATA_OUT_e4 : 
  ( n0363 ) ? XRAM_DATA_OUT_e5 : 
  ( n0365 ) ? XRAM_DATA_OUT_e6 : 
  ( n0367 ) ? XRAM_DATA_OUT_e7 : 
  ( n0369 ) ? XRAM_DATA_OUT_e8 : 
  ( n0371 ) ? XRAM_DATA_OUT_e9 : 
  ( n0373 ) ? XRAM_DATA_OUT_ea : 
  ( n0375 ) ? XRAM_DATA_OUT_eb : 
  ( n0377 ) ? XRAM_DATA_OUT_ec : 
  ( n0379 ) ? XRAM_DATA_OUT_ed : 
  ( n0381 ) ? XRAM_DATA_OUT_ee : 
  ( n0383 ) ? XRAM_DATA_OUT_ef : 
  ( n2860 ) ? XRAM_DATA_OUT_f0 : 
  ( n2862 ) ? XRAM_DATA_OUT_f1 : 
  ( n0385 ) ? XRAM_DATA_OUT_f2 : 
  ( n0387 ) ? XRAM_DATA_OUT_f3 : 
  ( n2785 ) ? XRAM_DATA_OUT_f4 : 
  ( n2787 ) ? XRAM_DATA_OUT_f5 : 
  ( n0389 ) ? XRAM_DATA_OUT_f6 : 
  ( n2864 ) ? XRAM_DATA_OUT_f7 : 
  ( n2866 ) ? XRAM_DATA_OUT_f8 : 
  ( n2868 ) ? XRAM_DATA_OUT_f9 : 
  ( n2870 ) ? XRAM_DATA_OUT_fa : 
  ( n2872 ) ? XRAM_DATA_OUT_fb : 
  ( n2874 ) ? XRAM_DATA_OUT_fc : 
  ( n2876 ) ? XRAM_DATA_OUT_fd : 
  ( n2878 ) ? XRAM_DATA_OUT_fe : 
  ( n2879 ) ? XRAM_DATA_OUT_ff : 
  ( XRAM_DATA_OUT );
assign DPL_next = 
  ( n0002 ) ? DPL_05 : 
  ( n0052 ) ? DPL_15 : 
  ( n0125 ) ? DPL_42 : 
  ( n0127 ) ? DPL_43 : 
  ( n0151 ) ? DPL_52 : 
  ( n0153 ) ? DPL_53 : 
  ( n0177 ) ? DPL_62 : 
  ( n0179 ) ? DPL_63 : 
  ( n2767 ) ? DPL_75 : 
  ( n0211 ) ? DPL_85 : 
  ( n0213 ) ? DPL_86 : 
  ( n0215 ) ? DPL_87 : 
  ( n0217 ) ? DPL_88 : 
  ( n0219 ) ? DPL_89 : 
  ( n0221 ) ? DPL_8a : 
  ( n0223 ) ? DPL_8b : 
  ( n0225 ) ? DPL_8c : 
  ( n0227 ) ? DPL_8d : 
  ( n0229 ) ? DPL_8e : 
  ( n0231 ) ? DPL_8f : 
  ( n2835 ) ? DPL_90 : 
  ( n2841 ) ? DPL_a3 : 
  ( n0311 ) ? DPL_c5 : 
  ( n0333 ) ? DPL_d0 : 
  ( n0337 ) ? DPL_d5 : 
  ( n2787 ) ? DPL_f5 : 
  ( DPL );
assign PSW_next = 
  ( n2788 ) ? PSW_00 : 
  ( n2789 ) ? PSW_01 : 
  ( n2790 ) ? PSW_02 : 
  ( n2743 ) ? PSW_03 : 
  ( n2745 ) ? PSW_04 : 
  ( n0002 ) ? PSW_05 : 
  ( n0004 ) ? PSW_06 : 
  ( n0009 ) ? PSW_07 : 
  ( n0013 ) ? PSW_08 : 
  ( n0015 ) ? PSW_09 : 
  ( n0017 ) ? PSW_0a : 
  ( n0021 ) ? PSW_0b : 
  ( n0025 ) ? PSW_0c : 
  ( n0029 ) ? PSW_0d : 
  ( n0033 ) ? PSW_0e : 
  ( n0037 ) ? PSW_0f : 
  ( n0041 ) ? PSW_10 : 
  ( n2792 ) ? PSW_11 : 
  ( n2794 ) ? PSW_12 : 
  ( n2747 ) ? PSW_13 : 
  ( n2749 ) ? PSW_14 : 
  ( n0052 ) ? PSW_15 : 
  ( n0054 ) ? PSW_16 : 
  ( n0056 ) ? PSW_17 : 
  ( n0058 ) ? PSW_18 : 
  ( n0060 ) ? PSW_19 : 
  ( n0062 ) ? PSW_1a : 
  ( n0064 ) ? PSW_1b : 
  ( n0066 ) ? PSW_1c : 
  ( n0068 ) ? PSW_1d : 
  ( n0070 ) ? PSW_1e : 
  ( n0072 ) ? PSW_1f : 
  ( n0073 ) ? PSW_20 : 
  ( n2796 ) ? PSW_21 : 
  ( n0075 ) ? PSW_22 : 
  ( n2751 ) ? PSW_23 : 
  ( n2753 ) ? PSW_24 : 
  ( n0077 ) ? PSW_25 : 
  ( n0079 ) ? PSW_26 : 
  ( n0081 ) ? PSW_27 : 
  ( n0083 ) ? PSW_28 : 
  ( n0085 ) ? PSW_29 : 
  ( n0087 ) ? PSW_2a : 
  ( n0089 ) ? PSW_2b : 
  ( n0091 ) ? PSW_2c : 
  ( n0093 ) ? PSW_2d : 
  ( n0095 ) ? PSW_2e : 
  ( n0097 ) ? PSW_2f : 
  ( n0099 ) ? PSW_30 : 
  ( n2798 ) ? PSW_31 : 
  ( n0101 ) ? PSW_32 : 
  ( n2755 ) ? PSW_33 : 
  ( n2757 ) ? PSW_34 : 
  ( n0103 ) ? PSW_35 : 
  ( n0105 ) ? PSW_36 : 
  ( n0107 ) ? PSW_37 : 
  ( n0109 ) ? PSW_38 : 
  ( n0111 ) ? PSW_39 : 
  ( n0113 ) ? PSW_3a : 
  ( n0115 ) ? PSW_3b : 
  ( n0117 ) ? PSW_3c : 
  ( n0119 ) ? PSW_3d : 
  ( n0121 ) ? PSW_3e : 
  ( n0123 ) ? PSW_3f : 
  ( n2800 ) ? PSW_40 : 
  ( n2802 ) ? PSW_41 : 
  ( n0125 ) ? PSW_42 : 
  ( n0127 ) ? PSW_43 : 
  ( n2759 ) ? PSW_44 : 
  ( n0129 ) ? PSW_45 : 
  ( n0131 ) ? PSW_46 : 
  ( n0133 ) ? PSW_47 : 
  ( n0135 ) ? PSW_48 : 
  ( n0137 ) ? PSW_49 : 
  ( n0139 ) ? PSW_4a : 
  ( n0141 ) ? PSW_4b : 
  ( n0143 ) ? PSW_4c : 
  ( n0145 ) ? PSW_4d : 
  ( n0147 ) ? PSW_4e : 
  ( n0149 ) ? PSW_4f : 
  ( n2804 ) ? PSW_50 : 
  ( n2806 ) ? PSW_51 : 
  ( n0151 ) ? PSW_52 : 
  ( n0153 ) ? PSW_53 : 
  ( n2761 ) ? PSW_54 : 
  ( n0155 ) ? PSW_55 : 
  ( n0157 ) ? PSW_56 : 
  ( n0159 ) ? PSW_57 : 
  ( n0161 ) ? PSW_58 : 
  ( n0163 ) ? PSW_59 : 
  ( n0165 ) ? PSW_5a : 
  ( n0167 ) ? PSW_5b : 
  ( n0169 ) ? PSW_5c : 
  ( n0171 ) ? PSW_5d : 
  ( n0173 ) ? PSW_5e : 
  ( n0175 ) ? PSW_5f : 
  ( n2808 ) ? PSW_60 : 
  ( n2810 ) ? PSW_61 : 
  ( n0177 ) ? PSW_62 : 
  ( n0179 ) ? PSW_63 : 
  ( n2763 ) ? PSW_64 : 
  ( n0181 ) ? PSW_65 : 
  ( n0183 ) ? PSW_66 : 
  ( n0185 ) ? PSW_67 : 
  ( n0187 ) ? PSW_68 : 
  ( n0189 ) ? PSW_69 : 
  ( n0191 ) ? PSW_6a : 
  ( n0193 ) ? PSW_6b : 
  ( n0195 ) ? PSW_6c : 
  ( n0197 ) ? PSW_6d : 
  ( n0199 ) ? PSW_6e : 
  ( n0201 ) ? PSW_6f : 
  ( n2812 ) ? PSW_70 : 
  ( n2814 ) ? PSW_71 : 
  ( n0203 ) ? PSW_72 : 
  ( n2816 ) ? PSW_73 : 
  ( n2765 ) ? PSW_74 : 
  ( n2767 ) ? PSW_75 : 
  ( n0205 ) ? PSW_76 : 
  ( n0207 ) ? PSW_77 : 
  ( n2818 ) ? PSW_78 : 
  ( n2820 ) ? PSW_79 : 
  ( n2822 ) ? PSW_7a : 
  ( n2824 ) ? PSW_7b : 
  ( n2826 ) ? PSW_7c : 
  ( n2828 ) ? PSW_7d : 
  ( n2830 ) ? PSW_7e : 
  ( n2832 ) ? PSW_7f : 
  ( n2833 ) ? PSW_80 : 
  ( n2834 ) ? PSW_81 : 
  ( n0209 ) ? PSW_82 : 
  ( n2768 ) ? PSW_83 : 
  ( n2770 ) ? PSW_84 : 
  ( n0211 ) ? PSW_85 : 
  ( n0213 ) ? PSW_86 : 
  ( n0215 ) ? PSW_87 : 
  ( n0217 ) ? PSW_88 : 
  ( n0219 ) ? PSW_89 : 
  ( n0221 ) ? PSW_8a : 
  ( n0223 ) ? PSW_8b : 
  ( n0225 ) ? PSW_8c : 
  ( n0227 ) ? PSW_8d : 
  ( n0229 ) ? PSW_8e : 
  ( n0231 ) ? PSW_8f : 
  ( n2835 ) ? PSW_90 : 
  ( n2837 ) ? PSW_91 : 
  ( n0233 ) ? PSW_92 : 
  ( n2772 ) ? PSW_93 : 
  ( n2774 ) ? PSW_94 : 
  ( n0235 ) ? PSW_95 : 
  ( n0237 ) ? PSW_96 : 
  ( n0239 ) ? PSW_97 : 
  ( n0241 ) ? PSW_98 : 
  ( n0243 ) ? PSW_99 : 
  ( n0245 ) ? PSW_9a : 
  ( n0247 ) ? PSW_9b : 
  ( n0249 ) ? PSW_9c : 
  ( n0251 ) ? PSW_9d : 
  ( n0253 ) ? PSW_9e : 
  ( n0255 ) ? PSW_9f : 
  ( n0257 ) ? PSW_a0 : 
  ( n2839 ) ? PSW_a1 : 
  ( n0259 ) ? PSW_a2 : 
  ( n2841 ) ? PSW_a3 : 
  ( n2776 ) ? PSW_a4 : 
  ( n2843 ) ? PSW_a5 : 
  ( n0261 ) ? PSW_a6 : 
  ( n0263 ) ? PSW_a7 : 
  ( n0265 ) ? PSW_a8 : 
  ( n0267 ) ? PSW_a9 : 
  ( n0269 ) ? PSW_aa : 
  ( n0271 ) ? PSW_ab : 
  ( n0273 ) ? PSW_ac : 
  ( n0275 ) ? PSW_ad : 
  ( n0277 ) ? PSW_ae : 
  ( n0279 ) ? PSW_af : 
  ( n0281 ) ? PSW_b0 : 
  ( n2845 ) ? PSW_b1 : 
  ( n0283 ) ? PSW_b2 : 
  ( n2847 ) ? PSW_b3 : 
  ( n2849 ) ? PSW_b4 : 
  ( n0285 ) ? PSW_b5 : 
  ( n0287 ) ? PSW_b6 : 
  ( n0289 ) ? PSW_b7 : 
  ( n0291 ) ? PSW_b8 : 
  ( n0293 ) ? PSW_b9 : 
  ( n0295 ) ? PSW_ba : 
  ( n0297 ) ? PSW_bb : 
  ( n0299 ) ? PSW_bc : 
  ( n0301 ) ? PSW_bd : 
  ( n0303 ) ? PSW_be : 
  ( n0305 ) ? PSW_bf : 
  ( n0307 ) ? PSW_c0 : 
  ( n2851 ) ? PSW_c1 : 
  ( n0309 ) ? PSW_c2 : 
  ( n2853 ) ? PSW_c3 : 
  ( n2778 ) ? PSW_c4 : 
  ( n0311 ) ? PSW_c5 : 
  ( n0313 ) ? PSW_c6 : 
  ( n0315 ) ? PSW_c7 : 
  ( n0317 ) ? PSW_c8 : 
  ( n0319 ) ? PSW_c9 : 
  ( n0321 ) ? PSW_ca : 
  ( n0323 ) ? PSW_cb : 
  ( n0325 ) ? PSW_cc : 
  ( n0327 ) ? PSW_cd : 
  ( n0329 ) ? PSW_ce : 
  ( n0331 ) ? PSW_cf : 
  ( n0333 ) ? PSW_d0 : 
  ( n2855 ) ? PSW_d1 : 
  ( n0335 ) ? PSW_d2 : 
  ( n2857 ) ? PSW_d3 : 
  ( n2780 ) ? PSW_d4 : 
  ( n0337 ) ? PSW_d5 : 
  ( n0339 ) ? PSW_d6 : 
  ( n0341 ) ? PSW_d7 : 
  ( n0343 ) ? PSW_d8 : 
  ( n0345 ) ? PSW_d9 : 
  ( n0347 ) ? PSW_da : 
  ( n0349 ) ? PSW_db : 
  ( n0351 ) ? PSW_dc : 
  ( n0353 ) ? PSW_dd : 
  ( n0355 ) ? PSW_de : 
  ( n0357 ) ? PSW_df : 
  ( n2781 ) ? PSW_e0 : 
  ( n2859 ) ? PSW_e1 : 
  ( n0359 ) ? PSW_e2 : 
  ( n0361 ) ? PSW_e3 : 
  ( n2783 ) ? PSW_e4 : 
  ( n0363 ) ? PSW_e5 : 
  ( n0365 ) ? PSW_e6 : 
  ( n0367 ) ? PSW_e7 : 
  ( n0369 ) ? PSW_e8 : 
  ( n0371 ) ? PSW_e9 : 
  ( n0373 ) ? PSW_ea : 
  ( n0375 ) ? PSW_eb : 
  ( n0377 ) ? PSW_ec : 
  ( n0379 ) ? PSW_ed : 
  ( n0381 ) ? PSW_ee : 
  ( n0383 ) ? PSW_ef : 
  ( n2860 ) ? PSW_f0 : 
  ( n2862 ) ? PSW_f1 : 
  ( n0385 ) ? PSW_f2 : 
  ( n0387 ) ? PSW_f3 : 
  ( n2785 ) ? PSW_f4 : 
  ( n2787 ) ? PSW_f5 : 
  ( n0389 ) ? PSW_f6 : 
  ( n2864 ) ? PSW_f7 : 
  ( n2866 ) ? PSW_f8 : 
  ( n2868 ) ? PSW_f9 : 
  ( n2870 ) ? PSW_fa : 
  ( n2872 ) ? PSW_fb : 
  ( n2874 ) ? PSW_fc : 
  ( n2876 ) ? PSW_fd : 
  ( n2878 ) ? PSW_fe : 
  ( n2879 ) ? PSW_ff : 
  ( PSW );
assign DPH_next = 
  ( n0002 ) ? DPH_05 : 
  ( n0052 ) ? DPH_15 : 
  ( n0125 ) ? DPH_42 : 
  ( n0127 ) ? DPH_43 : 
  ( n0151 ) ? DPH_52 : 
  ( n0153 ) ? DPH_53 : 
  ( n0177 ) ? DPH_62 : 
  ( n0179 ) ? DPH_63 : 
  ( n2767 ) ? DPH_75 : 
  ( n0211 ) ? DPH_85 : 
  ( n0213 ) ? DPH_86 : 
  ( n0215 ) ? DPH_87 : 
  ( n0217 ) ? DPH_88 : 
  ( n0219 ) ? DPH_89 : 
  ( n0221 ) ? DPH_8a : 
  ( n0223 ) ? DPH_8b : 
  ( n0225 ) ? DPH_8c : 
  ( n0227 ) ? DPH_8d : 
  ( n0229 ) ? DPH_8e : 
  ( n0231 ) ? DPH_8f : 
  ( n2835 ) ? DPH_90 : 
  ( n2841 ) ? DPH_a3 : 
  ( n0311 ) ? DPH_c5 : 
  ( n0333 ) ? DPH_d0 : 
  ( n0337 ) ? DPH_d5 : 
  ( n2787 ) ? DPH_f5 : 
  ( DPH );
assign WR_ADDR_0_IRAM = ((n0002) && (n1062)) ? (n1119) : ((n0004) ? (n1139) : ((n0009) ? (n1139) : ((n0013) ? (n1141) : ((n0015) ? (n1143) : ((n0017) ? (n1144) : ((n0021) ? (n1145) : ((n0025) ? (n1146) : ((n0029) ? (n1147) : ((n0033) ? (n1148) : ((n0037) ? (n1149) : (((n0041) && (n1156)) ? (n1206) : (((n2792) && (((n1228) != (n1231)))) ? (n1228) : (((n2794) && (((n1228) != (n1231)))) ? (n1228) : (((n0052) && (n1062)) ? (n1119) : ((n0054) ? (n1139) : ((n0056) ? (n1139) : ((n0058) ? (n1141) : ((n0060) ? (n1143) : ((n0062) ? (n1144) : ((n0064) ? (n1145) : ((n0066) ? (n1146) : ((n0068) ? (n1147) : ((n0070) ? (n1148) : ((n0072) ? (n1149) : (((n2798) && (((n1228) != (n1231)))) ? (n1228) : (((n0125) && (n1062)) ? (n1119) : (((n0127) && (n1062)) ? (n1119) : (((n2806) && (((n1228) != (n1231)))) ? (n1228) : (((n0151) && (n1062)) ? (n1119) : (((n0153) && (n1062)) ? (n1119) : (((n0177) && (n1062)) ? (n1119) : (((n0179) && (n1062)) ? (n1119) : (((n2814) && (((n1228) != (n1231)))) ? (n1228) : (((n2767) && (n1062)) ? (n1119) : ((n0205) ? (n1139) : ((n0207) ? (n1139) : ((n2818) ? (n1141) : ((n2820) ? (n1143) : ((n2822) ? (n1144) : ((n2824) ? (n1145) : ((n2826) ? (n1146) : ((n2828) ? (n1147) : ((n2830) ? (n1148) : ((n2832) ? (n1149) : (((n0211) && (n1062)) ? (n1119) : (((n0213) && (n1062)) ? (n1119) : (((n0215) && (n1062)) ? (n1119) : (((n0217) && (n1062)) ? (n1119) : (((n0219) && (n1062)) ? (n1119) : (((n0221) && (n1062)) ? (n1119) : (((n0223) && (n1062)) ? (n1119) : (((n0225) && (n1062)) ? (n1119) : (((n0227) && (n1062)) ? (n1119) : (((n0229) && (n1062)) ? (n1119) : (((n0231) && (n1062)) ? (n1119) : (((n2837) && (((n1228) != (n1231)))) ? (n1228) : (((n0233) && (n1156)) ? (n1206) : ((n0261) ? (n1139) : ((n0263) ? (n1139) : ((n0265) ? (n1141) : ((n0267) ? (n1143) : ((n0269) ? (n1144) : ((n0271) ? (n1145) : ((n0273) ? (n1146) : ((n0275) ? (n1147) : ((n0277) ? (n1148) : ((n0279) ? (n1149) : (((n2845) && (((n1228) != (n1231)))) ? (n1228) : (((n0283) && (n1156)) ? (n1206) : ((n0307) ? (n1228) : (((n0309) && (n1156)) ? (n1206) : (((n0311) && (n1062)) ? (n1119) : ((n0313) ? (n1139) : ((n0315) ? (n1139) : ((n0317) ? (n1141) : ((n0319) ? (n1143) : ((n0321) ? (n1144) : ((n0323) ? (n1145) : ((n0325) ? (n1146) : ((n0327) ? (n1147) : ((n0329) ? (n1148) : ((n0331) ? (n1149) : (((n0333) && (n1062)) ? (n1119) : (((n2855) && (((n1228) != (n1231)))) ? (n1228) : (((n0335) && (n1156)) ? (n1206) : (((n0337) && (n1062)) ? (n1119) : ((n0339) ? (n1139) : ((n0341) ? (n1139) : ((n0343) ? (n1141) : ((n0345) ? (n1143) : ((n0347) ? (n1144) : ((n0349) ? (n1145) : ((n0351) ? (n1146) : ((n0353) ? (n1147) : ((n0355) ? (n1148) : ((n0357) ? (n1149) : (((n2862) && (((n1228) != (n1231)))) ? (n1228) : (((n2787) && (n1062)) ? (n1119) : ((n0389) ? (n1139) : ((n2864) ? (n1139) : ((n2866) ? (n1141) : ((n2868) ? (n1143) : ((n2870) ? (n1144) : ((n2872) ? (n1145) : ((n2874) ? (n1146) : ((n2876) ? (n1147) : ((n2878) ? (n1148) : (n1149))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_DATA_0_IRAM = ((n0002) && (n1062)) ? (n1110) : ((n0004) ? (n1140) : ((n0009) ? (n1140) : ((n0013) ? (n1142) : ((n0015) ? (n1142) : ((n0017) ? (n1142) : ((n0021) ? (n1142) : ((n0025) ? (n1142) : ((n0029) ? (n1142) : ((n0033) ? (n1142) : ((n0037) ? (n1142) : (((n0041) && (n1156)) ? (n1182) : (((n2792) && (((n1228) != (n1231)))) ? (n1229) : (((n2794) && (((n1228) != (n1231)))) ? (n1235) : (((n0052) && (n1062)) ? (n1280) : ((n0054) ? (n1308) : ((n0056) ? (n1308) : ((n0058) ? (n1309) : ((n0060) ? (n1309) : ((n0062) ? (n1309) : ((n0064) ? (n1309) : ((n0066) ? (n1309) : ((n0068) ? (n1309) : ((n0070) ? (n1309) : ((n0072) ? (n1309) : (((n2798) && (((n1228) != (n1231)))) ? (n1229) : (((n0125) && (n1062)) ? (n1691) : (((n0127) && (n1062)) ? (n1703) : (((n2806) && (((n1228) != (n1231)))) ? (n1229) : (((n0151) && (n1062)) ? (n1801) : (((n0153) && (n1062)) ? (n1813) : (((n0177) && (n1062)) ? (n1913) : (((n0179) && (n1062)) ? (n1940) : (((n2814) && (((n1228) != (n1231)))) ? (n1229) : (((n2767) && (n1062)) ? (RD_ROM_2) : ((n0205) ? (RD_ROM_1) : ((n0207) ? (RD_ROM_1) : ((n2818) ? (RD_ROM_1) : ((n2820) ? (RD_ROM_1) : ((n2822) ? (RD_ROM_1) : ((n2824) ? (RD_ROM_1) : ((n2826) ? (RD_ROM_1) : ((n2828) ? (RD_ROM_1) : ((n2830) ? (RD_ROM_1) : ((n2832) ? (RD_ROM_1) : (((n0211) && (n1062)) ? (n2161) : (((n0213) && (n1062)) ? (RD_IRAM_1) : (((n0215) && (n1062)) ? (RD_IRAM_1) : (((n0217) && (n1062)) ? (RD_IRAM_0) : (((n0219) && (n1062)) ? (RD_IRAM_0) : (((n0221) && (n1062)) ? (RD_IRAM_0) : (((n0223) && (n1062)) ? (RD_IRAM_0) : (((n0225) && (n1062)) ? (RD_IRAM_0) : (((n0227) && (n1062)) ? (RD_IRAM_0) : (((n0229) && (n1062)) ? (RD_IRAM_0) : (((n0231) && (n1062)) ? (RD_IRAM_0) : (((n2837) && (((n1228) != (n1231)))) ? (n1229) : (((n0233) && (n1156)) ? (n2246) : ((n0261) ? (n2429) : ((n0263) ? (n2429) : ((n0265) ? (n1387) : ((n0267) ? (n1387) : ((n0269) ? (n1387) : ((n0271) ? (n1387) : ((n0273) ? (n1387) : ((n0275) ? (n1387) : ((n0277) ? (n1387) : ((n0279) ? (n1387) : (((n2845) && (((n1228) != (n1231)))) ? (n1229) : (((n0283) && (n1156)) ? (n2436) : ((n0307) ? (n1387) : (((n0309) && (n1156)) ? (n1193) : (((n0311) && (n1062)) ? (ACC) : ((n0313) ? (ACC) : ((n0315) ? (ACC) : ((n0317) ? (ACC) : ((n0319) ? (ACC) : ((n0321) ? (ACC) : ((n0323) ? (ACC) : ((n0325) ? (ACC) : ((n0327) ? (ACC) : ((n0329) ? (ACC) : ((n0331) ? (ACC) : (((n0333) && (n1062)) ? (RD_IRAM_0) : (((n2855) && (((n1228) != (n1231)))) ? (n1229) : (((n0335) && (n1156)) ? (n2600) : (((n0337) && (n1062)) ? (n1280) : ((n0339) ? (n2670) : ((n0341) ? (n2670) : ((n0343) ? (n1309) : ((n0345) ? (n1309) : ((n0347) ? (n1309) : ((n0349) ? (n1309) : ((n0351) ? (n1309) : ((n0353) ? (n1309) : ((n0355) ? (n1309) : ((n0357) ? (n1309) : (((n2862) && (((n1228) != (n1231)))) ? (n1229) : (((n2787) && (n1062)) ? (ACC) : ((n0389) ? (ACC) : ((n2864) ? (ACC) : ((n2866) ? (ACC) : ((n2868) ? (ACC) : ((n2870) ? (ACC) : ((n2872) ? (ACC) : ((n2874) ? (ACC) : ((n2876) ? (ACC) : ((n2878) ? (ACC) : (ACC))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))))));
assign WR_COND_0_IRAM = ((n0002) && (n1062)) || (n0004) || (n0009) || (n0013) || (n0015) || (n0017) || (n0021) || (n0025) || (n0029) || (n0033) || (n0037) || ((n0041) && (n1156)) || ((n2792) && (((n1228) != (n1231)))) || ((n2794) && (((n1228) != (n1231)))) || ((n0052) && (n1062)) || (n0054) || (n0056) || (n0058) || (n0060) || (n0062) || (n0064) || (n0066) || (n0068) || (n0070) || (n0072) || ((n2798) && (((n1228) != (n1231)))) || ((n0125) && (n1062)) || ((n0127) && (n1062)) || ((n2806) && (((n1228) != (n1231)))) || ((n0151) && (n1062)) || ((n0153) && (n1062)) || ((n0177) && (n1062)) || ((n0179) && (n1062)) || ((n2814) && (((n1228) != (n1231)))) || ((n2767) && (n1062)) || (n0205) || (n0207) || (n2818) || (n2820) || (n2822) || (n2824) || (n2826) || (n2828) || (n2830) || (n2832) || ((n0211) && (n1062)) || ((n0213) && (n1062)) || ((n0215) && (n1062)) || ((n0217) && (n1062)) || ((n0219) && (n1062)) || ((n0221) && (n1062)) || ((n0223) && (n1062)) || ((n0225) && (n1062)) || ((n0227) && (n1062)) || ((n0229) && (n1062)) || ((n0231) && (n1062)) || ((n2837) && (((n1228) != (n1231)))) || ((n0233) && (n1156)) || (n0261) || (n0263) || (n0265) || (n0267) || (n0269) || (n0271) || (n0273) || (n0275) || (n0277) || (n0279) || ((n2845) && (((n1228) != (n1231)))) || ((n0283) && (n1156)) || (n0307) || ((n0309) && (n1156)) || ((n0311) && (n1062)) || (n0313) || (n0315) || (n0317) || (n0319) || (n0321) || (n0323) || (n0325) || (n0327) || (n0329) || (n0331) || ((n0333) && (n1062)) || ((n2855) && (((n1228) != (n1231)))) || ((n0335) && (n1156)) || ((n0337) && (n1062)) || (n0339) || (n0341) || (n0343) || (n0345) || (n0347) || (n0349) || (n0351) || (n0353) || (n0355) || (n0357) || ((n2862) && (((n1228) != (n1231)))) || ((n2787) && (n1062)) || (n0389) || (n2864) || (n2866) || (n2868) || (n2870) || (n2872) || (n2874) || (n2876) || (n2878) || (n2879);
assign WR_ADDR_1_IRAM = (n2792) ? (n1231) : ((n2794) ? (n1231) : ((n2798) ? (n1231) : ((n2806) ? (n1231) : ((n2814) ? (n1231) : ((n2837) ? (n1231) : ((n2845) ? (n1231) : ((n2855) ? (n1231) : (n1231))))))));
assign WR_DATA_1_IRAM = (n2792) ? (n1232) : ((n2794) ? (n1236) : ((n2798) ? (n1232) : ((n2806) ? (n1232) : ((n2814) ? (n1232) : ((n2837) ? (n1232) : ((n2845) ? (n1232) : ((n2855) ? (n1232) : (n1232))))))));
assign WR_COND_1_IRAM = (n2792) || (n2794) || (n2798) || (n2806) || (n2814) || (n2837) || (n2845) || (n2855) || (n2862);
assign IRAM_full = {IRAM[15], IRAM[14], IRAM[13], IRAM[12], IRAM[11], IRAM[10], IRAM[9], IRAM[8], IRAM[7], IRAM[6], IRAM[5], IRAM[4], IRAM[3], IRAM[2], IRAM[1], IRAM[0]} ;
assign SBUF_next = SBUF;
assign SCON_next = SCON;
assign PCON_next = PCON;
assign TCON_next = TCON;
assign TL0_next = TL0;
assign TL1_next = TL1;
assign TH0_next = TH0;
assign TH1_next = TH1;
assign TMOD_next = TMOD;
assign IE_next = IE;
assign IP_next = IP;

always @(posedge clk) begin
  if (rst) begin
    ACC <= 8'h0;
    B <= 8'h0;
    DPH <= 8'h0;
    DPL <= 8'h0;
    IE <= 8'h0;
    IP <= 8'h0;
    P0 <= 8'hff;
    P0INREG <= 8'h0;
    P1 <= 8'hff;
    P1INREG <= 8'h0;
    P2 <= 8'hff;
    P2INREG <= 8'h0;
    P3 <= 8'hff;
    P3INREG <= 8'h0;
    PC <= 16'h0;
    PCON <= 8'h0;
    PSW <= 8'h0;
    SBUF <= 8'h0;
    SCON <= 8'h0;
    SP <= 8'h7;
    TCON <= 8'h0;
    TH0 <= 8'h0;
    TH1 <= 8'h0;
    TL0 <= 8'h0;
    TL1 <= 8'h0;
    TMOD <= 8'h0;
    XRAM_ADDR <= 16'h0;
    XRAM_DATA_OUT <= 8'h0;
`ifdef OC8051_SIMULATION
    IRAM[0] = 8'b0;
    IRAM[1] = 8'b0;
    IRAM[2] = 8'b0;
    IRAM[3] = 8'b0;
    IRAM[4] = 8'b0;
    IRAM[5] = 8'b0;
    IRAM[6] = 8'b0;
    IRAM[7] = 8'b0;
    IRAM[8] = 8'b0;
    IRAM[9] = 8'b0;
    IRAM[10] = 8'b0;
    IRAM[11] = 8'b0;
    IRAM[12] = 8'b0;
    IRAM[13] = 8'b0;
    IRAM[14] = 8'b0;
    IRAM[15] = 8'b0;
`endif
  end
  else begin
    if (step) begin
      P0INREG <= P0IN;
      P1INREG <= P1IN;
      P2INREG <= P2IN;
      P3INREG <= P3IN;
      ACC <= ACC_next;
      P2 <= P2_next;
      P0 <= P0_next;
      B <= B_next;
      P1 <= P1_next;
      XRAM_ADDR <= XRAM_ADDR_next;
      P3 <= P3_next;
      SP <= SP_next;
      PC <= PC_next;
      XRAM_DATA_OUT <= XRAM_DATA_OUT_next;
      DPL <= DPL_next;
      PSW <= PSW_next;
      DPH <= DPH_next;
      if (WR_COND_0_IRAM) IRAM[WR_ADDR_0_IRAM] <= WR_DATA_0_IRAM;
      if (WR_COND_1_IRAM) IRAM[WR_ADDR_1_IRAM] <= WR_DATA_1_IRAM;
    end
  end
end

endmodule
/* verilator coverage_on */
