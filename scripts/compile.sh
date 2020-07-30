#! /bin/bash

if [[ $# -ne 1 ]]; then
    echo "Syntax error."
    exit
else
    cd fw
    sdcc $1.c
    cd ..
    python3 scripts/gen_text.py fw/$1.ihx rom/$1.dat
fi
