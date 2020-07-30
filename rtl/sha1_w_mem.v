/*verilator coverage_off */
//======================================================================
//
// sha1_w_mem_reg.v
// -----------------
// The SHA-1 W memory. This memory includes functionality to
// expand the block into 80 words.
//
//
// Copyright (c) 2013 Secworks Sweden AB
// All rights reserved.
//
// Redistribution and use in source and binary forms, with or
// without modification, are permitted provided that the following
// conditions are met:
//
// 1. Redistributions of source code must retain the above copyright
//    notice, this list of conditions and the following disclaimer.
//
// 2. Redistributions in binary form must reproduce the above copyright
//    notice, this list of conditions and the following disclaimer in
//    the documentation and/or other materials provided with the
//    distribution.
//
// THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS
// "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT
// LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS
// FOR A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE
// COPYRIGHT OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
// INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
// BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
// LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
// CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT,
// STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
// ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF
// ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
//
//======================================================================

module sha1_w_mem(
                  input wire           clk,
                  input wire           reset_n,

                  input wire [511 : 0] block,

                  input wire           init,
                  input wire           next,

                  output wire [31 : 0] w
                 );


  //----------------------------------------------------------------
  // Internal constant and parameter definitions.
  //----------------------------------------------------------------
  parameter SHA1_ROUNDS = 79;

  parameter CTRL_IDLE   = 1'b0;
  parameter CTRL_UPDATE = 1'b1;


  //----------------------------------------------------------------
  // Registers including update variables and write enable.
  //----------------------------------------------------------------
  reg [31 : 0] w_mem [0 : 15];
  reg [31 : 0] w_mem00_new;
  reg [31 : 0] w_mem01_new;
  reg [31 : 0] w_mem02_new;
  reg [31 : 0] w_mem03_new;
  reg [31 : 0] w_mem04_new;
  reg [31 : 0] w_mem05_new;
  reg [31 : 0] w_mem06_new;
  reg [31 : 0] w_mem07_new;
  reg [31 : 0] w_mem08_new;
  reg [31 : 0] w_mem09_new;
  reg [31 : 0] w_mem10_new;
  reg [31 : 0] w_mem11_new;
  reg [31 : 0] w_mem12_new;
  reg [31 : 0] w_mem13_new;
  reg [31 : 0] w_mem14_new;
  reg [31 : 0] w_mem15_new;
  reg          w_mem_we;

  reg [6 : 0] w_ctr_reg;
  reg [6 : 0] w_ctr_new;
  reg         w_ctr_we;
  reg         w_ctr_inc;
  reg         w_ctr_rst;

  reg         sha1_w_mem_ctrl_reg;
  reg         sha1_w_mem_ctrl_new;
  reg         sha1_w_mem_ctrl_we;


  //----------------------------------------------------------------
  // Wires.
  //----------------------------------------------------------------
  reg [31 : 0] w_tmp;
  reg [31 : 0] w_new;


  //----------------------------------------------------------------
  // Concurrent connectivity for ports etc.
  //----------------------------------------------------------------
  assign w = w_tmp;


  //----------------------------------------------------------------
  // reg_update
  //
  // Update functionality for all registers in the core.
  // All registers are positive edge triggered with
  // asynchronous active low reset.
  //----------------------------------------------------------------
  always @ (posedge clk or negedge reset_n)
    begin
      if (!reset_n)
        begin
          w_mem[00]           <= 32'h00000000;
          w_mem[01]           <= 32'h00000000;
          w_mem[02]           <= 32'h00000000;
          w_mem[03]           <= 32'h00000000;
          w_mem[04]           <= 32'h00000000;
          w_mem[05]           <= 32'h00000000;
          w_mem[06]           <= 32'h00000000;
          w_mem[07]           <= 32'h00000000;
          w_mem[08]           <= 32'h00000000;
          w_mem[09]           <= 32'h00000000;
          w_mem[10]           <= 32'h00000000;
          w_mem[11]           <= 32'h00000000;
          w_mem[12]           <= 32'h00000000;
          w_mem[13]           <= 32'h00000000;
          w_mem[14]           <= 32'h00000000;
          w_mem[15]           <= 32'h00000000;
          w_ctr_reg           <= 7'h00;
          sha1_w_mem_ctrl_reg <= CTRL_IDLE;
        end
      else
        begin
          if (w_mem_we)
            begin
              w_mem[00] <= w_mem00_new;
              w_mem[01] <= w_mem01_new;
              w_mem[02] <= w_mem02_new;
              w_mem[03] <= w_mem03_new;
              w_mem[04] <= w_mem04_new;
              w_mem[05] <= w_mem05_new;
              w_mem[06] <= w_mem06_new;
              w_mem[07] <= w_mem07_new;
              w_mem[08] <= w_mem08_new;
              w_mem[09] <= w_mem09_new;
              w_mem[10] <= w_mem10_new;
              w_mem[11] <= w_mem11_new;
              w_mem[12] <= w_mem12_new;
              w_mem[13] <= w_mem13_new;
              w_mem[14] <= w_mem14_new;
              w_mem[15] <= w_mem15_new;
            end

          if (w_ctr_we)
            begin
              w_ctr_reg <= w_ctr_new;
            end

          if (sha1_w_mem_ctrl_we)
            begin
              sha1_w_mem_ctrl_reg <= sha1_w_mem_ctrl_new;
            end

        end
    end // reg_update


  //----------------------------------------------------------------
  // select_w
  //
  // W word selection logic. Returns either directly from the
  // memory or the next w value calculated.
  //----------------------------------------------------------------
  always @*
    begin 
      if (w_ctr_reg < 16)
        begin
          w_tmp = w_mem[w_ctr_reg[3 : 0]];
        end
      else
        begin
          w_tmp = w_new;
        end
    end // select_w


  //----------------------------------------------------------------
  // w_mem_update_logic
  //
  // Update logic for the W memory. This is where the scheduling
  // based on a sliding window is implemented.
  //----------------------------------------------------------------
  reg [31 : 0] w_0;
  reg [31 : 0] w_2;
  reg [31 : 0] w_8;
  reg [31 : 0] w_13;
  reg [31 : 0] w_16;
  always @*
    begin 

      w_mem00_new = 32'h00000000;
      w_mem01_new = 32'h00000000;
      w_mem02_new = 32'h00000000;
      w_mem03_new = 32'h00000000;
      w_mem04_new = 32'h00000000;
      w_mem05_new = 32'h00000000;
      w_mem06_new = 32'h00000000;
      w_mem07_new = 32'h00000000;
      w_mem08_new = 32'h00000000;
      w_mem09_new = 32'h00000000;
      w_mem10_new = 32'h00000000;
      w_mem11_new = 32'h00000000;
      w_mem12_new = 32'h00000000;
      w_mem13_new = 32'h00000000;
      w_mem14_new = 32'h00000000;
      w_mem15_new = 32'h00000000;
      w_mem_we    = 0;

      w_0   = w_mem[0];
      w_2   = w_mem[2];
      w_8   = w_mem[8];
      w_13  = w_mem[13];
      w_16  = w_13 ^ w_8 ^ w_2 ^ w_0;
      w_new = {w_16[30 : 0], w_16[31]};

      if (init)
        begin
          w_mem00_new = block[511 : 480];
          w_mem01_new = block[479 : 448];
          w_mem02_new = block[447 : 416];
          w_mem03_new = block[415 : 384];
          w_mem04_new = block[383 : 352];
          w_mem05_new = block[351 : 320];
          w_mem06_new = block[319 : 288];
          w_mem07_new = block[287 : 256];
          w_mem08_new = block[255 : 224];
          w_mem09_new = block[223 : 192];
          w_mem10_new = block[191 : 160];
          w_mem11_new = block[159 : 128];
          w_mem12_new = block[127 :  96];
          w_mem13_new = block[95  :  64];
          w_mem14_new = block[63  :  32];
          w_mem15_new = block[31  :   0];
          w_mem_we    = 1;
        end

      else if (w_ctr_reg > 15)
        begin
          w_mem00_new = w_mem[01];
          w_mem01_new = w_mem[02];
          w_mem02_new = w_mem[03];
          w_mem03_new = w_mem[04];
          w_mem04_new = w_mem[05];
          w_mem05_new = w_mem[06];
          w_mem06_new = w_mem[07];
          w_mem07_new = w_mem[08];
          w_mem08_new = w_mem[09];
          w_mem09_new = w_mem[10];
          w_mem10_new = w_mem[11];
          w_mem11_new = w_mem[12];
          w_mem12_new = w_mem[13];
          w_mem13_new = w_mem[14];
          w_mem14_new = w_mem[15];
          w_mem15_new = w_new;
          w_mem_we    = 1;
        end
    end // w_mem_update_logic


  //----------------------------------------------------------------
  // w_ctr
  //
  // W schedule adress counter. Counts from 0x10 to 0x3f and
  // is used to expand the block into words.
  //----------------------------------------------------------------
  always @*
    begin 
      w_ctr_new = 7'h00;
      w_ctr_we  = 0;

      if (w_ctr_rst)
        begin
          w_ctr_new = 7'h00;
          w_ctr_we  = 1;
        end

      if (w_ctr_inc)
        begin
          w_ctr_new = w_ctr_reg + 7'h01;
          w_ctr_we  = 1;
        end
    end // w_ctr


  //----------------------------------------------------------------
  // sha1_w_mem_fsm
  //
  // Logic for the w shedule FSM.
  //----------------------------------------------------------------
  always @*
    begin 
      w_ctr_rst           = 0;
      w_ctr_inc           = 0;
      sha1_w_mem_ctrl_new = CTRL_IDLE;
      sha1_w_mem_ctrl_we  = 0;

      case (sha1_w_mem_ctrl_reg)
        CTRL_IDLE:
          begin
            if (init)
              begin
                w_ctr_rst           = 1;
                sha1_w_mem_ctrl_new = CTRL_UPDATE;
                sha1_w_mem_ctrl_we  = 1;
              end
          end

        CTRL_UPDATE:
          begin
            if (next)
              begin
                w_ctr_inc = 1;
              end

            if (w_ctr_reg == SHA1_ROUNDS)
              begin
                sha1_w_mem_ctrl_new = CTRL_IDLE;
                sha1_w_mem_ctrl_we  = 1;
              end
          end
      endcase // case (sha1_ctrl_reg)
    end // sha1_ctrl_fsm
endmodule // sha1_w_mem

//======================================================================
// sha1_w_mem.v
//======================================================================
/* verilator coverage_on */
