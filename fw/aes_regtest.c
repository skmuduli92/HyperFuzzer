#include <assert.h>
#include <stdint.h>
#include "aes_regtest.h"

#define AES_REG_START_ADDR 0xFF00
#define AES_REG_STATE_ADDR 0xFF01
#define AES_REG_ADDR_ADDR 0xFF02
#define AES_REG_LEN_ADDR 0xFF04
#define AES_REG_CTR_ADDR 0xFF10
#define AES_REG_KEY0_ADDR 0xFF20
#define AES_REG_KEY1_ADDR 0xFF30
#define DATA_ADDR 0xE000

void idle_cycle()
{
    oc8051_xiommu.rst = 0;
    oc8051_xiommu.proc_wr = 0;
    oc8051_xiommu.proc_stb = 0;
    oc8051_xiommu.proc_addr = 0;
    oc8051_xiommu.proc_data_in = 0;
    set_inputs();
    next_timeframe();
}

void reset()
{
    int i;

    oc8051_xiommu.rst = 1;
    set_inputs();
    next_timeframe();

    idle_cycle();
}

_u8 inb(_u16 addr)
{
    int cnt = 0;
    _u8 data;

    oc8051_xiommu.rst = 0;
    oc8051_xiommu.proc_wr = 0;
    oc8051_xiommu.proc_stb = 1;
    oc8051_xiommu.proc_addr = addr;
    set_inputs();
    next_timeframe();

    while(oc8051_xiommu.proc_ack == 0) {
        oc8051_xiommu.rst = 0;
        oc8051_xiommu.proc_wr = 0;
        oc8051_xiommu.proc_stb = 1;
        oc8051_xiommu.proc_addr = addr;
        set_inputs();
        next_timeframe();
        if (cnt++ >= 4) break;
    }
    assert (oc8051_xiommu.proc_ack == 1);
    data = oc8051_xiommu.proc_data_out;

    idle_cycle();
    return data;
}

void outb(_u16 addr, _u8 data)
{
    int cnt = 0;

    oc8051_xiommu.rst = 0;
    oc8051_xiommu.proc_wr = 1;
    oc8051_xiommu.proc_stb = 1;
    oc8051_xiommu.proc_addr = addr;
    oc8051_xiommu.proc_data_in = data;
    set_inputs();
    next_timeframe();

    while(oc8051_xiommu.proc_ack == 0) {
        oc8051_xiommu.rst = 0;
        oc8051_xiommu.proc_wr = 1;
        oc8051_xiommu.proc_stb = 1;
        oc8051_xiommu.proc_addr = addr;
        oc8051_xiommu.proc_data_in = data;
        set_inputs();
        next_timeframe();
        if (cnt++ >= 4) break;
    }
    assert (oc8051_xiommu.proc_ack == 1);
    idle_cycle();
}


/*---------------------------------------------------------------------------*/

void main() {
    _u16 i;
    reset();

    // test writing to XRAM.
    for(i=0; i < 2; i++) {
        outb(DATA_ADDR+i, i*i+1);
    }
    // assert (oc8051_xiommu.oc8051_xram_i.buff[0xE001] == 3);
    for(i=0; i < 2; i++) {
        assert(inb(DATA_ADDR+i) == i*i+1);
    }
}
