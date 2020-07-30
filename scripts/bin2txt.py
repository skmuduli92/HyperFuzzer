#! /usr/bin/python3

# This is a script for reading in a binary file
# and spitting it out as text.

import struct
import argparse

def rewrite(fin, fmt):
    sz = struct.calcsize(fmt)
    while True:
        raw_data = fin.read(sz)
        if len(raw_data) < sz:
            break
        proc_data = struct.unpack(fmt, raw_data)
        string = ' '.join('%x' % item for item in proc_data)
        print (string)

def main():
    parser = argparse.ArgumentParser('txt2bin')
    parser.add_argument('fin', metavar='file', help='Input text file.', type=argparse.FileType('rb'))
    parser.add_argument('format', metavar='fmt', help='Record format.', type=str)
    args = parser.parse_args()

    rewrite(args.fin, args.format)

if __name__ == '__main__':
    main()
