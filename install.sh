cd verilator
export VERILATOR_ROOT=`pwd`
autoconf
./configure
make -j8
cd ../fuzztest
make
