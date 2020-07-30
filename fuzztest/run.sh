#! /bin/bash
if [[ $# -ne 2 ]]; then
    echo 'Syntax error.'
else 
    echo make && afl-fuzz -i afl-in/$1 -o afl-out/$1 -t $2 -- ./$1
fi

