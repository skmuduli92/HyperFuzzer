mkdir ~/tmp/aes_regtest
cp \
../src/aes_top.v \
../src/aes_128.v \
../src/aes_round.v \
../src/aes_table.v \
../src/reg16byte.v \
../src/reg2byte.v \
../src/sha_top.v \
../src/sha1_core.v \
../src/sha1_w_mem.v \
../src/oc8051_xiommu.v \
../src/oc8051_xram.v \
../src/oc8051_memarbiter.v \
aes_regtest.c \
aes_regtest.h \
aes_regtest.sh \
~/tmp/aes_regtest/
