#! /usr/bin/python2.7
import sys
import os

def read_in(filename):
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line = line.strip()
            comment_start = line.find('//')
            if comment_start != -1:
                line = line[:comment_start].strip()
            if len(line) == 0:
                continue
            words = line.split()
            assert len(words) == 1
            byte = int(words[0], 16)
            data.append(byte)
    return data

def read_hex(filename):
    data_dict = {}
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line = line.strip()
            if len(line) == 0:
                continue
            if line[0] != ':':
                print filename, line
            assert line[0] == ':'
            line = line[1:]
            length_str = line[:2]
            addr_str = line[2:6]
            type_str = line[6:8]
            data_str = line[8:-2]

            data_length = int(length_str, 16)
            start_addr = int(addr_str, 16)
            record_type = int(type_str, 16)

            #print data_str
            #print 2*data_length, len(data_str)
            assert 2*data_length == len(data_str)
            data_bytes = [int(data_str[i:i+2], 16) for i in xrange(0,2*data_length,2)]
            #print data_bytes
            assert len(data_bytes) == data_length

            if record_type == 0:
                for i, addr in enumerate(xrange(start_addr, start_addr+data_length)):
                    data_dict[addr] = data_bytes[i]

        data = [-1] * (max(data_dict.keys())+1)
        for addr in data_dict:
            data_value = data_dict[addr]
            assert data[addr] == -1
            data[addr] = data_value
        for i in xrange(len(data)):
            if data[i] == -1:
                data[i] = 0

    return data

def dump_assigns(data):
    N = len(data)
    print '  wire [7:0] buff [%d:0];' % (N-1)
    for i,b in enumerate(data):
        print '  assign buff[%d] = 8\'h%x;' % (i, b)
    print '  wire [15:0] addr0 = addr;'
    print '  wire [15:0] addr1 = addr+1;'
    print '  wire [15:0] addr2 = addr+2;'
    print '  wire [15:0] addr3 = addr+3;'
    print '  wire [7:0] data_o0 = (addr0 < %d) ? buff[addr0] : 8\'hxx;' % N
    print '  wire [7:0] data_o1 = (addr1 < %d) ? buff[addr1] : 8\'hxx;' % N
    print '  wire [7:0] data_o2 = (addr2 < %d) ? buff[addr2] : 8\'hxx;' % N
    print '  wire [7:0] data_o3 = (addr3 < %d) ? buff[addr3] : 8\'hxx;' % N
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
        dump_assigns(data)

if __name__ == '__main__':
    main(sys.argv)

#data_hex = read_hex(sys.argv[1])
#data_in = read_in(sys.argv[2])
#assert len(data_hex) == len(data_in)
#assert data_hex == data_in
#dump_assigns(data_hex)
#data = read_in(sys.argv[1])
#dump_assigns(data)
