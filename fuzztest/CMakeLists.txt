cmake_minimum_required(VERSION 3.10)
project(FuzzTest LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)

# setting binary and library output directory
set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

set(VERILATOR_ROOT "../verilator")

find_package(verilator HINTS ${VERILATOR_ROOT})
if (NOT verilator_FOUND)
  message(FATAL_ERROR "Verilator was not found. Either install it, or set the VERILATOR_ROOT environment variable")
endif()

set(OPENSSL_USE_STATIC_LIBS TRUE)
find_package(OpenSSL REQUIRED)
find_package(Threads REQUIRED)

set(RTL_DIR "../rtl")
file(GLOB RTL_SRC "${RTL_DIR}/*.v")

set(ROM_DIR "../rom")
file(COPY ${ROM_DIR} DESTINATION ${CMAKE_BINARY_DIR})

include_directories(libprop/include)
add_subdirectory(libprop)


# Create a new executable target that will contain all your sources
set_source_files_properties(afl.c PROPERTIES LANGUAGE CXX)

# coverage metric feature
option(ENABLE_MUX_COVERAGE "Verilator --coverage-toggle" OFF)

if(ENABLE_MUX_COVERAGE)
  message(STATUS "MUX COVERAGE : ON")
  add_definitions(-DMUX_COV_ENABLED)
else()
  message(STATUS "MUX COVERAGE : OFF")
endif()


# Add the Verilated circuit to the target
file(GLOB RTL_SRC
  ${RTL_DIR}/oc8051_tb.v
  ${RTL_DIR}/oc8051_top.v
  ${RTL_DIR}/oc8051_xram.v
  ${RTL_DIR}/oc8051_alu_src_sel.v
  ${RTL_DIR}/oc8051_alu.v
  ${RTL_DIR}/oc8051_decoder.v
  ${RTL_DIR}/oc8051_divide.v
  ${RTL_DIR}/oc8051_multiply.v
  ${RTL_DIR}/oc8051_memory_interface.v
  ${RTL_DIR}/oc8051_ram_top.v
  ${RTL_DIR}/oc8051_acc.v
  ${RTL_DIR}/oc8051_comp.v
  ${RTL_DIR}/oc8051_sp.v
  ${RTL_DIR}/oc8051_dptr.v
  ${RTL_DIR}/oc8051_cy_select.v
  ${RTL_DIR}/oc8051_psw.v
  ${RTL_DIR}/oc8051_indi_addr.v
  ${RTL_DIR}/oc8051_ports.v
  ${RTL_DIR}/oc8051_b_register.v
  ${RTL_DIR}/oc8051_uart.v
  ${RTL_DIR}/oc8051_int.v
  ${RTL_DIR}/oc8051_tc.v
  ${RTL_DIR}/oc8051_tc2.v
  ${RTL_DIR}/oc8051_icache.v
  ${RTL_DIR}/oc8051_wb_iinterface.v
  ${RTL_DIR}/oc8051_sfr.v
  ${RTL_DIR}/oc8051_cxrom.v
  ${RTL_DIR}/oc8051_symbolic_cxrom.v
  ${RTL_DIR}/oc8051_rom.v
  ${RTL_DIR}/oc8051_cache_ram.v
  ${RTL_DIR}/oc8051_ram_256x8_two_bist.v
  ${RTL_DIR}/oc8051_ram_64x32_dual_bist.v
  ${RTL_DIR}/oc8051_etr.v
  ${RTL_DIR}/oc8051_priv_lvl.v
  ${RTL_DIR}/oc8051_page_table.v
  ${RTL_DIR}/aes_128.v
  ${RTL_DIR}/aes_round.v
  ${RTL_DIR}/aes_table.v
  ${RTL_DIR}/reg2byte.v
  ${RTL_DIR}/reg16byte.v
  ${RTL_DIR}/reg256byte.v
  ${RTL_DIR}/aes_top.v
  ${RTL_DIR}/oc8051_procarbiter.v
  ${RTL_DIR}/oc8051_memarbiter.v
  ${RTL_DIR}/oc8051_xiommu.v
  ${RTL_DIR}/sha1_core.v
  ${RTL_DIR}/sha1_w_mem.v
  ${RTL_DIR}/sha_top.v
  ${RTL_DIR}/modmul.v
  ${RTL_DIR}/modexp.v
  ${RTL_DIR}/modexp_top.v
  ${RTL_DIR}/oc8051_ecc_enc.sv
  ${RTL_DIR}/oc8051_ecc_dec.sv
  ${RTL_DIR}/mem_wr.v
  )



add_library(verilatorsim STATIC)

verilate(verilatorsim
  VERILATOR_ARGS -Wno-UNOPTFLAT -Wno-CASEINCOMPLETE -Wno-CASEX -Wno-WIDTH -Wno-PINMISSING   -Wno-STMTDLY -Wno-IMPLICIT -Wno-LITENDIAN -Wno-INITIALDLY -Wno-MODDUP --top-module oc8051_tb --x-assign fast --x-initial fast --noassert --coverage-toggle
  DIRECTORY ${CMAKE_CURRENT_BINARY_DIR}/verilatorsim
  INCLUDE_DIRS ${RTL_DIR}
  SOURCES ${RTL_SRC}
  )


file(GLOB OTHER_SRC  secureboot.cpp coverage.cpp tamper.cpp afl.c tracerecord.cpp)
add_library(simlib ${OTHER_SRC})
target_link_libraries(simlib verilatorsim libprop crypto pthread)


# Adding aes_test
add_executable(aes_test aes_test.cpp)
target_link_libraries(aes_test PUBLIC simlib)


# sha_test
add_executable(sha_test sha_test.cpp)
target_link_libraries(sha_test PUBLIC simlib)


# bootfuzzer
add_executable(bootfuzzer bootfuzzer.cpp)
target_link_libraries(bootfuzzer PUBLIC simlib)

#bootloader
add_executable(bootloader bootloader.cpp)
target_link_libraries(bootloader PUBLIC simlib)
