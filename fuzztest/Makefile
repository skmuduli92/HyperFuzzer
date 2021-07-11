DEBUG?=0
INCLUDES=-I../verilator/include/ -I../fuzzer -I./libprop/include
SHARED_OBJECTS=secureboot.o coverage.o tamper.o Voc8051_tb__ALL.a afl.o verilated_cov.o verilated.o ./libprop/build/lib/liblibprop.a
DEBUG_COVERAGE?=0

ifeq ($(DEBUG_COVERAGE), 1)
    DEFINES:=-DDEBUG_COVERAGE
else
    DEFINES:=
endif

ifeq ($(MUX_COV_ENABLED), 1)
   DEFINES+=-DMUX_COV_ENABLED
endif

ifeq ($(DEBUG), 1)
    CXXFLAGS:=-g -O0 -std=c++17 $(DEFINES)
    LDFLAGS=-O0 -g
else
    CXXFLAGS:=-O3 -std=c++17 $(DEFINES)
    LDFLAGS=-O2
endif

all: bootloader bootfuzzer aes_test sha_test aes_test_ecc_unsafe aes_test_ecc_safe

aes_test_ecc_unsafe: aes_test_ecc_unsafe.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

aes_test_ecc_safe: aes_test_ecc_safe.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

sha_test: sha_test.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

aes_test: aes_test.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

bootfuzzer: bootfuzzer.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

bootloader: bootloader.o $(SHARED_OBJECTS)
	g++ -o $@ $(LDFLAGS) $^

aes_test_ecc_unsafe.o: aes_test_ecc_unsafe.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

aes_test_ecc_safe.o: aes_test_ecc_safe.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

sha_test.o: sha_test.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

aes_test.o: aes_test.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

bootfuzzer.o: bootfuzzer.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

bootloader.o: bootloader.cpp secureboot.h coverage.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

secureboot.o: secureboot.cpp coverage.h afl.h Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

coverage.o: coverage.cpp coverage.h
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

tamper.o: tamper.cpp tamper.h  Voc8051_tb__ALL.a
	g++ -c $(CXXFLAGS) $(INCLUDES) $<

afl.o : afl.c
	g++ -c $(CXXFLAGS) afl.c $(INCLUDES)

verilated.o : ../verilator/include/verilated.cpp
	g++ -c $(CXXFLAGS) ../verilator/include/verilated.cpp $(INCLUDES)

verilated_cov.o : ../verilator/include/verilated_cov.cpp
	g++ -c $(CXXFLAGS) ../verilator/include/verilated_cov.cpp $(INCLUDES)

Voc8051_tb__ALL.a: Voc8051_tb.mk
	make -f Voc8051_tb.mk OPT="-O1"

RTL_DIR:=../rtl
Voc8051_tb.mk: ../rtl/*.v
	../verilator/bin/verilator --cc -Mdir . -O1 --x-assign fast --x-initial fast --noassert --coverage-toggle \
	-I${RTL_DIR}			\
	-Wno-UNOPTFLAT -Wno-CASEINCOMPLETE -Wno-CASEX -Wno-WIDTH -Wno-PINMISSING   -Wno-STMTDLY -Wno-IMPLICIT -Wno-LITENDIAN -Wno-INITIALDLY -Wno-MODDUP \
	${RTL_DIR}/oc8051_tb.v                     \
	${RTL_DIR}/oc8051_top.v                    \
	${RTL_DIR}/oc8051_xram.v                   \
	${RTL_DIR}/oc8051_alu_src_sel.v            \
	${RTL_DIR}/oc8051_alu.v                    \
	${RTL_DIR}/oc8051_decoder.v                \
	${RTL_DIR}/oc8051_divide.v                 \
	${RTL_DIR}/oc8051_multiply.v               \
	${RTL_DIR}/oc8051_memory_interface.v       \
	${RTL_DIR}/oc8051_ram_top.v                \
	${RTL_DIR}/oc8051_acc.v                    \
	${RTL_DIR}/oc8051_comp.v                   \
	${RTL_DIR}/oc8051_sp.v                     \
	${RTL_DIR}/oc8051_dptr.v                   \
	${RTL_DIR}/oc8051_cy_select.v              \
	${RTL_DIR}/oc8051_psw.v                    \
	${RTL_DIR}/oc8051_indi_addr.v              \
	${RTL_DIR}/oc8051_ports.v                  \
	${RTL_DIR}/oc8051_b_register.v             \
	${RTL_DIR}/oc8051_uart.v                   \
	${RTL_DIR}/oc8051_int.v                    \
	${RTL_DIR}/oc8051_tc.v                     \
	${RTL_DIR}/oc8051_tc2.v                    \
	${RTL_DIR}/oc8051_icache.v                 \
	${RTL_DIR}/oc8051_wb_iinterface.v          \
	${RTL_DIR}/oc8051_sfr.v                    \
	${RTL_DIR}/oc8051_cxrom.v                  \
	${RTL_DIR}/oc8051_symbolic_cxrom.v         \
	${RTL_DIR}/oc8051_rom.v                    \
	${RTL_DIR}/oc8051_cache_ram.v              \
	${RTL_DIR}/oc8051_ram_256x8_two_bist.v     \
	${RTL_DIR}/oc8051_ram_64x32_dual_bist.v    \
	${RTL_DIR}/oc8051_etr.v                    \
	${RTL_DIR}/oc8051_priv_lvl.v               \
	${RTL_DIR}/oc8051_page_table.v             \
	${RTL_DIR}/aes_128.v                       \
	${RTL_DIR}/aes_round.v                     \
	${RTL_DIR}/aes_table.v                     \
	${RTL_DIR}/reg2byte.v                      \
	${RTL_DIR}/reg16byte.v                     \
	${RTL_DIR}/reg256byte.v                    \
	${RTL_DIR}/aes_top.v                       \
	${RTL_DIR}/oc8051_procarbiter.v            \
	${RTL_DIR}/oc8051_memarbiter.v             \
	${RTL_DIR}/oc8051_xiommu.v                 \
	${RTL_DIR}/sha1_core.v                     \
	${RTL_DIR}/sha1_w_mem.v                    \
	${RTL_DIR}/sha_top.v                       \
	${RTL_DIR}/modmul.v                        \
	${RTL_DIR}/modexp.v                        \
	${RTL_DIR}/modexp_top.v                    \
	${RTL_DIR}/oc8051_ecc_enc.sv               \
	${RTL_DIR}/oc8051_ecc_dec.sv               \
	${RTL_DIR}/mem_wr.v   --top-module oc8051_tb

oc8051: ${RTL_DIR}/*.v
	iverilog -o oc8051					       \
	-I ${RTL_DIR}							   \
	-Wno-timescale							   \
	-D OC8051_SIMULATION					   \
	${RTL_DIR}/oc8051_tb.v                     \
	${RTL_DIR}/oc8051_top.v                    \
	${RTL_DIR}/oc8051_xram.v                   \
	${RTL_DIR}/oc8051_alu_src_sel.v            \
	${RTL_DIR}/oc8051_alu.v                    \
	${RTL_DIR}/oc8051_decoder.v                \
	${RTL_DIR}/oc8051_divide.v                 \
	${RTL_DIR}/oc8051_multiply.v               \
	${RTL_DIR}/oc8051_memory_interface.v       \
	${RTL_DIR}/oc8051_ram_top.v                \
	${RTL_DIR}/oc8051_acc.v                    \
	${RTL_DIR}/oc8051_comp.v                   \
	${RTL_DIR}/oc8051_sp.v                     \
	${RTL_DIR}/oc8051_dptr.v                   \
	${RTL_DIR}/oc8051_cy_select.v              \
	${RTL_DIR}/oc8051_psw.v                    \
	${RTL_DIR}/oc8051_indi_addr.v              \
	${RTL_DIR}/oc8051_ports.v                  \
	${RTL_DIR}/oc8051_b_register.v             \
	${RTL_DIR}/oc8051_uart.v                   \
	${RTL_DIR}/oc8051_uart_test.v              \
	${RTL_DIR}/oc8051_int.v                    \
	${RTL_DIR}/oc8051_tc.v                     \
	${RTL_DIR}/oc8051_tc2.v                    \
	${RTL_DIR}/oc8051_icache.v                 \
	${RTL_DIR}/oc8051_wb_iinterface.v          \
	${RTL_DIR}/oc8051_sfr.v                    \
	${RTL_DIR}/oc8051_symbolic_cxrom.v         \
	${RTL_DIR}/oc8051_cxrom.v                  \
	${RTL_DIR}/oc8051_rom.v                    \
	${RTL_DIR}/oc8051_cache_ram.v              \
	${RTL_DIR}/oc8051_ram_256x8_two_bist.v     \
	${RTL_DIR}/oc8051_ram_64x32_dual_bist.v    \
	${RTL_DIR}/oc8051_etr.v                    \
	${RTL_DIR}/oc8051_priv_lvl.v               \
	${RTL_DIR}/oc8051_page_table.v             \
	${RTL_DIR}/aes_128.v                       \
	${RTL_DIR}/aes_round.v                     \
	${RTL_DIR}/aes_table.v                     \
	${RTL_DIR}/reg2byte.v                      \
	${RTL_DIR}/reg16byte.v                     \
	${RTL_DIR}/reg256byte.v                    \
	${RTL_DIR}/aes_top.v                       \
	${RTL_DIR}/oc8051_procarbiter.v            \
	${RTL_DIR}/oc8051_memarbiter.v             \
	${RTL_DIR}/oc8051_xiommu.v                 \
	${RTL_DIR}/sha1_core.v                     \
	${RTL_DIR}/sha1_w_mem.v                    \
	${RTL_DIR}/sha_top.v                       \
	${RTL_DIR}/modmul.v                        \
	${RTL_DIR}/modexp.v                        \
	${RTL_DIR}/modexp_top.v                    \
	${RTL_DIR}/oc8051_ecc_enc.sv               \
	${RTL_DIR}/oc8051_ecc_dec.sv               \
	${RTL_DIR}/mem_wr.v   -s oc8051_tb

.PHONY: clean

clean:
	rm -f bootloader bootfuzzer Voc8051_*
	rm -f *.o
