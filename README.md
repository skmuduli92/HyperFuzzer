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
      
- Build `libprop` first

	```bash
	cd $PROJECT_ROOT/fuzztest/libprop
	mkdir build && cd build && cmake .. && make -j4
	```
	- Building example `aes_test`

	```bash
	cd $PROJECT_ROOT/fuzztest
	make aes_test
	   ```
	   
3. **Kernel config to run afl**    
	- Run `sudo ./$PROJECT_ROOT/fuzztest/kernel-config.sh` to setup system to run afl.

4. **Run test using `run.sh` script**
	- ./run.sh ./aes_test <test-timeout>
 

