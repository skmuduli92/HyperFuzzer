#! /usr/bin/python2.7

import itertools
import sys
import os

from gen_rom import read_hex, read_in

def compare_directories(dhex, din):
    hex_files = [p for p in os.listdir(dhex) if p.endswith('.hex')]
    in_files = [p for p in os.listdir(din) if p.endswith('.in')]

    hex_files.sort()

    for hexfile in hex_files:
        if hexfile == 'interrupt_test.hex' or hexfile == 'r_bank.hex':
            continue

        infile = hexfile.replace('.hex', '.in')
        assert infile in in_files
        hex_data = read_hex(os.path.join(dhex, hexfile))
        in_data = read_in(os.path.join(din, infile))
        name = hexfile.replace('.hex', '')

        if hex_data == in_data:
            print '%-20s [passed]' % name
        else:
            print '%-20s [FAILED]' % name
            if len(hex_data) == len(in_data):
                for i,x,y in itertools.izip(xrange(len(hex_data)),hex_data,in_data):
                    if x != y:
                        print 'ADDR:%04X %02X != %02X' % (i,x,y)
                        break
            else:
                print len(hex_data), len(in_data)



def main(argv):
    if len(argv) != 3:
        print 'Syntax error.'
        print 'Usage: %s <hex-file-dir> <in-file-dir>' % argv[0]
    else:
        compare_directories(argv[1], argv[2])
if __name__ == '__main__':
    main(sys.argv)
