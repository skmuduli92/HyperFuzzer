// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at:
// http://www.apache.org/licenses/LICENSE-2.0

#ifndef AFL_H
#define AFL_H

#include <stdint.h>
#include <string.h>
#include <sstream>

/// call at the beginning of main to start fork server
void afl_init(int*, std::stringstream*);

extern uint8_t* __afl_area_ptr;
static inline void afl_increment(uint16_t id)
{ __afl_area_ptr[id]++; }
static inline void afl_set(uint16_t id, uint8_t value)
{ __afl_area_ptr[id] = value; }
static inline uint8_t afl_get(uint16_t id)
{ return __afl_area_ptr[id]; }
static inline void afl_copy(const void* src, size_t len)
{ memcpy(__afl_area_ptr, src, len); }

#endif // AFL_H
