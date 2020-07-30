// Based on code by Laszlo Szekeres <lszekeres@google.com> and
//                  Michal Zalewski <lcamtuf@google.com>
// LLVM integration design comes from Laszlo Szekeres.
//
// Copyright 2015, 2016 Google Inc. All rights reserved.
// Copyright 2017, Kevin Laeufer <ekiwi@berkeley.edu>
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at:
// http://www.apache.org/licenses/LICENSE-2.0

#include <stdint.h>
#include <stdlib.h>
#include <unistd.h>

#include <sys/shm.h>
#include <sys/wait.h>
#include <sstream>

// from `config.h` in AFL
#define MAP_SIZE_POW2 16
#define MAP_SIZE      (1 << MAP_SIZE_POW2)
#define SHM_ENV_VAR   "__AFL_SHM_ID"
#define FORKSRV_FD    198
static int* fid;
/* Globals needed by the injected instrumentation. The __afl_area_initial region
   is used for instrumentation output before __afl_map_shm() has a chance to run.
   It will end up as .comm, so it shouldn't be too wasteful. */
uint8_t  __afl_area_initial[MAP_SIZE];
uint8_t* __afl_area_ptr = __afl_area_initial;

__thread uint32_t __afl_prev_loc;

static void __afl_map_shm() {
  char *id_str = getenv(SHM_ENV_VAR);

  // If we're running under AFL, attach to the appropriate region, replacing the
  // early-stage __afl_area_initial region that is needed to allow some really
  //hacky .init code to work correctly in projects such as OpenSSL.
  if (id_str) {
    uint32_t shm_id = atoi(id_str);
   __afl_area_ptr = (uint8_t*)shmat(shm_id, NULL, 0);

    // Whooooops.
    if (__afl_area_ptr == (void *)-1) { _exit(1); }

    // Write something into the bitmap so that even with low AFL_INST_RATIO,
    // our parent doesn't give up on us.
    __afl_area_ptr[0] = 1;
  }
}


/* Fork server logic. */

static void __afl_start_forkserver() {
  // Phone home and tell the parent that we're OK. If parent isn't there,
  // assume we're not running in forkserver mode and just execute program.
  uint8_t tmp[4] = {0, 0, 0, 0};
  if (write(FORKSRV_FD + 1, tmp, 4) != 4) { return; }

  pid_t child_pid;
  while (1) {
    *(fid) +=1;
    uint32_t was_killed;
    int status;

    // Wait for parent by reading from the pipe. Abort if read fails.
    if (read(FORKSRV_FD, &was_killed, 4) != 4) _exit(1);

    // Once woken up, create a clone of our process.
    child_pid = fork();
    if (child_pid < 0) { _exit(1); }

    // In child process: close fds, resume execution.
    if (!child_pid) {
      close(FORKSRV_FD);
      close(FORKSRV_FD + 1);
      return;
    }

    // In parent process: write PID to pipe, then wait for child.
    if (write(FORKSRV_FD + 1, &child_pid, 4) != 4) { _exit(1); }
    if (waitpid(child_pid, &status, 0) < 0) { _exit(1); }

    // Relay wait status to pipe, then loop back.
    if (write(FORKSRV_FD + 1, &status, 4) != 4) { _exit(1); }
  }
}
static std::stringstream *ss;
void afl_init(int* var, std::stringstream* s) {
  ss = s;
  static uint8_t init_done;
  fid = var;
  if (!init_done) {
    __afl_map_shm();
    __afl_start_forkserver();
    init_done = 1;
  }
}
