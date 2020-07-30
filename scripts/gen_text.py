#! /usr/bin/python3

import sys
import argparse

if sys.version_info.major < 3:
    raise RuntimeError("Script requires Python v3 or later.")

def read_hex(filename):
    data_dict = {}
    data = []
    with open(filename, 'rt') as fileobject:
        for line in fileobject:
            line = line.strip()
            if len(line) == 0:
                continue
            #if line[0] != ':':
            #    print (filename, line)
            assert line[0] == ':'
            line = line[1:]
            length_str = line[:2]
            addr_str = line[2:6]
            type_str = line[6:8]
            data_str = line[8:-2]

            data_length = int(length_str, 16)
            start_addr = int(addr_str, 16)
            record_type = int(type_str, 16)

            #print (data_str)
            #print (2*data_length, len(data_str))
            assert 2*data_length == len(data_str)
            data_bytes = [int(data_str[i:i+2], 16) for i in range(0,2*data_length,2)]
            #print (data_bytes)
            assert len(data_bytes) == data_length

            if record_type == 0:
                for i, addr in enumerate(range(start_addr, start_addr+data_length)):
                    data_dict[addr] = data_bytes[i]

        data = [-1] * (max(data_dict.keys())+1)
        for addr in data_dict:
            data_value = data_dict[addr]
            assert data[addr] == -1
            data[addr] = data_value
        for i in range(len(data)):
            if data[i] == -1:
                data[i] = 0

    return data

def write_text(data, filename):
    with open(filename, 'wt') as f:
        print ('%d' % len(data), file=f)
        for i,b in enumerate(data):
            print ('%d %d' % (i, b), file=f)

def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('hexfile', type=str, help='input file in the hex format.')
    parser.add_argument('dumpfile', type=str, help='output file in the text format.')
    args = parser.parse_args()

    data = read_hex(args.hexfile)
    write_text(data, args.dumpfile)

if __name__ == '__main__':
    main()
