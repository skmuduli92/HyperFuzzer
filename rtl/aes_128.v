/*verilator coverage_off */
/*
 * Copyright 2012, Homer Hsing <homer.hsing@gmail.com>
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

module aes_128(clk, rst, start, state, key, out, done);
    input          clk;
    input          rst;
    input          start;
    input  [127:0] state, key;
    output [127:0] out; 
    wire   [127:0] outb;
    output         done;
    reg    [127:0] s0, k0;
    wire   [127:0] s1, s2, s3, s4, s5, s6, s7, s8, s9,
                   k1, k2, k3, k4, k5, k6, k7, k8, k9,
                   k0b, k1b, k2b, k3b, k4b, k5b, k6b, k7b, k8b, k9b;
    wire   [127:0] key_in, key_out1, key_out2;
    reg    [127:0] k1s, k2s, k3s, k4s, k5s, k6s, k7s, k8s, k9s,
                   k0bs, k1bs, k2bs, k3bs, k4bs, k5bs, k6bs, k7bs, k8bs, k9bs;
    reg    [127:0] s1b, s2b, s3b, s4b, s5b, s6b, s7b, s8b, s9b;

    reg [6:0] fsm_state;
    wire [6:0] fsm_state_next;
    wire done;

    localparam STATE_IDLE = 6'd0;
    localparam STATE_OP1  = 6'd1;
    localparam STATE_DONE = 6'd23;
    assign fsm_state_next =
           (fsm_state == STATE_IDLE) 
              ? start ? STATE_OP1  : STATE_IDLE 
              : done  ? STATE_IDLE : (fsm_state + STATE_OP1);
            
    assign done = fsm_state == STATE_DONE;

    always @(posedge clk)
    begin
        if (rst)
        begin
            fsm_state <= STATE_IDLE;
            k1s <= 128'd0; k2s <= 128'd0; k3s <= 128'd0;
            k4s <= 128'd0; k5s <= 128'd0; k6s <= 128'd0;
            k7s <= 128'd0; k8s <= 128'd0; k9s <= 128'd0;
            k0bs <= 128'd0; k3bs <= 128'd0; k6bs <= 128'd0;
            k1bs <= 128'd0; k4bs <= 128'd0; k7bs <= 128'd0;
            k2bs <= 128'd0; k5bs <= 128'd0; k8bs <= 128'd0;
            k9bs <= 128'd0;
            s0 <= 128'b0;
            k0 <= 128'b0;
        end
        else begin
            fsm_state <= fsm_state_next;
            if (fsm_state == STATE_IDLE && start) 
            begin
                s0 <= state ^ key;
                k0 <= key;
            end
        end
    end

    assign key_in = (fsm_state <= 6'd2 ) ? k0  :
                    (fsm_state <= 6'd4 ) ? k1s :
                    (fsm_state <= 6'd6 ) ? k2s :
                    (fsm_state <= 6'd8 ) ? k3s :
                    (fsm_state <= 6'd10) ? k4s :
                    (fsm_state <= 6'd12) ? k5s :
                    (fsm_state <= 6'd14) ? k6s :
                    (fsm_state <= 6'd16) ? k7s :
                    (fsm_state <= 6'd18) ? k8s : k9s;

    wire [7:0] rcon = 
        (fsm_state <= 6'd2 ) ? 8'h1  :
        (fsm_state <= 6'd4 ) ? 8'h2  :
        (fsm_state <= 6'd6 ) ? 8'h4  :
        (fsm_state <= 6'd8 ) ? 8'h8  :
        (fsm_state <= 6'd10) ? 8'h10 :
        (fsm_state <= 6'd12) ? 8'h20 :
        (fsm_state <= 6'd14) ? 8'h40 :
        (fsm_state <= 6'd16) ? 8'h80 :
        (fsm_state <= 6'd18) ? 8'h1b : 8'h36;

    always @(posedge clk)
    begin
        k1s <= (fsm_state == 6'd2 ) ? key_out1  : k1s;
        k2s <= (fsm_state == 6'd4 ) ? key_out1  : k2s;
        k3s <= (fsm_state == 6'd6 ) ? key_out1  : k3s;
        k4s <= (fsm_state == 6'd8 ) ? key_out1  : k4s;
        k5s <= (fsm_state == 6'd10) ? key_out1  : k5s;
        k6s <= (fsm_state == 6'd12) ? key_out1  : k6s;
        k7s <= (fsm_state == 6'd14) ? key_out1  : k7s;
        k8s <= (fsm_state == 6'd16) ? key_out1  : k8s;
        k9s <= (fsm_state == 6'd18) ? key_out1  : k9s;

        k0bs <= (fsm_state == 6'd2 ) ? key_out2 : k0bs;
        k1bs <= (fsm_state == 6'd4 ) ? key_out2 : k1bs;
        k2bs <= (fsm_state == 6'd6 ) ? key_out2 : k2bs;
        k3bs <= (fsm_state == 6'd8 ) ? key_out2 : k3bs;
        k4bs <= (fsm_state == 6'd10) ? key_out2 : k4bs;
        k5bs <= (fsm_state == 6'd12) ? key_out2 : k5bs;
        k6bs <= (fsm_state == 6'd14) ? key_out2 : k6bs;
        k7bs <= (fsm_state == 6'd16) ? key_out2 : k7bs;
        k8bs <= (fsm_state == 6'd18) ? key_out2 : k8bs;
        k9bs <= (fsm_state == 6'd20) ? key_out2 : k9bs;
    end

    expand_key_128
        ek (clk, key_in, key_out1, key_out2, rcon);

    /* verilator lint_off PINNOCONNECT */
    /*
    expand_key_128
        a1 (clk, k0, k1, k0b, 8'h1),
        a2 (clk, k1, k2, k1b, 8'h2),
        a3 (clk, k2, k3, k2b, 8'h4),
        a4 (clk, k3, k4, k3b, 8'h8),
        a5 (clk, k4, k5, k4b, 8'h10),
        a6 (clk, k5, k6, k5b, 8'h20),
        a7 (clk, k6, k7, k6b, 8'h40),
        a8 (clk, k7, k8, k7b, 8'h80),
        a9 (clk, k8, k9, k8b, 8'h1b),
       a10 (clk, k9,   , k9b, 8'h36);
    */
    /* verilator lint_on PINNOCONNECT */

    /*
    one_round
        r1 (clk, s0, k0b, s1),
        r2 (clk, s1, k1b, s2),
        r3 (clk, s2, k2b, s3),
        r4 (clk, s3, k3b, s4),
        r5 (clk, s4, k4b, s5),
        r6 (clk, s5, k5b, s6),
        r7 (clk, s6, k6b, s7),
        r8 (clk, s7, k7b, s8),
        r9 (clk, s8, k8b, s9);

    final_round
        rf (clk, s9, k9b, out);
    */

    wire [127:0] state_in, round_key_in, state_out;
    assign round_key_in = 
        (fsm_state <= 6'd3 ) ? k0bs  :
        (fsm_state <= 6'd5 ) ? k1bs :
        (fsm_state <= 6'd7 ) ? k2bs :
        (fsm_state <= 6'd9 ) ? k3bs :
        (fsm_state <= 6'd11) ? k4bs :
        (fsm_state <= 6'd13) ? k5bs :
        (fsm_state <= 6'd15) ? k6bs :
        (fsm_state <= 6'd17) ? k7bs :
        (fsm_state <= 6'd19) ? k8bs : k9bs;
    assign state_in = 
        (fsm_state <= 6'd3 ) ? s0  :
        (fsm_state <= 6'd5 ) ? s1b :
        (fsm_state <= 6'd7 ) ? s2b :
        (fsm_state <= 6'd9 ) ? s3b :
        (fsm_state <= 6'd11) ? s4b :
        (fsm_state <= 6'd13) ? s5b :
        (fsm_state <= 6'd15) ? s6b :
        (fsm_state <= 6'd17) ? s7b :
        (fsm_state <= 6'd19) ? s8b : s9b;

    one_round_comb rnd(clk, state_in, round_key_in, state_out);

    always @(posedge clk)
    begin
        if (rst)
        begin
            s1b <= 128'd0;
            s2b <= 128'd0;
            s3b <= 128'd0;
            s4b <= 128'd0;
            s5b <= 128'd0;
            s6b <= 128'd0;
            s7b <= 128'd0;
            s8b <= 128'd0;
            s9b <= 128'd0;
        end
        else
        begin
            s1b <= fsm_state == 6'd3 ? state_out : s1b;
            s2b <= fsm_state == 6'd5 ? state_out : s2b;
            s3b <= fsm_state == 6'd7 ? state_out : s3b;
            s4b <= fsm_state == 6'd9 ? state_out : s4b;
            s5b <= fsm_state == 6'd11 ? state_out : s5b;
            s6b <= fsm_state == 6'd13 ? state_out : s6b;
            s7b <= fsm_state == 6'd15 ? state_out : s7b;
            s8b <= fsm_state == 6'd17 ? state_out : s8b;
            s9b <= fsm_state == 6'd19 ? state_out : s9b;
        end
    end

    /*
    one_round
        r1b (clk, s0, k0bs, s1),
        r2b (clk, s1, k1bs, s2),
        r3b (clk, s2, k2bs, s3),
        r4b (clk, s3, k3bs, s4),
        r5b (clk, s4, k4bs, s5),
        r6b (clk, s5, k5bs, s6),
        r7b (clk, s6, k6bs, s7),
        r8b (clk, s7, k7bs, s8),
        r9b (clk, s8, k8bs, s9);
    */

    final_round
        rfb (clk, s9b, k9bs, out);
endmodule

module expand_key_128(clk, in, out_1, out_2, rcon);
    input              clk;
    input      [127:0] in;
    input      [7:0]   rcon;
    output     [127:0] out_1;
    output     [127:0] out_2;

    wire       [31:0]  k0, k1, k2, k3,
                       v0, v1, v2, v3;
    wire       [127:0] out_1, out_2;
    reg        [31:0]  k0a, k1a, k2a, k3a;
    wire       [31:0]  k0b, k1b, k2b, k3b, k4a;

    assign {k0, k1, k2, k3} = in;

    assign v0 = {k0[31:24] ^ rcon, k0[23:0]};
    assign v1 = v0 ^ k1;
    assign v2 = v1 ^ k2;
    assign v3 = v2 ^ k3;

    always @ (posedge clk)
        {k0a, k1a, k2a, k3a} <= {v0, v1, v2, v3};

    S4
        S4_0 (clk, {k3[23:0], k3[31:24]}, k4a);

    assign k0b = k0a ^ k4a;
    assign k1b = k1a ^ k4a;
    assign k2b = k2a ^ k4a;
    assign k3b = k3a ^ k4a;

    assign out_1 = {k0b, k1b, k2b, k3b};
    assign out_2 = {k0b, k1b, k2b, k3b};
endmodule

/* verilator coverage_on */
