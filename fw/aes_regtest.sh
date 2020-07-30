cd ../src
hw-cbmc --16 aes_top.v aes_128.v aes_round.v aes_table.v reg16byte.v reg2byte.v sha_top.v sha1_core.v sha1_w_mem.v oc8051_xiommu.v oc8051_xram.v oc8051_memarbiter.v ../asm/aes_regtest.c --module oc8051_xiommu --bound 24

