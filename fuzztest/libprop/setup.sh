#!/bin/bash

# get google-test framework and boost libraries
sudo apt-get install googletest libpthread-workqueue0 libboost-all-dev

# building and installing google-test library
cd /usr/src/googletest
sudo cmake .
sudo make
sudo make install

