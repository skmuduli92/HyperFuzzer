# fuzztest
After cloning the repository update the submodules by running
```bash
git submodule update --init --recursive
```
Then follow these steps below to run an experiment.

1. **Build Verilator**
   ```bash
   cd $PROJECT_ROOT/verilator
   export VERILATOR_ROOT=$PWD
   autoconf && ./configure && make -j4
   ```

2. **Building and test examples**
    - Building with CMake
         ```bash
         cd $PROJECT_ROOT/fuzztest
         mkdir build && cd build && make aes_test -j4
         cd bin
         ```
         *You must change directory to bin directory while executing any example else some of the relative paths will not get resolved properly*
     
    - Building with Makefile
   
        - Build `libprop`
     
           ```bash
           cd $PROJECT_ROOT/fuzztest/libprop
           mkdir build && cd build && cmake .. && make -j4
           ```
         - Building example `aes_test`
     
           ```bash
           cd $PROJECT_ROOT/fuzztest
           make aes_test
           ```
