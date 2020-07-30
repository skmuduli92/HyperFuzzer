#! /usr/bin/python2.7

import sys
import os

from gen_rom import read_in, read_hex

def dump_rom(data):
    N = len(data);
    print '  reg [7:0] rombuf[%d:0];' % (N-1)
    print '  always @(posedge clk) begin'
    print '    if(rst) begin'
    for i, b in enumerate(data):
        print '      rombuf[%d] = 8\'h%x;' % (i, b)
    print '    end'
    print '  end'
    print '  wire [15:0] addr0 = addr;'
    print '  wire [15:0] addr1 = addr+1;'
    print '  wire [15:0] addr2 = addr+2;'
    print '  wire [15:0] addr3 = addr+3;'
    print '  wire [7:0] data_o0 = (addr0 < %d) ? rombuf[addr0] : 8\'h0;' % N
    print '  wire [7:0] data_o1 = (addr1 < %d) ? rombuf[addr1] : 8\'h0;' % N
    print '  wire [7:0] data_o2 = (addr2 < %d) ? rombuf[addr2] : 8\'h0;' % N
    print '  wire [7:0] data_o3 = (addr3 < %d) ? rombuf[addr3] : 8\'h0;' % N
    print '  wire [31:0] data_out = {data_o3, data_o2, data_o1, data_o0};';

def main(argv):
    if len(argv) != 2:
        print 'Syntax error. '
        print 'Usage: %s <hex-or-in-file>' % argv[0]
    else:
        filename = argv[1]
        if filename.endswith('.hex') or filename.endswith('.ihx'):
            print '  // Interpreting %s as an Intel formal HEX file.' % os.path.basename(filename)
            data = read_hex(filename)
        elif filename.endswith('.in'):
            print '  // Interpreting %s as a .in file.' % os.path.basename(filename)
            data = read_in(filename)
        dump_rom(data)

if __name__ == '__main__':
    main(sys.argv)

