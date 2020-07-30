
/*
 * AES module that interfaces with the oc8051.
 *
 * This wrapper was written by Pramod Subramanyan.
 * Email: psubrama@princeton.edu
 */

// synopsys translate_off
`include "oc8051_timescale.v"
// synopsys translate_on
/*verilator coverage_off */
module modexp_top(
    clk,
    rst,
    wr,
    addr,
    data_in,
    data_out,
    ack,
    stb,
    in_addr_range,
    xram_addr,      // EXP ==> XRAM
    xram_data_out,  // EXP ==> XRAM
    xram_data_in,   // XRAM ==> EXP
    xram_ack,       // XRAM ==> EXP
    xram_stb,       // EXP ==> XRAM
    xram_wr,
    exp_state,
    exp_addr,
    exp_step,
    exp_m,
    exp_exp,
    exp_n,
    exp_valid
);

// 8051 <=> EXP
input clk, wr, stb, rst;
input [7:0] data_in;
input [15:0] addr;
output [7:0] data_out;
output ack;
output in_addr_range;

// EXP <=> XRAM
output [15:0] xram_addr;
output [7:0] xram_data_out;
input [7:0] xram_data_in;
input xram_ack;
output xram_stb;
output xram_wr;

// verif output
output [1:0] exp_state;
output [15:0] exp_addr;
output [2047:0] exp_m, exp_exp, exp_n;
output exp_step, exp_valid;

// FIRST ADDRESS ALLOCATED TO THIS UNIT.
localparam EXP_ADDR_START   = 16'hfa00;
// see also EXP_ADDR_END.

// addresses of registers.
localparam EXP_REG_M     = 16'hfa00;  // 256 bytes.
localparam EXP_REG_EXP   = 16'hfb00;  // 256 bytes.
localparam EXP_REG_N     = 16'hfc00;  // 256 bytes.
localparam EXP_REG_START = 16'hfd00;  // 1 byte.
localparam EXP_REG_STATE = 16'hfd01;  // 1 byte.
localparam EXP_REG_ADDR  = 16'hfd02;  // 2 bytes.

//END OF ADDRESS RANGE ALLOCATED TO THIS UNIT.
localparam EXP_ADDR_END  = 16'hfd10;
// see also EXP_ADDR_START.

// The current state of the EXP module.
localparam EXP_STATE_IDLE       = 3'd0;
localparam EXP_STATE_OPERATE    = 3'd1;
localparam EXP_STATE_WAIT       = 3'd2;
localparam EXP_STATE_WRITE_DATA = 3'd3;

wire in_addr_range = addr >= EXP_ADDR_START && addr < EXP_ADDR_END;
wire ack = stb && in_addr_range;

wire sel_reg_start = addr == EXP_REG_START;
wire sel_reg_state = addr == EXP_REG_STATE;
wire sel_reg_addr  = {addr[15:1],1'b0} == EXP_REG_ADDR;
wire sel_reg_m     = {addr[15:8],8'b0} == EXP_REG_M;
wire sel_reg_exp   = {addr[15:8],8'b0} == EXP_REG_EXP;
wire sel_reg_n     = {addr[15:8],8'b0} == EXP_REG_N;

// state register.
reg [1:0] exp_reg_state;
wire [1:0] exp_state = exp_reg_state;

wire [7:0] data_out =
    sel_reg_state ? {6'b0, exp_reg_state} :
    sel_reg_addr  ? exp_addr_dataout      :
    sel_reg_m     ? exp_m_dataout         :
    sel_reg_exp   ? exp_exp_dataout       :
    sel_reg_n     ? exp_n_dataout         : 8'd0;

// state predicates.
wire exp_state_idle = exp_reg_state == EXP_STATE_IDLE;
wire exp_state_operate = exp_reg_state == EXP_STATE_OPERATE;
wire exp_state_wait = exp_reg_state == EXP_STATE_WAIT;
wire exp_state_write_data = exp_reg_state == EXP_STATE_WRITE_DATA;

// consider writes only when we are in the idle states. other writes ignored.
wire wren = wr && exp_state_idle;
wire start_op = sel_reg_start && data_in[0] && wren;

// address register.
wire [15:0] exp_reg_opaddr;
wire [7:0] exp_addr_dataout;
reg2byte exp_reg_opaddr_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_addr),
    .wr         (sel_reg_addr && wren),
    .addr       (addr[0]),
    .data_in    (data_in),
    .data_out   (exp_addr_dataout),
    .reg_out    (exp_reg_opaddr)
);

wire [15:0] exp_addr = exp_reg_opaddr;

wire [7:0] bigend_addr = 8'hff - addr[7:0];

// m register.
wire [2047:0] exp_reg_m;
wire [7:0] exp_m_dataout;
reg256byte exp_reg_m_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_m),
    .wr         (sel_reg_m && wren),
    .addr       (bigend_addr),
    .data_in    (data_in),
    .data_out   (exp_m_dataout),
    .reg_out    (exp_reg_m)
);

// exp register.
wire [2047:0] exp_reg_exp;
wire [7:0] exp_exp_dataout;
reg256byte exp_reg_exp_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_exp),
    .wr         (sel_reg_exp && wren),
    .addr       (bigend_addr),
    .data_in    (data_in),
    .data_out   (exp_exp_dataout),
    .reg_out    (exp_reg_exp)
);

// n register.
wire [2047:0] exp_reg_n;
wire [7:0] exp_n_dataout;
reg256byte exp_reg_n_i(
    .clk        (clk),
    .rst        (rst),
    .en         (sel_reg_n),
    .wr         (sel_reg_n && wren),
    .addr       (bigend_addr),
    .data_in    (data_in),
    .data_out   (exp_n_dataout),
    .reg_out    (exp_reg_n)
);

wire [2047:0] exp_m = exp_reg_m;
wire [2047:0] exp_exp = exp_reg_exp;
wire [2047:0] exp_n = exp_reg_n;

wire exp_valid;

// keep track of the current byte being written.
reg [7:0] byte_counter;
wire reset_byte_counter = start_op;
wire incr_byte_counter = xram_ack;
wire [7:0] byte_counter_next = reset_byte_counter ? 0                :
                               incr_byte_counter  ? byte_counter + 1 :
                               byte_counter;
// is this the last byte?
wire last_byte_acked = byte_counter == 255 && xram_ack;

// XRAM interface signals: all but xram_data_out which is calculated below.
wire [15:0] xram_addr = exp_reg_opaddr + {8'b0, byte_counter};
wire xram_stb = exp_state_write_data;
wire xram_wr  = exp_state_write_data;

// next state logic.
wire [2:0] exp_reg_state_next_idle = start_op ? EXP_STATE_OPERATE : EXP_STATE_IDLE;
wire [2:0] exp_reg_state_next_operate = EXP_STATE_WAIT;
wire [2:0] exp_reg_state_next_wait = exp_valid ? EXP_STATE_WRITE_DATA : EXP_STATE_WAIT;
wire [2:0] exp_reg_state_next_write_data = last_byte_acked ? EXP_STATE_IDLE : EXP_STATE_WRITE_DATA;

wire [2:0] exp_reg_state_next =
        (exp_state_idle)       ? exp_reg_state_next_idle       :
        (exp_state_operate)    ? exp_reg_state_next_operate    :
        (exp_state_wait)       ? exp_reg_state_next_wait       :
        (exp_state_write_data) ? exp_reg_state_next_write_data :
        EXP_STATE_IDLE;

wire exp_step = (exp_reg_state != exp_reg_state_next);

// encrypt
wire [2047:0] exp_out;
modexp modexp_i(
    .clk        (clk),
    .rst        (rst),
    .start      (start_op),
    .ready      (exp_valid),
    .m          (exp_reg_m),
    .e          (exp_reg_exp),
    .n          (exp_reg_n),
    .c          (exp_out)
);

reg [2047:0] encrypted_data_buf;
wire [2047:0] encrypted_data_buf_next = exp_valid ? exp_out : encrypted_data_buf;

// encrypted data buffer.
assign xram_data_out =
    (byte_counter == 255) ? encrypted_data_buf[7   :0   ] :
    (byte_counter == 254) ? encrypted_data_buf[15  :8   ] :
    (byte_counter == 253) ? encrypted_data_buf[23  :16  ] :
    (byte_counter == 252) ? encrypted_data_buf[31  :24  ] :
    (byte_counter == 251) ? encrypted_data_buf[39  :32  ] :
    (byte_counter == 250) ? encrypted_data_buf[47  :40  ] :
    (byte_counter == 249) ? encrypted_data_buf[55  :48  ] :
    (byte_counter == 248) ? encrypted_data_buf[63  :56  ] :
    (byte_counter == 247) ? encrypted_data_buf[71  :64  ] :
    (byte_counter == 246) ? encrypted_data_buf[79  :72  ] :
    (byte_counter == 245) ? encrypted_data_buf[87  :80  ] :
    (byte_counter == 244) ? encrypted_data_buf[95  :88  ] :
    (byte_counter == 243) ? encrypted_data_buf[103 :96  ] :
    (byte_counter == 242) ? encrypted_data_buf[111 :104 ] :
    (byte_counter == 241) ? encrypted_data_buf[119 :112 ] :
    (byte_counter == 240) ? encrypted_data_buf[127 :120 ] :
    (byte_counter == 239) ? encrypted_data_buf[135 :128 ] :
    (byte_counter == 238) ? encrypted_data_buf[143 :136 ] :
    (byte_counter == 237) ? encrypted_data_buf[151 :144 ] :
    (byte_counter == 236) ? encrypted_data_buf[159 :152 ] :
    (byte_counter == 235) ? encrypted_data_buf[167 :160 ] :
    (byte_counter == 234) ? encrypted_data_buf[175 :168 ] :
    (byte_counter == 233) ? encrypted_data_buf[183 :176 ] :
    (byte_counter == 232) ? encrypted_data_buf[191 :184 ] :
    (byte_counter == 231) ? encrypted_data_buf[199 :192 ] :
    (byte_counter == 230) ? encrypted_data_buf[207 :200 ] :
    (byte_counter == 229) ? encrypted_data_buf[215 :208 ] :
    (byte_counter == 228) ? encrypted_data_buf[223 :216 ] :
    (byte_counter == 227) ? encrypted_data_buf[231 :224 ] :
    (byte_counter == 226) ? encrypted_data_buf[239 :232 ] :
    (byte_counter == 225) ? encrypted_data_buf[247 :240 ] :
    (byte_counter == 224) ? encrypted_data_buf[255 :248 ] :
    (byte_counter == 223) ? encrypted_data_buf[263 :256 ] :
    (byte_counter == 222) ? encrypted_data_buf[271 :264 ] :
    (byte_counter == 221) ? encrypted_data_buf[279 :272 ] :
    (byte_counter == 220) ? encrypted_data_buf[287 :280 ] :
    (byte_counter == 219) ? encrypted_data_buf[295 :288 ] :
    (byte_counter == 218) ? encrypted_data_buf[303 :296 ] :
    (byte_counter == 217) ? encrypted_data_buf[311 :304 ] :
    (byte_counter == 216) ? encrypted_data_buf[319 :312 ] :
    (byte_counter == 215) ? encrypted_data_buf[327 :320 ] :
    (byte_counter == 214) ? encrypted_data_buf[335 :328 ] :
    (byte_counter == 213) ? encrypted_data_buf[343 :336 ] :
    (byte_counter == 212) ? encrypted_data_buf[351 :344 ] :
    (byte_counter == 211) ? encrypted_data_buf[359 :352 ] :
    (byte_counter == 210) ? encrypted_data_buf[367 :360 ] :
    (byte_counter == 209) ? encrypted_data_buf[375 :368 ] :
    (byte_counter == 208) ? encrypted_data_buf[383 :376 ] :
    (byte_counter == 207) ? encrypted_data_buf[391 :384 ] :
    (byte_counter == 206) ? encrypted_data_buf[399 :392 ] :
    (byte_counter == 205) ? encrypted_data_buf[407 :400 ] :
    (byte_counter == 204) ? encrypted_data_buf[415 :408 ] :
    (byte_counter == 203) ? encrypted_data_buf[423 :416 ] :
    (byte_counter == 202) ? encrypted_data_buf[431 :424 ] :
    (byte_counter == 201) ? encrypted_data_buf[439 :432 ] :
    (byte_counter == 200) ? encrypted_data_buf[447 :440 ] :
    (byte_counter == 199) ? encrypted_data_buf[455 :448 ] :
    (byte_counter == 198) ? encrypted_data_buf[463 :456 ] :
    (byte_counter == 197) ? encrypted_data_buf[471 :464 ] :
    (byte_counter == 196) ? encrypted_data_buf[479 :472 ] :
    (byte_counter == 195) ? encrypted_data_buf[487 :480 ] :
    (byte_counter == 194) ? encrypted_data_buf[495 :488 ] :
    (byte_counter == 193) ? encrypted_data_buf[503 :496 ] :
    (byte_counter == 192) ? encrypted_data_buf[511 :504 ] :
    (byte_counter == 191) ? encrypted_data_buf[519 :512 ] :
    (byte_counter == 190) ? encrypted_data_buf[527 :520 ] :
    (byte_counter == 189) ? encrypted_data_buf[535 :528 ] :
    (byte_counter == 188) ? encrypted_data_buf[543 :536 ] :
    (byte_counter == 187) ? encrypted_data_buf[551 :544 ] :
    (byte_counter == 186) ? encrypted_data_buf[559 :552 ] :
    (byte_counter == 185) ? encrypted_data_buf[567 :560 ] :
    (byte_counter == 184) ? encrypted_data_buf[575 :568 ] :
    (byte_counter == 183) ? encrypted_data_buf[583 :576 ] :
    (byte_counter == 182) ? encrypted_data_buf[591 :584 ] :
    (byte_counter == 181) ? encrypted_data_buf[599 :592 ] :
    (byte_counter == 180) ? encrypted_data_buf[607 :600 ] :
    (byte_counter == 179) ? encrypted_data_buf[615 :608 ] :
    (byte_counter == 178) ? encrypted_data_buf[623 :616 ] :
    (byte_counter == 177) ? encrypted_data_buf[631 :624 ] :
    (byte_counter == 176) ? encrypted_data_buf[639 :632 ] :
    (byte_counter == 175) ? encrypted_data_buf[647 :640 ] :
    (byte_counter == 174) ? encrypted_data_buf[655 :648 ] :
    (byte_counter == 173) ? encrypted_data_buf[663 :656 ] :
    (byte_counter == 172) ? encrypted_data_buf[671 :664 ] :
    (byte_counter == 171) ? encrypted_data_buf[679 :672 ] :
    (byte_counter == 170) ? encrypted_data_buf[687 :680 ] :
    (byte_counter == 169) ? encrypted_data_buf[695 :688 ] :
    (byte_counter == 168) ? encrypted_data_buf[703 :696 ] :
    (byte_counter == 167) ? encrypted_data_buf[711 :704 ] :
    (byte_counter == 166) ? encrypted_data_buf[719 :712 ] :
    (byte_counter == 165) ? encrypted_data_buf[727 :720 ] :
    (byte_counter == 164) ? encrypted_data_buf[735 :728 ] :
    (byte_counter == 163) ? encrypted_data_buf[743 :736 ] :
    (byte_counter == 162) ? encrypted_data_buf[751 :744 ] :
    (byte_counter == 161) ? encrypted_data_buf[759 :752 ] :
    (byte_counter == 160) ? encrypted_data_buf[767 :760 ] :
    (byte_counter == 159) ? encrypted_data_buf[775 :768 ] :
    (byte_counter == 158) ? encrypted_data_buf[783 :776 ] :
    (byte_counter == 157) ? encrypted_data_buf[791 :784 ] :
    (byte_counter == 156) ? encrypted_data_buf[799 :792 ] :
    (byte_counter == 155) ? encrypted_data_buf[807 :800 ] :
    (byte_counter == 154) ? encrypted_data_buf[815 :808 ] :
    (byte_counter == 153) ? encrypted_data_buf[823 :816 ] :
    (byte_counter == 152) ? encrypted_data_buf[831 :824 ] :
    (byte_counter == 151) ? encrypted_data_buf[839 :832 ] :
    (byte_counter == 150) ? encrypted_data_buf[847 :840 ] :
    (byte_counter == 149) ? encrypted_data_buf[855 :848 ] :
    (byte_counter == 148) ? encrypted_data_buf[863 :856 ] :
    (byte_counter == 147) ? encrypted_data_buf[871 :864 ] :
    (byte_counter == 146) ? encrypted_data_buf[879 :872 ] :
    (byte_counter == 145) ? encrypted_data_buf[887 :880 ] :
    (byte_counter == 144) ? encrypted_data_buf[895 :888 ] :
    (byte_counter == 143) ? encrypted_data_buf[903 :896 ] :
    (byte_counter == 142) ? encrypted_data_buf[911 :904 ] :
    (byte_counter == 141) ? encrypted_data_buf[919 :912 ] :
    (byte_counter == 140) ? encrypted_data_buf[927 :920 ] :
    (byte_counter == 139) ? encrypted_data_buf[935 :928 ] :
    (byte_counter == 138) ? encrypted_data_buf[943 :936 ] :
    (byte_counter == 137) ? encrypted_data_buf[951 :944 ] :
    (byte_counter == 136) ? encrypted_data_buf[959 :952 ] :
    (byte_counter == 135) ? encrypted_data_buf[967 :960 ] :
    (byte_counter == 134) ? encrypted_data_buf[975 :968 ] :
    (byte_counter == 133) ? encrypted_data_buf[983 :976 ] :
    (byte_counter == 132) ? encrypted_data_buf[991 :984 ] :
    (byte_counter == 131) ? encrypted_data_buf[999 :992 ] :
    (byte_counter == 130) ? encrypted_data_buf[1007:1000] :
    (byte_counter == 129) ? encrypted_data_buf[1015:1008] :
    (byte_counter == 128) ? encrypted_data_buf[1023:1016] :
    (byte_counter == 127) ? encrypted_data_buf[1031:1024] :
    (byte_counter == 126) ? encrypted_data_buf[1039:1032] :
    (byte_counter == 125) ? encrypted_data_buf[1047:1040] :
    (byte_counter == 124) ? encrypted_data_buf[1055:1048] :
    (byte_counter == 123) ? encrypted_data_buf[1063:1056] :
    (byte_counter == 122) ? encrypted_data_buf[1071:1064] :
    (byte_counter == 121) ? encrypted_data_buf[1079:1072] :
    (byte_counter == 120) ? encrypted_data_buf[1087:1080] :
    (byte_counter == 119) ? encrypted_data_buf[1095:1088] :
    (byte_counter == 118) ? encrypted_data_buf[1103:1096] :
    (byte_counter == 117) ? encrypted_data_buf[1111:1104] :
    (byte_counter == 116) ? encrypted_data_buf[1119:1112] :
    (byte_counter == 115) ? encrypted_data_buf[1127:1120] :
    (byte_counter == 114) ? encrypted_data_buf[1135:1128] :
    (byte_counter == 113) ? encrypted_data_buf[1143:1136] :
    (byte_counter == 112) ? encrypted_data_buf[1151:1144] :
    (byte_counter == 111) ? encrypted_data_buf[1159:1152] :
    (byte_counter == 110) ? encrypted_data_buf[1167:1160] :
    (byte_counter == 109) ? encrypted_data_buf[1175:1168] :
    (byte_counter == 108) ? encrypted_data_buf[1183:1176] :
    (byte_counter == 107) ? encrypted_data_buf[1191:1184] :
    (byte_counter == 106) ? encrypted_data_buf[1199:1192] :
    (byte_counter == 105) ? encrypted_data_buf[1207:1200] :
    (byte_counter == 104) ? encrypted_data_buf[1215:1208] :
    (byte_counter == 103) ? encrypted_data_buf[1223:1216] :
    (byte_counter == 102) ? encrypted_data_buf[1231:1224] :
    (byte_counter == 101) ? encrypted_data_buf[1239:1232] :
    (byte_counter == 100) ? encrypted_data_buf[1247:1240] :
    (byte_counter == 99 ) ? encrypted_data_buf[1255:1248] :
    (byte_counter == 98 ) ? encrypted_data_buf[1263:1256] :
    (byte_counter == 97 ) ? encrypted_data_buf[1271:1264] :
    (byte_counter == 96 ) ? encrypted_data_buf[1279:1272] :
    (byte_counter == 95 ) ? encrypted_data_buf[1287:1280] :
    (byte_counter == 94 ) ? encrypted_data_buf[1295:1288] :
    (byte_counter == 93 ) ? encrypted_data_buf[1303:1296] :
    (byte_counter == 92 ) ? encrypted_data_buf[1311:1304] :
    (byte_counter == 91 ) ? encrypted_data_buf[1319:1312] :
    (byte_counter == 90 ) ? encrypted_data_buf[1327:1320] :
    (byte_counter == 89 ) ? encrypted_data_buf[1335:1328] :
    (byte_counter == 88 ) ? encrypted_data_buf[1343:1336] :
    (byte_counter == 87 ) ? encrypted_data_buf[1351:1344] :
    (byte_counter == 86 ) ? encrypted_data_buf[1359:1352] :
    (byte_counter == 85 ) ? encrypted_data_buf[1367:1360] :
    (byte_counter == 84 ) ? encrypted_data_buf[1375:1368] :
    (byte_counter == 83 ) ? encrypted_data_buf[1383:1376] :
    (byte_counter == 82 ) ? encrypted_data_buf[1391:1384] :
    (byte_counter == 81 ) ? encrypted_data_buf[1399:1392] :
    (byte_counter == 80 ) ? encrypted_data_buf[1407:1400] :
    (byte_counter == 79 ) ? encrypted_data_buf[1415:1408] :
    (byte_counter == 78 ) ? encrypted_data_buf[1423:1416] :
    (byte_counter == 77 ) ? encrypted_data_buf[1431:1424] :
    (byte_counter == 76 ) ? encrypted_data_buf[1439:1432] :
    (byte_counter == 75 ) ? encrypted_data_buf[1447:1440] :
    (byte_counter == 74 ) ? encrypted_data_buf[1455:1448] :
    (byte_counter == 73 ) ? encrypted_data_buf[1463:1456] :
    (byte_counter == 72 ) ? encrypted_data_buf[1471:1464] :
    (byte_counter == 71 ) ? encrypted_data_buf[1479:1472] :
    (byte_counter == 70 ) ? encrypted_data_buf[1487:1480] :
    (byte_counter == 69 ) ? encrypted_data_buf[1495:1488] :
    (byte_counter == 68 ) ? encrypted_data_buf[1503:1496] :
    (byte_counter == 67 ) ? encrypted_data_buf[1511:1504] :
    (byte_counter == 66 ) ? encrypted_data_buf[1519:1512] :
    (byte_counter == 65 ) ? encrypted_data_buf[1527:1520] :
    (byte_counter == 64 ) ? encrypted_data_buf[1535:1528] :
    (byte_counter == 63 ) ? encrypted_data_buf[1543:1536] :
    (byte_counter == 62 ) ? encrypted_data_buf[1551:1544] :
    (byte_counter == 61 ) ? encrypted_data_buf[1559:1552] :
    (byte_counter == 60 ) ? encrypted_data_buf[1567:1560] :
    (byte_counter == 59 ) ? encrypted_data_buf[1575:1568] :
    (byte_counter == 58 ) ? encrypted_data_buf[1583:1576] :
    (byte_counter == 57 ) ? encrypted_data_buf[1591:1584] :
    (byte_counter == 56 ) ? encrypted_data_buf[1599:1592] :
    (byte_counter == 55 ) ? encrypted_data_buf[1607:1600] :
    (byte_counter == 54 ) ? encrypted_data_buf[1615:1608] :
    (byte_counter == 53 ) ? encrypted_data_buf[1623:1616] :
    (byte_counter == 52 ) ? encrypted_data_buf[1631:1624] :
    (byte_counter == 51 ) ? encrypted_data_buf[1639:1632] :
    (byte_counter == 50 ) ? encrypted_data_buf[1647:1640] :
    (byte_counter == 49 ) ? encrypted_data_buf[1655:1648] :
    (byte_counter == 48 ) ? encrypted_data_buf[1663:1656] :
    (byte_counter == 47 ) ? encrypted_data_buf[1671:1664] :
    (byte_counter == 46 ) ? encrypted_data_buf[1679:1672] :
    (byte_counter == 45 ) ? encrypted_data_buf[1687:1680] :
    (byte_counter == 44 ) ? encrypted_data_buf[1695:1688] :
    (byte_counter == 43 ) ? encrypted_data_buf[1703:1696] :
    (byte_counter == 42 ) ? encrypted_data_buf[1711:1704] :
    (byte_counter == 41 ) ? encrypted_data_buf[1719:1712] :
    (byte_counter == 40 ) ? encrypted_data_buf[1727:1720] :
    (byte_counter == 39 ) ? encrypted_data_buf[1735:1728] :
    (byte_counter == 38 ) ? encrypted_data_buf[1743:1736] :
    (byte_counter == 37 ) ? encrypted_data_buf[1751:1744] :
    (byte_counter == 36 ) ? encrypted_data_buf[1759:1752] :
    (byte_counter == 35 ) ? encrypted_data_buf[1767:1760] :
    (byte_counter == 34 ) ? encrypted_data_buf[1775:1768] :
    (byte_counter == 33 ) ? encrypted_data_buf[1783:1776] :
    (byte_counter == 32 ) ? encrypted_data_buf[1791:1784] :
    (byte_counter == 31 ) ? encrypted_data_buf[1799:1792] :
    (byte_counter == 30 ) ? encrypted_data_buf[1807:1800] :
    (byte_counter == 29 ) ? encrypted_data_buf[1815:1808] :
    (byte_counter == 28 ) ? encrypted_data_buf[1823:1816] :
    (byte_counter == 27 ) ? encrypted_data_buf[1831:1824] :
    (byte_counter == 26 ) ? encrypted_data_buf[1839:1832] :
    (byte_counter == 25 ) ? encrypted_data_buf[1847:1840] :
    (byte_counter == 24 ) ? encrypted_data_buf[1855:1848] :
    (byte_counter == 23 ) ? encrypted_data_buf[1863:1856] :
    (byte_counter == 22 ) ? encrypted_data_buf[1871:1864] :
    (byte_counter == 21 ) ? encrypted_data_buf[1879:1872] :
    (byte_counter == 20 ) ? encrypted_data_buf[1887:1880] :
    (byte_counter == 19 ) ? encrypted_data_buf[1895:1888] :
    (byte_counter == 18 ) ? encrypted_data_buf[1903:1896] :
    (byte_counter == 17 ) ? encrypted_data_buf[1911:1904] :
    (byte_counter == 16 ) ? encrypted_data_buf[1919:1912] :
    (byte_counter == 15 ) ? encrypted_data_buf[1927:1920] :
    (byte_counter == 14 ) ? encrypted_data_buf[1935:1928] :
    (byte_counter == 13 ) ? encrypted_data_buf[1943:1936] :
    (byte_counter == 12 ) ? encrypted_data_buf[1951:1944] :
    (byte_counter == 11 ) ? encrypted_data_buf[1959:1952] :
    (byte_counter == 10 ) ? encrypted_data_buf[1967:1960] :
    (byte_counter == 9  ) ? encrypted_data_buf[1975:1968] :
    (byte_counter == 8  ) ? encrypted_data_buf[1983:1976] :
    (byte_counter == 7  ) ? encrypted_data_buf[1991:1984] :
    (byte_counter == 6  ) ? encrypted_data_buf[1999:1992] :
    (byte_counter == 5  ) ? encrypted_data_buf[2007:2000] :
    (byte_counter == 4  ) ? encrypted_data_buf[2015:2008] :
    (byte_counter == 3  ) ? encrypted_data_buf[2023:2016] :
    (byte_counter == 2  ) ? encrypted_data_buf[2031:2024] :
    (byte_counter == 1  ) ? encrypted_data_buf[2039:2032] :
    encrypted_data_buf[2047:2040];

/*
    (byte_counter == 0)   ? encrypted_data_buf[7   :0]    :
    (byte_counter == 1)   ? encrypted_data_buf[15  :8]    :
    (byte_counter == 2)   ? encrypted_data_buf[23  :16]   :
    (byte_counter == 3)   ? encrypted_data_buf[31  :24]   :
    (byte_counter == 4)   ? encrypted_data_buf[39  :32]   :
    (byte_counter == 5)   ? encrypted_data_buf[47  :40]   :
    (byte_counter == 6)   ? encrypted_data_buf[55  :48]   :
    (byte_counter == 7)   ? encrypted_data_buf[63  :56]   :
    (byte_counter == 8)   ? encrypted_data_buf[71  :64]   :
    (byte_counter == 9)   ? encrypted_data_buf[79  :72]   :
    (byte_counter == 10)  ? encrypted_data_buf[87  :80]   :
    (byte_counter == 11)  ? encrypted_data_buf[95  :88]   :
    (byte_counter == 12)  ? encrypted_data_buf[103 :96]   :
    (byte_counter == 13)  ? encrypted_data_buf[111 :104]  :
    (byte_counter == 14)  ? encrypted_data_buf[119 :112]  :
    (byte_counter == 15)  ? encrypted_data_buf[127 :120]  :
    (byte_counter == 16)  ? encrypted_data_buf[135 :128]  :
    (byte_counter == 17)  ? encrypted_data_buf[143 :136]  :
    (byte_counter == 18)  ? encrypted_data_buf[151 :144]  :
    (byte_counter == 19)  ? encrypted_data_buf[159 :152]  :
    (byte_counter == 20)  ? encrypted_data_buf[167 :160]  :
    (byte_counter == 21)  ? encrypted_data_buf[175 :168]  :
    (byte_counter == 22)  ? encrypted_data_buf[183 :176]  :
    (byte_counter == 23)  ? encrypted_data_buf[191 :184]  :
    (byte_counter == 24)  ? encrypted_data_buf[199 :192]  :
    (byte_counter == 25)  ? encrypted_data_buf[207 :200]  :
    (byte_counter == 26)  ? encrypted_data_buf[215 :208]  :
    (byte_counter == 27)  ? encrypted_data_buf[223 :216]  :
    (byte_counter == 28)  ? encrypted_data_buf[231 :224]  :
    (byte_counter == 29)  ? encrypted_data_buf[239 :232]  :
    (byte_counter == 30)  ? encrypted_data_buf[247 :240]  :
    (byte_counter == 31)  ? encrypted_data_buf[255 :248]  :
    (byte_counter == 32)  ? encrypted_data_buf[263 :256]  :
    (byte_counter == 33)  ? encrypted_data_buf[271 :264]  :
    (byte_counter == 34)  ? encrypted_data_buf[279 :272]  :
    (byte_counter == 35)  ? encrypted_data_buf[287 :280]  :
    (byte_counter == 36)  ? encrypted_data_buf[295 :288]  :
    (byte_counter == 37)  ? encrypted_data_buf[303 :296]  :
    (byte_counter == 38)  ? encrypted_data_buf[311 :304]  :
    (byte_counter == 39)  ? encrypted_data_buf[319 :312]  :
    (byte_counter == 40)  ? encrypted_data_buf[327 :320]  :
    (byte_counter == 41)  ? encrypted_data_buf[335 :328]  :
    (byte_counter == 42)  ? encrypted_data_buf[343 :336]  :
    (byte_counter == 43)  ? encrypted_data_buf[351 :344]  :
    (byte_counter == 44)  ? encrypted_data_buf[359 :352]  :
    (byte_counter == 45)  ? encrypted_data_buf[367 :360]  :
    (byte_counter == 46)  ? encrypted_data_buf[375 :368]  :
    (byte_counter == 47)  ? encrypted_data_buf[383 :376]  :
    (byte_counter == 48)  ? encrypted_data_buf[391 :384]  :
    (byte_counter == 49)  ? encrypted_data_buf[399 :392]  :
    (byte_counter == 50)  ? encrypted_data_buf[407 :400]  :
    (byte_counter == 51)  ? encrypted_data_buf[415 :408]  :
    (byte_counter == 52)  ? encrypted_data_buf[423 :416]  :
    (byte_counter == 53)  ? encrypted_data_buf[431 :424]  :
    (byte_counter == 54)  ? encrypted_data_buf[439 :432]  :
    (byte_counter == 55)  ? encrypted_data_buf[447 :440]  :
    (byte_counter == 56)  ? encrypted_data_buf[455 :448]  :
    (byte_counter == 57)  ? encrypted_data_buf[463 :456]  :
    (byte_counter == 58)  ? encrypted_data_buf[471 :464]  :
    (byte_counter == 59)  ? encrypted_data_buf[479 :472]  :
    (byte_counter == 60)  ? encrypted_data_buf[487 :480]  :
    (byte_counter == 61)  ? encrypted_data_buf[495 :488]  :
    (byte_counter == 62)  ? encrypted_data_buf[503 :496]  :
    (byte_counter == 63)  ? encrypted_data_buf[511 :504]  :
    (byte_counter == 64)  ? encrypted_data_buf[519 :512]  :
    (byte_counter == 65)  ? encrypted_data_buf[527 :520]  :
    (byte_counter == 66)  ? encrypted_data_buf[535 :528]  :
    (byte_counter == 67)  ? encrypted_data_buf[543 :536]  :
    (byte_counter == 68)  ? encrypted_data_buf[551 :544]  :
    (byte_counter == 69)  ? encrypted_data_buf[559 :552]  :
    (byte_counter == 70)  ? encrypted_data_buf[567 :560]  :
    (byte_counter == 71)  ? encrypted_data_buf[575 :568]  :
    (byte_counter == 72)  ? encrypted_data_buf[583 :576]  :
    (byte_counter == 73)  ? encrypted_data_buf[591 :584]  :
    (byte_counter == 74)  ? encrypted_data_buf[599 :592]  :
    (byte_counter == 75)  ? encrypted_data_buf[607 :600]  :
    (byte_counter == 76)  ? encrypted_data_buf[615 :608]  :
    (byte_counter == 77)  ? encrypted_data_buf[623 :616]  :
    (byte_counter == 78)  ? encrypted_data_buf[631 :624]  :
    (byte_counter == 79)  ? encrypted_data_buf[639 :632]  :
    (byte_counter == 80)  ? encrypted_data_buf[647 :640]  :
    (byte_counter == 81)  ? encrypted_data_buf[655 :648]  :
    (byte_counter == 82)  ? encrypted_data_buf[663 :656]  :
    (byte_counter == 83)  ? encrypted_data_buf[671 :664]  :
    (byte_counter == 84)  ? encrypted_data_buf[679 :672]  :
    (byte_counter == 85)  ? encrypted_data_buf[687 :680]  :
    (byte_counter == 86)  ? encrypted_data_buf[695 :688]  :
    (byte_counter == 87)  ? encrypted_data_buf[703 :696]  :
    (byte_counter == 88)  ? encrypted_data_buf[711 :704]  :
    (byte_counter == 89)  ? encrypted_data_buf[719 :712]  :
    (byte_counter == 90)  ? encrypted_data_buf[727 :720]  :
    (byte_counter == 91)  ? encrypted_data_buf[735 :728]  :
    (byte_counter == 92)  ? encrypted_data_buf[743 :736]  :
    (byte_counter == 93)  ? encrypted_data_buf[751 :744]  :
    (byte_counter == 94)  ? encrypted_data_buf[759 :752]  :
    (byte_counter == 95)  ? encrypted_data_buf[767 :760]  :
    (byte_counter == 96)  ? encrypted_data_buf[775 :768]  :
    (byte_counter == 97)  ? encrypted_data_buf[783 :776]  :
    (byte_counter == 98)  ? encrypted_data_buf[791 :784]  :
    (byte_counter == 99)  ? encrypted_data_buf[799 :792]  :
    (byte_counter == 100) ? encrypted_data_buf[807 :800]  :
    (byte_counter == 101) ? encrypted_data_buf[815 :808]  :
    (byte_counter == 102) ? encrypted_data_buf[823 :816]  :
    (byte_counter == 103) ? encrypted_data_buf[831 :824]  :
    (byte_counter == 104) ? encrypted_data_buf[839 :832]  :
    (byte_counter == 105) ? encrypted_data_buf[847 :840]  :
    (byte_counter == 106) ? encrypted_data_buf[855 :848]  :
    (byte_counter == 107) ? encrypted_data_buf[863 :856]  :
    (byte_counter == 108) ? encrypted_data_buf[871 :864]  :
    (byte_counter == 109) ? encrypted_data_buf[879 :872]  :
    (byte_counter == 110) ? encrypted_data_buf[887 :880]  :
    (byte_counter == 111) ? encrypted_data_buf[895 :888]  :
    (byte_counter == 112) ? encrypted_data_buf[903 :896]  :
    (byte_counter == 113) ? encrypted_data_buf[911 :904]  :
    (byte_counter == 114) ? encrypted_data_buf[919 :912]  :
    (byte_counter == 115) ? encrypted_data_buf[927 :920]  :
    (byte_counter == 116) ? encrypted_data_buf[935 :928]  :
    (byte_counter == 117) ? encrypted_data_buf[943 :936]  :
    (byte_counter == 118) ? encrypted_data_buf[951 :944]  :
    (byte_counter == 119) ? encrypted_data_buf[959 :952]  :
    (byte_counter == 120) ? encrypted_data_buf[967 :960]  :
    (byte_counter == 121) ? encrypted_data_buf[975 :968]  :
    (byte_counter == 122) ? encrypted_data_buf[983 :976]  :
    (byte_counter == 123) ? encrypted_data_buf[991 :984]  :
    (byte_counter == 124) ? encrypted_data_buf[999 :992]  :
    (byte_counter == 125) ? encrypted_data_buf[1007:1000] :
    (byte_counter == 126) ? encrypted_data_buf[1015:1008] :
    (byte_counter == 127) ? encrypted_data_buf[1023:1016] :
    (byte_counter == 128) ? encrypted_data_buf[1031:1024] :
    (byte_counter == 129) ? encrypted_data_buf[1039:1032] :
    (byte_counter == 130) ? encrypted_data_buf[1047:1040] :
    (byte_counter == 131) ? encrypted_data_buf[1055:1048] :
    (byte_counter == 132) ? encrypted_data_buf[1063:1056] :
    (byte_counter == 133) ? encrypted_data_buf[1071:1064] :
    (byte_counter == 134) ? encrypted_data_buf[1079:1072] :
    (byte_counter == 135) ? encrypted_data_buf[1087:1080] :
    (byte_counter == 136) ? encrypted_data_buf[1095:1088] :
    (byte_counter == 137) ? encrypted_data_buf[1103:1096] :
    (byte_counter == 138) ? encrypted_data_buf[1111:1104] :
    (byte_counter == 139) ? encrypted_data_buf[1119:1112] :
    (byte_counter == 140) ? encrypted_data_buf[1127:1120] :
    (byte_counter == 141) ? encrypted_data_buf[1135:1128] :
    (byte_counter == 142) ? encrypted_data_buf[1143:1136] :
    (byte_counter == 143) ? encrypted_data_buf[1151:1144] :
    (byte_counter == 144) ? encrypted_data_buf[1159:1152] :
    (byte_counter == 145) ? encrypted_data_buf[1167:1160] :
    (byte_counter == 146) ? encrypted_data_buf[1175:1168] :
    (byte_counter == 147) ? encrypted_data_buf[1183:1176] :
    (byte_counter == 148) ? encrypted_data_buf[1191:1184] :
    (byte_counter == 149) ? encrypted_data_buf[1199:1192] :
    (byte_counter == 150) ? encrypted_data_buf[1207:1200] :
    (byte_counter == 151) ? encrypted_data_buf[1215:1208] :
    (byte_counter == 152) ? encrypted_data_buf[1223:1216] :
    (byte_counter == 153) ? encrypted_data_buf[1231:1224] :
    (byte_counter == 154) ? encrypted_data_buf[1239:1232] :
    (byte_counter == 155) ? encrypted_data_buf[1247:1240] :
    (byte_counter == 156) ? encrypted_data_buf[1255:1248] :
    (byte_counter == 157) ? encrypted_data_buf[1263:1256] :
    (byte_counter == 158) ? encrypted_data_buf[1271:1264] :
    (byte_counter == 159) ? encrypted_data_buf[1279:1272] :
    (byte_counter == 160) ? encrypted_data_buf[1287:1280] :
    (byte_counter == 161) ? encrypted_data_buf[1295:1288] :
    (byte_counter == 162) ? encrypted_data_buf[1303:1296] :
    (byte_counter == 163) ? encrypted_data_buf[1311:1304] :
    (byte_counter == 164) ? encrypted_data_buf[1319:1312] :
    (byte_counter == 165) ? encrypted_data_buf[1327:1320] :
    (byte_counter == 166) ? encrypted_data_buf[1335:1328] :
    (byte_counter == 167) ? encrypted_data_buf[1343:1336] :
    (byte_counter == 168) ? encrypted_data_buf[1351:1344] :
    (byte_counter == 169) ? encrypted_data_buf[1359:1352] :
    (byte_counter == 170) ? encrypted_data_buf[1367:1360] :
    (byte_counter == 171) ? encrypted_data_buf[1375:1368] :
    (byte_counter == 172) ? encrypted_data_buf[1383:1376] :
    (byte_counter == 173) ? encrypted_data_buf[1391:1384] :
    (byte_counter == 174) ? encrypted_data_buf[1399:1392] :
    (byte_counter == 175) ? encrypted_data_buf[1407:1400] :
    (byte_counter == 176) ? encrypted_data_buf[1415:1408] :
    (byte_counter == 177) ? encrypted_data_buf[1423:1416] :
    (byte_counter == 178) ? encrypted_data_buf[1431:1424] :
    (byte_counter == 179) ? encrypted_data_buf[1439:1432] :
    (byte_counter == 180) ? encrypted_data_buf[1447:1440] :
    (byte_counter == 181) ? encrypted_data_buf[1455:1448] :
    (byte_counter == 182) ? encrypted_data_buf[1463:1456] :
    (byte_counter == 183) ? encrypted_data_buf[1471:1464] :
    (byte_counter == 184) ? encrypted_data_buf[1479:1472] :
    (byte_counter == 185) ? encrypted_data_buf[1487:1480] :
    (byte_counter == 186) ? encrypted_data_buf[1495:1488] :
    (byte_counter == 187) ? encrypted_data_buf[1503:1496] :
    (byte_counter == 188) ? encrypted_data_buf[1511:1504] :
    (byte_counter == 189) ? encrypted_data_buf[1519:1512] :
    (byte_counter == 190) ? encrypted_data_buf[1527:1520] :
    (byte_counter == 191) ? encrypted_data_buf[1535:1528] :
    (byte_counter == 192) ? encrypted_data_buf[1543:1536] :
    (byte_counter == 193) ? encrypted_data_buf[1551:1544] :
    (byte_counter == 194) ? encrypted_data_buf[1559:1552] :
    (byte_counter == 195) ? encrypted_data_buf[1567:1560] :
    (byte_counter == 196) ? encrypted_data_buf[1575:1568] :
    (byte_counter == 197) ? encrypted_data_buf[1583:1576] :
    (byte_counter == 198) ? encrypted_data_buf[1591:1584] :
    (byte_counter == 199) ? encrypted_data_buf[1599:1592] :
    (byte_counter == 200) ? encrypted_data_buf[1607:1600] :
    (byte_counter == 201) ? encrypted_data_buf[1615:1608] :
    (byte_counter == 202) ? encrypted_data_buf[1623:1616] :
    (byte_counter == 203) ? encrypted_data_buf[1631:1624] :
    (byte_counter == 204) ? encrypted_data_buf[1639:1632] :
    (byte_counter == 205) ? encrypted_data_buf[1647:1640] :
    (byte_counter == 206) ? encrypted_data_buf[1655:1648] :
    (byte_counter == 207) ? encrypted_data_buf[1663:1656] :
    (byte_counter == 208) ? encrypted_data_buf[1671:1664] :
    (byte_counter == 209) ? encrypted_data_buf[1679:1672] :
    (byte_counter == 210) ? encrypted_data_buf[1687:1680] :
    (byte_counter == 211) ? encrypted_data_buf[1695:1688] :
    (byte_counter == 212) ? encrypted_data_buf[1703:1696] :
    (byte_counter == 213) ? encrypted_data_buf[1711:1704] :
    (byte_counter == 214) ? encrypted_data_buf[1719:1712] :
    (byte_counter == 215) ? encrypted_data_buf[1727:1720] :
    (byte_counter == 216) ? encrypted_data_buf[1735:1728] :
    (byte_counter == 217) ? encrypted_data_buf[1743:1736] :
    (byte_counter == 218) ? encrypted_data_buf[1751:1744] :
    (byte_counter == 219) ? encrypted_data_buf[1759:1752] :
    (byte_counter == 220) ? encrypted_data_buf[1767:1760] :
    (byte_counter == 221) ? encrypted_data_buf[1775:1768] :
    (byte_counter == 222) ? encrypted_data_buf[1783:1776] :
    (byte_counter == 223) ? encrypted_data_buf[1791:1784] :
    (byte_counter == 224) ? encrypted_data_buf[1799:1792] :
    (byte_counter == 225) ? encrypted_data_buf[1807:1800] :
    (byte_counter == 226) ? encrypted_data_buf[1815:1808] :
    (byte_counter == 227) ? encrypted_data_buf[1823:1816] :
    (byte_counter == 228) ? encrypted_data_buf[1831:1824] :
    (byte_counter == 229) ? encrypted_data_buf[1839:1832] :
    (byte_counter == 230) ? encrypted_data_buf[1847:1840] :
    (byte_counter == 231) ? encrypted_data_buf[1855:1848] :
    (byte_counter == 232) ? encrypted_data_buf[1863:1856] :
    (byte_counter == 233) ? encrypted_data_buf[1871:1864] :
    (byte_counter == 234) ? encrypted_data_buf[1879:1872] :
    (byte_counter == 235) ? encrypted_data_buf[1887:1880] :
    (byte_counter == 236) ? encrypted_data_buf[1895:1888] :
    (byte_counter == 237) ? encrypted_data_buf[1903:1896] :
    (byte_counter == 238) ? encrypted_data_buf[1911:1904] :
    (byte_counter == 239) ? encrypted_data_buf[1919:1912] :
    (byte_counter == 240) ? encrypted_data_buf[1927:1920] :
    (byte_counter == 241) ? encrypted_data_buf[1935:1928] :
    (byte_counter == 242) ? encrypted_data_buf[1943:1936] :
    (byte_counter == 243) ? encrypted_data_buf[1951:1944] :
    (byte_counter == 244) ? encrypted_data_buf[1959:1952] :
    (byte_counter == 245) ? encrypted_data_buf[1967:1960] :
    (byte_counter == 246) ? encrypted_data_buf[1975:1968] :
    (byte_counter == 247) ? encrypted_data_buf[1983:1976] :
    (byte_counter == 248) ? encrypted_data_buf[1991:1984] :
    (byte_counter == 249) ? encrypted_data_buf[1999:1992] :
    (byte_counter == 250) ? encrypted_data_buf[2007:2000] :
    (byte_counter == 251) ? encrypted_data_buf[2015:2008] :
    (byte_counter == 252) ? encrypted_data_buf[2023:2016] :
    (byte_counter == 253) ? encrypted_data_buf[2031:2024] :
    (byte_counter == 254) ? encrypted_data_buf[2039:2032] :
    encrypted_data_buf[2047:2040];
*/
always @(posedge clk or posedge rst)
begin
    if (rst) begin
        exp_reg_state        <= EXP_STATE_IDLE;
        byte_counter         <= 0;
    end
    else begin
        exp_reg_state        <= exp_reg_state_next;
        byte_counter         <= byte_counter_next;
        encrypted_data_buf   <= encrypted_data_buf_next;
    end
end

endmodule

/* verilator coverage_on */
