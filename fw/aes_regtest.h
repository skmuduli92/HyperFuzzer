#ifndef _AES_REGTEST_H_DEFINED_
#define _AES_REGTEST_H_DEFINED_

// ************* hw-cbmc interface ***********//
/* unwinding Bound */

extern const unsigned int bound;

/* next Timeframe  */

void next_timeframe(void);
void set_inputs(void);


/*
  type declarations
*/
typedef unsigned char _u8;
typedef unsigned short int _u16;
typedef unsigned __CPROVER_bitvector[4] _u4;
typedef unsigned __CPROVER_bitvector[128] _u128;
typedef unsigned int _u32;
typedef unsigned __CPROVER_bitvector[2] _u2;
typedef unsigned __CPROVER_bitvector[1] _u1;
typedef _u32 _array_of_16__u32[16];
typedef unsigned __CPROVER_bitvector[7] _u7;
typedef unsigned __CPROVER_bitvector[512] _u512;
typedef unsigned __CPROVER_bitvector[160] _u160;
typedef unsigned __CPROVER_bitvector[6] _u6;
typedef unsigned __CPROVER_bitvector[3] _u3;
typedef _u8 _array_of_65536__u8[65536];


// Module Verilog::reg2byte

struct module_reg2byte {
  _Bool clk;
  _Bool rst;
  _Bool en;
  _Bool wr;
  _Bool addr;
  _u8 data_in;
  _u8 data_out;
  _u16 reg_out;
  _Bool wr0;
  _Bool wr1;
  _u8 reg0_next;
  _u8 reg1_next;
  _u8 data_out_mux;
};

// Module Verilog::reg16byte

struct module_reg16byte {
  _Bool clk;
  _Bool rst;
  _Bool en;
  _Bool wr;
  _u4 addr;
  _u8 data_in;
  _u8 data_out;
  _u128 reg_out;
  _Bool wr0;
  _Bool wr1;
  _Bool wr2;
  _Bool wr3;
  _Bool wr4;
  _Bool wr5;
  _Bool wr6;
  _Bool wr7;
  _Bool wr8;
  _Bool wr9;
  _Bool wr10;
  _Bool wr11;
  _Bool wr12;
  _Bool wr13;
  _Bool wr14;
  _Bool wr15;
  _u8 reg0_next;
  _u8 reg1_next;
  _u8 reg2_next;
  _u8 reg3_next;
  _u8 reg4_next;
  _u8 reg5_next;
  _u8 reg6_next;
  _u8 reg7_next;
  _u8 reg8_next;
  _u8 reg9_next;
  _u8 reg10_next;
  _u8 reg11_next;
  _u8 reg12_next;
  _u8 reg13_next;
  _u8 reg14_next;
  _u8 reg15_next;
  _u8 data_out_mux;
};

// Module Verilog::S

struct module_S {
  _Bool clk;
  _u8 in;
  _u8 out;
};

// Module Verilog::S4

struct module_S4 {
  _Bool clk;
  _u32 in;
  _u32 out;
  struct module_S S_0;
  struct module_S S_1;
  struct module_S S_2;
  struct module_S S_3;
};

// Module Verilog::expand_key_128

struct module_expand_key_128 {
  _Bool clk;
  _u128 in;
  _u8 rcon;
  _u128 out_1;
  _u128 out_2;
  _u32 k0;
  _u32 k1;
  _u32 k2;
  _u32 k3;
  _u32 v0;
  _u32 v1;
  _u32 v2;
  _u32 v3;
  _u32 k0a;
  _u32 k1a;
  _u32 k2a;
  _u32 k3a;
  _u32 k0b;
  _u32 k1b;
  _u32 k2b;
  _u32 k3b;
  _u32 k4a;
  struct module_S4 S4_0;
};

// Module Verilog::xS

struct module_xS {
  _Bool clk;
  _u8 in;
  _u8 out;
};

// Module Verilog::T

struct module_T {
  _Bool clk;
  _u8 in;
  _u32 out;
  struct module_S s0;
  struct module_xS s4;
};

// Module Verilog::table_lookup

struct module_table_lookup {
  _Bool clk;
  _u32 state;
  _u32 p0;
  _u32 p1;
  _u32 p2;
  _u32 p3;
  _u8 b0;
  _u8 b1;
  _u8 b2;
  _u8 b3;
  struct module_T t0;
  struct module_T t1;
  struct module_T t2;
  struct module_T t3;
};

// Module Verilog::one_round

struct module_one_round {
  _Bool clk;
  _u128 state_in;
  _u128 key;
  _u128 state_out;
  _u32 s0;
  _u32 s1;
  _u32 s2;
  _u32 s3;
  _u32 z0;
  _u32 z1;
  _u32 z2;
  _u32 z3;
  _u32 p00;
  _u32 p01;
  _u32 p02;
  _u32 p03;
  _u32 p10;
  _u32 p11;
  _u32 p12;
  _u32 p13;
  _u32 p20;
  _u32 p21;
  _u32 p22;
  _u32 p23;
  _u32 p30;
  _u32 p31;
  _u32 p32;
  _u32 p33;
  _u32 k0;
  _u32 k1;
  _u32 k2;
  _u32 k3;
  struct module_table_lookup t0;
  struct module_table_lookup t1;
  struct module_table_lookup t2;
  struct module_table_lookup t3;
};

// Module Verilog::final_round

struct module_final_round {
  _Bool clk;
  _u128 state_in;
  _u128 key_in;
  _u128 state_out;
  _u32 s0;
  _u32 s1;
  _u32 s2;
  _u32 s3;
  _u32 z0;
  _u32 z1;
  _u32 z2;
  _u32 z3;
  _u32 k0;
  _u32 k1;
  _u32 k2;
  _u32 k3;
  _u8 p00;
  _u8 p01;
  _u8 p02;
  _u8 p03;
  _u8 p10;
  _u8 p11;
  _u8 p12;
  _u8 p13;
  _u8 p20;
  _u8 p21;
  _u8 p22;
  _u8 p23;
  _u8 p30;
  _u8 p31;
  _u8 p32;
  _u8 p33;
  struct module_S4 S4_1;
  struct module_S4 S4_2;
  struct module_S4 S4_3;
  struct module_S4 S4_4;
};

// Module Verilog::aes_128

struct module_aes_128 {
  _Bool clk;
  _u128 state;
  _u128 key;
  _u128 out;
  _u128 s0;
  _u128 k0;
  _u128 s1;
  _u128 s2;
  _u128 s3;
  _u128 s4;
  _u128 s5;
  _u128 s6;
  _u128 s7;
  _u128 s8;
  _u128 s9;
  _u128 k1;
  _u128 k2;
  _u128 k3;
  _u128 k4;
  _u128 k5;
  _u128 k6;
  _u128 k7;
  _u128 k8;
  _u128 k9;
  _u128 k0b;
  _u128 k1b;
  _u128 k2b;
  _u128 k3b;
  _u128 k4b;
  _u128 k5b;
  _u128 k6b;
  _u128 k7b;
  _u128 k8b;
  _u128 k9b;
  struct module_expand_key_128 a1;
  struct module_expand_key_128 a2;
  struct module_expand_key_128 a3;
  struct module_expand_key_128 a4;
  struct module_expand_key_128 a5;
  struct module_expand_key_128 a6;
  struct module_expand_key_128 a7;
  struct module_expand_key_128 a8;
  struct module_expand_key_128 a9;
  struct module_expand_key_128 a10;
  struct module_one_round r1;
  struct module_one_round r2;
  struct module_one_round r3;
  struct module_one_round r4;
  struct module_one_round r5;
  struct module_one_round r6;
  struct module_one_round r7;
  struct module_one_round r8;
  struct module_one_round r9;
  struct module_final_round rf;
};

// Module Verilog::aes_top

struct module_aes_top {
  _Bool clk;
  _Bool wr;
  _Bool stb;
  _Bool rst;
  _u8 data_in;
  _u16 addr;
  _u8 data_out;
  _Bool ack;
  _Bool in_addr_range;
  _u16 xram_addr;
  _u8 xram_data_out;
  _u8 xram_data_in;
  _Bool xram_ack;
  _Bool xram_stb;
  _Bool xram_wr;
  _u2 aes_state;
  _u16 aes_addr;
  _u16 aes_len;
  _u128 aes_ctr;
  _u128 aes_key0;
  _u128 aes_key1;
  _Bool aes_step;
  _u16 AES_ADDR_START;
  _u16 AES_REG_START;
  _u16 AES_REG_STATE;
  _u16 AES_REG_ADDR;
  _u16 AES_REG_LEN;
  _u16 AES_REG_KEYSEL;
  _u16 AES_REG_CTR;
  _u16 AES_REG_KEY0;
  _u16 AES_REG_KEY1;
  _u16 AES_ADDR_END;
  _u2 AES_STATE_IDLE;
  _u2 AES_STATE_READ_DATA;
  _u2 AES_STATE_OPERATE;
  _u2 AES_STATE_WRITE_DATA;
  _Bool sel_reg_start;
  _Bool sel_reg_state;
  _Bool sel_reg_keysel;
  _Bool sel_reg_addr;
  _Bool sel_reg_len;
  _Bool sel_reg_ctr;
  _Bool sel_reg_key0;
  _Bool sel_reg_key1;
  _u2 aes_reg_state;
  _Bool aes_state_idle;
  _Bool aes_state_read_data;
  _Bool aes_state_operate;
  _Bool aes_state_write_data;
  _Bool wren;
  _Bool start_op;
  _Bool aes_reg_keysel;
  _Bool aes_reg_keysel_next;
  _u16 aes_reg_opaddr;
  _u8 aes_addr_dataout;
  struct module_reg2byte aes_reg_opaddr_i;
  _u16 aes_reg_oplen;
  _u8 aes_len_dataout;
  struct module_reg2byte aes_reg_oplen_i;
  _u128 aes_reg_ctr;
  _u8 aes_ctr_dataout;
  struct module_reg16byte aes_reg_ctr_i;
  _u128 aes_reg_key0;
  _u8 aes_key0_dataout;
  struct module_reg16byte aes_reg_key0_i;
  _u128 aes_reg_key1;
  _u8 aes_key1_dataout;
  struct module_reg16byte aes_reg_key1_i;
  _u16 operated_bytes_count;
  _u16 operated_bytes_count_next;
  _u16 block_counter;
  _u16 block_counter_next;
  _u4 byte_counter;
  _Bool reset_byte_counter;
  _Bool incr_byte_counter;
  _u4 byte_counter_next;
  _Bool last_byte_acked;
  _Bool more_blocks;
  _u2 aes_reg_state_next_idle;
  _u2 aes_reg_state_next_read_data;
  _u2 aes_reg_state_next_operate;
  _u2 aes_reg_state_next_write_data;
  _u2 aes_reg_state_next;
  _u128 mem_data_buf;
  _u128 mem_data_buf_next;
  _u128 aes_ctr_v;
  _u128 aes_out;
  _u128 encrypted_data;
  _u128 aes_curr_key;
  struct module_aes_128 aes_128_i;
  _u128 encrypted_data_buf;
  _u128 encrypted_data_buf_next;
};

// Module Verilog::sha1_w_mem

struct module_sha1_w_mem {
  _u32 SHA1_ROUNDS;
  _u1 CTRL_IDLE;
  _u1 CTRL_UPDATE;
  _array_of_16__u32 w_mem;
  _u32 w_mem00_new;
  _u32 w_mem01_new;
  _u32 w_mem02_new;
  _u32 w_mem03_new;
  _u32 w_mem04_new;
  _u32 w_mem05_new;
  _u32 w_mem06_new;
  _u32 w_mem07_new;
  _u32 w_mem08_new;
  _u32 w_mem09_new;
  _u32 w_mem10_new;
  _u32 w_mem11_new;
  _u32 w_mem12_new;
  _u32 w_mem13_new;
  _u32 w_mem14_new;
  _u32 w_mem15_new;
  _Bool w_mem_we;
  _u7 w_ctr_reg;
  _u7 w_ctr_new;
  _Bool w_ctr_we;
  _Bool w_ctr_inc;
  _Bool w_ctr_rst;
  _Bool sha1_w_mem_ctrl_reg;
  _Bool sha1_w_mem_ctrl_new;
  _Bool sha1_w_mem_ctrl_we;
  _u32 w_tmp;
  _u32 w_new;
  _u32 w_0;
  _u32 w_2;
  _u32 w_8;
  _u32 w_13;
  _u32 w_16;
  _Bool clk;
  _Bool reset_n;
  _u512 block;
  _Bool init;
  _Bool next;
  _u32 w;
};

// Module Verilog::sha1_core

struct module_sha1_core {
  _u32 H0_0;
  _u32 H0_1;
  _u32 H0_2;
  _u32 H0_3;
  _u32 H0_4;
  _u32 SHA1_ROUNDS;
  _u32 CTRL_IDLE;
  _u32 CTRL_ROUNDS;
  _u32 CTRL_DONE;
  _u32 a_reg;
  _u32 a_new;
  _u32 b_reg;
  _u32 b_new;
  _u32 c_reg;
  _u32 c_new;
  _u32 d_reg;
  _u32 d_new;
  _u32 e_reg;
  _u32 e_new;
  _Bool a_e_we;
  _u32 H0_reg;
  _u32 H0_new;
  _u32 H1_reg;
  _u32 H1_new;
  _u32 H2_reg;
  _u32 H2_new;
  _u32 H3_reg;
  _u32 H3_new;
  _u32 H4_reg;
  _u32 H4_new;
  _Bool H_we;
  _u7 round_ctr_reg;
  _u7 round_ctr_new;
  _Bool round_ctr_we;
  _Bool round_ctr_inc;
  _Bool round_ctr_rst;
  _Bool digest_valid_reg;
  _Bool digest_valid_new;
  _Bool digest_valid_we;
  _u2 sha1_ctrl_reg;
  _u2 sha1_ctrl_new;
  _Bool sha1_ctrl_we;
  _Bool digest_init;
  _Bool digest_update;
  _Bool state_init;
  _Bool state_update;
  _Bool first_block;
  _Bool ready_flag;
  _Bool w_init;
  _Bool w_next;
  _u32 w;
  struct module_sha1_w_mem w_mem_inst;
  _u32 a5;
  _u32 f;
  _u32 k;
  _u32 t;
  _Bool clk;
  _Bool reset_n;
  _Bool init;
  _Bool next;
  _u512 block;
  _Bool ready;
  _u160 digest;
  _Bool digest_valid;
};

// Module Verilog::sha_top

struct module_sha_top {
  _Bool clk;
  _Bool wr;
  _Bool stb;
  _Bool rst;
  _u8 data_in;
  _u16 addr;
  _u8 data_out;
  _Bool ack;
  _Bool in_addr_range;
  _u16 xram_addr;
  _u8 xram_data_out;
  _u8 xram_data_in;
  _Bool xram_ack;
  _Bool xram_stb;
  _Bool xram_wr;
  _u2 sha_state;
  _u16 sha_rdaddr;
  _u16 sha_wraddr;
  _u16 sha_len;
  _Bool sha_step;
  _Bool sha_core_assumps_valid;
  _u16 SHA_ADDR_START;
  _u16 SHA_REG_START;
  _u16 SHA_REG_STATE;
  _u16 SHA_REG_RD_ADDR;
  _u16 SHA_REG_WR_ADDR;
  _u16 SHA_REG_LEN;
  _u16 SHA_ADDR_END;
  _u2 sha_reg_state;
  _Bool sha_state_idle;
  _Bool sha_state_read_data;
  _Bool sha_state_operate;
  _Bool sha_state_write_data;
  _Bool sel_reg_start;
  _Bool sel_reg_state;
  _Bool sel_reg_rd_addr;
  _Bool sel_reg_wr_addr;
  _Bool sel_reg_len;
  _Bool wren;
  _Bool start_op;
  _u2 SHA_STATE_IDLE;
  _u2 SHA_STATE_READ_DATA;
  _u2 SHA_STATE_OPERATE;
  _u2 SHA_STATE_WRITE_DATA;
  _u2 sha_state_next;
  _u2 sha_state_next_idle;
  _u2 sha_state_next_read_data;
  _u2 sha_state_next_operate;
  _u2 sha_state_next_write_data;
  _u6 byte_counter;
  _u6 byte_counter_next;
  _u6 byte_counter_next_rw;
  _u16 reg_bytes_read;
  _u16 bytes_read_next;
  _u16 block_counter;
  _u16 block_counter_next;
  _Bool reading_last_byte;
  _Bool read_last_byte_acked;
  _Bool sha_more_blocks;
  _Bool sha_finished;
  _u512 sha_core_block_read_data_next;
  _u512 sha_core_block_next;
  _Bool writing_last_byte;
  _Bool write_last_byte_acked;
  _u8 data_out_state;
  _u8 data_out_rd_addr;
  _u8 data_out_wr_addr;
  _u8 data_out_len;
  _u16 sha_reg_rd_addr;
  struct module_reg2byte sha_reg_rd_addr_i;
  _u16 sha_reg_wr_addr;
  struct module_reg2byte sha_reg_wr_addr_i;
  _u16 sha_reg_len;
  struct module_reg2byte sha_reg_len_i;
  _Bool sha_core_rst_n;
  _Bool sha_core_init;
  _Bool sha_core_next;
  _Bool sha_core_ready;
  _Bool sha_core_digest_valid;
  _u512 sha_core_block;
  _u160 sha_core_digest;
  _u160 sha_reg_digest;
  _u160 sha_reg_digest_next;
  _Bool sha_core_assumps_valid_reg;
  _Bool sha_core_assumps_valid_reg_next;
  struct module_sha1_core sha1_core_i;
};

// Module Verilog::oc8051_memarbiter

struct module_oc8051_memarbiter {
  _Bool clk;
  _Bool rst;
  _Bool stb_A;
  _Bool ack_A;
  _Bool wr_A;
  _u16 addr_A;
  _u8 data_in_A;
  _u8 data_out_A;
  _Bool stb_B;
  _Bool ack_B;
  _Bool wr_B;
  _u16 addr_B;
  _u8 data_in_B;
  _u8 data_out_B;
  _Bool stb_C;
  _Bool ack_C;
  _Bool wr_C;
  _u16 addr_C;
  _u8 data_in_C;
  _u8 data_out_C;
  _Bool stb;
  _Bool wr;
  _Bool ack;
  _u16 addr;
  _u8 data_in;
  _u8 data_out;
  _u2 PORT_A;
  _u2 PORT_B;
  _u2 PORT_C;
  _u2 selected_port;
  _Bool arbiter_state;
  _u1 STATE_INUSE;
  _u1 STATE_IDLE;
  _Bool arbiter_state_inuse_next;
  _Bool arbiter_state_idle_next;
  _Bool arbiter_state_next;
  _Bool arbit_select_winner;
  _u2 arbit_winner;
  _u2 arbit_holder;
  _u2 arbit_holder_next;
};

// Module Verilog::oc8051_xram

struct module_oc8051_xram {
  _u32 DELAY;
  _Bool clk;
  _Bool wr;
  _Bool stb;
  _Bool rst;
  _u8 data_in;
  _u16 addr;
  _u8 data_out;
  _Bool ack;
  _Bool ackw;
  _Bool ackr;
  _u3 cnt;
  _array_of_65536__u8 buff;
};

// Module Verilog::oc8051_xiommu

struct module_oc8051_xiommu {
  _Bool clk;
  _Bool rst;
  _Bool proc_wr;
  _Bool proc_stb;
  _u8 proc_data_in;
  _u16 proc_addr;
  _u8 proc_data_out;
  _Bool proc_ack;
  _u2 aes_state;
  _u2 sha_state;
  _Bool aes_step;
  _Bool sha_step;
  _Bool sha_core_assumps_valid;
  _u16 aes_addr;
  _u16 aes_len;
  _u16 sha_rdaddr;
  _u16 sha_wraddr;
  _u16 sha_len;
  _u128 aes_ctr;
  _u128 aes_key0;
  _u128 aes_key1;
  _Bool write_xram;
  _Bool write_aes;
  _Bool write_sha;
  _Bool ack_xram;
  _Bool ack_aes;
  _Bool ack_sha;
  _Bool stb_xram;
  _Bool stb_aes;
  _Bool stb_sha;
  _Bool aes_addr_range;
  _Bool sha_addr_range;
  _u8 data_out_xram;
  _u8 data_out_aes;
  _u8 data_out_sha;
  _u16 aes_xram_addr;
  _u8 aes_xram_data_out;
  _u8 aes_xram_data_in;
  _Bool aes_xram_ack;
  _Bool aes_xram_stb;
  _Bool aes_xram_wr;
  //struct module_aes_top aes_top_i;
  _u16 sha_xram_addr;
  _u8 sha_xram_data_out;
  _u8 sha_xram_data_in;
  _Bool sha_xram_ack;
  _Bool sha_xram_stb;
  _Bool sha_xram_wr;
  //struct module_sha_top sha_top_i;
  _Bool stb_out;
  _Bool ack_in;
  _Bool wr_out;
  _u16 addr_out;
  _u8 memarbiter_data_in;
  _u8 memarbiter_data_out;
  //struct module_oc8051_memarbiter oc8051_memarbiter_i;
  //struct module_oc8051_xram oc8051_xram_i;
};

// top module
extern struct module_oc8051_xiommu oc8051_xiommu;


#endif
