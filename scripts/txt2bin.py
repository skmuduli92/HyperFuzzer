#! /usr/bin/python3

# This is a script for reading in a text file
# and writing it out in binary.

import struct
import argparse

def rewrite(fin, fout):
    for line in fin.read().split('\n'):
        # ignore empty lines.
        if len(line.strip()) == 0:
            continue
        # else we expect two words a line.
        words = line.split()
        assert len(words) == 2, words
        bs = struct.pack(words[1], int(words[0], 0))
        fout.write(bs)

def main():
    parser = argparse.ArgumentParser('txt2bin')
    parser.add_argument('fin', metavar='file', help='Input text file.', type=argparse.FileType('rt'))
    parser.add_argument('fout', metavar='file', help='Output binary file.', type=argparse.FileType('wb'))
    args = parser.parse_args()

    rewrite(args.fin, args.fout)

if __name__ == '__main__':
    main()
