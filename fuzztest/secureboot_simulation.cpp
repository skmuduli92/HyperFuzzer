#include <verilated.h>
#include <iterator>
#include <iostream>
#include <iomanip>
#include "Voc8051_tb.h"
#include "Voc8051_tb__Syms.h"
#include <array>
#include <fstream>
#include <algorithm>
#include <iterator>
#include <ctime>
#include <cstdlib>
#include "afl.h"
#include <memory>
#include <sstream>
#include<map>

#include "coverage.h"
#include "property_parser.h"
#include "trace.h"
#include "formula.h"

#define DEBUG_REG_ADDR 0xEFFE
#define DEBUG_REG_DATA 0xEFFF
#define N 18 // number of elements in trace instance 16 aes_control, pc, good
static int fid = 0;
vluint64_t main_time = 0;
using namespace std;
char p[] = "(IMPLIES (GEQ (1.cycle) (10133)) (O (EQL (1.good) (1))))";
//char p[] = "(EQL (good) (1))";
std::stringstream ss;
// std::ofstream tracefile;
static int run_number;
std::stringstream tampf;
std::vector<long int*> trace1,trace2;
std::map<string, std::vector<long int*>> tracemap;
char* tr_lit[] = {"cycle","good"};
int num_lit = 2;
Formula *root1;
Formula *root2; // interchanging the traces
// bool check_property(){
//   long int *tr1, *tr2;
//   if (trace1.size()!= trace2.size()){
//     //throw fid;
//   }
//   for(std::vector<long int*>::size_type i =0;i!=trace1.size();i++){
//     tr1 = trace1[i];
//     cout << "trace "<< i <<endl;
//     for( int j =0;j<num_lit;j++){
// 	    cout <<dec << trace1[i][j] << " ";
//     }
//     cout << endl;
//     //tr2 = trace2[i];
//     if (root1->eval(tr1,tr2)){
//       continue;
//     }else{
//       return false;
//     }
//   }
// }

bool check_property(){
  long int *tr1, *tr2, *oldtr1;
  tr1 = (long int*)malloc(num_lit);
  oldtr1 = (long int*)malloc(num_lit);
  cout << "length "<< tracemap[tr_lit[0]].size() << endl;
  // return true;
  for(std::vector<long int*>::size_type i =0;i!=tracemap[tr_lit[0]].size();i++){
    tr1[0] = tracemap[tr_lit[0]][i][1];
    oldtr1[0] = tr1[0];
    if (i==0){
      for (size_t j = 1; j < num_lit; j++) {
        tr1[j] = tracemap[tr_lit[j]][0][1];
        oldtr1[j] = tr1[j];
        tracemap[tr_lit[j]].erase(tracemap[tr_lit[j]].begin());
      }
    }else{
      for (size_t j = 1; j < num_lit; j++) {
        if(tracemap[tr_lit[j]].empty()){
          tr1[j] = oldtr1[j];
        }else if (tracemap[tr_lit[j]][0][0]==tr1[0]){
          tr1[j] = tracemap[tr_lit[j]][0][1];
          oldtr1[j] = tr1[j];
          tracemap[tr_lit[j]].erase(tracemap[tr_lit[j]].begin());
        }else if (tracemap[tr_lit[j]][0][0]>tr1[0]){
          tr1[j] = oldtr1[j];
        }else{
          std::cout << "error \n";
        }
      }
    }

    // tr1 = trace1[i];
    cout << "trace "<< i << " " <<endl;
    for( int j =0;j<num_lit;j++){
	    cout <<dec << tr1[j] << " ";
    }
    cout << endl;
    //tr2 = trace2[i];
    if (root1->eval(tr1,tr2)){
      continue;
    }else{
      return false;
    }
  }
  return true;
}
void copy_array(auto dest,auto src, int length){
	for(int i =0 ;i<length;i++){
		dest[i]=src[i];
	}
}
bool array_not_equall(auto arr1, auto arr2,int start, int finish){
	for(int i =start;i<finish;i++){
		if(arr1[i]!=arr2[i])
			return true;
	}
	return false;
}
void write_trace(Voc8051_tb* top, std::ofstream& tracefile) {
  static long int oldval[2]={-1,-1};
  bool time_pushed = false;
  long int *newval, *newtouple, *cycle;
  cycle = (long int*)malloc(2);
  cycle[0] = cycle[1] = main_time;
  newval = (long int*)malloc(2);
  newval[0]=main_time;
  newval[1]=top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[DEBUG_REG_DATA];
  if (tracemap.empty() || newval[0]==14495){
    cout << "tracemap empty \n";
    for (size_t i = 1; i < num_lit; i++) {
      newtouple = (long int*)malloc(2);
      newtouple[1] = main_time;
      newtouple[0] = newval[i];
      tracemap[tr_lit[i]].push_back(newval);
      if(!time_pushed){
        tracemap[tr_lit[0]].push_back(cycle);
        time_pushed = true;
      }
    }
  }else{
    for (size_t i = 1; i < num_lit; i++) {
      newtouple = (long int*)malloc(2);
      newtouple[0] = main_time;
      newtouple[1] = newval[i];
      if (newval[i]!= tracemap[tr_lit[i]].back()[1]){
        cout << "newval " << newval[i] << " "<< tracemap[tr_lit[i]].back()[1] << endl;
        tracemap[tr_lit[i]].push_back(newtouple);
        if(!time_pushed){
          tracemap[tr_lit[0]].push_back(cycle);
          time_pushed = true;
        }
      }else{
        delete newtouple;
      }
    }
  }
  delete newval;
}




int clk = 0;
// int temp;
double sc_time_stamp() { return main_time; }
int p0,p1,p2,p3,p_zero;
int addr;
int one_byte_instruction[] = {0x26, 0x27, 0x28, 0x29, 0x2a, 0x2b, 0x2c, 0x2d, 0x2e, 0x2f, 0x36, 0x37, 0x38, 0x39, 0x3a, 0x3b, 0x3c, 0x3d, 0x3e, 0x3f, 0x56, 0x57, 0x58, 0x59, 0x5a, 0x5b, 0x5c, 0x5d, 0x5e, 0x5f, 0xc3, 0xe4, 0xf4, 0xb3, 0xd4, 0x14, 0x16, 0x17, 0x18, 0x19, 0x1a, 0x1b, 0x1c, 0x1d, 0x1e, 0x1f, 0x84, 0x04, 0x06, 0x07, 0x08, 0x09, 0x0a, 0x0b, 0x0c, 0x0d, 0x0e, 0x0f, 0xa3, 0xf6, 0xf7, 0xe6, 0xe7, 0xe8, 0xe9, 0xea, 0xeb, 0xec, 0xed, 0xee, 0xef, 0xf8, 0xf9, 0xfa, 0xfb, 0xfc, 0xfd, 0xfe, 0xff, 0x93, 0x83, 0xf0, 0xf2, 0xf3, 0xe0, 0xe2, 0xe3, 0xa4, 0x00, 0x46, 0x47, 0x48, 0x49, 0x4a, 0x4b, 0x4c, 0x4d, 0x4e, 0x4f, 0x23, 0x33, 0x03, 0x13, 0x96, 0x97, 0x98, 0x99, 0x9a, 0x9b, 0x9c, 0x9d, 0x9e, 0x9f, 0xc4, 0xc6, 0xc7, 0xc8, 0xc9, 0xca, 0xcb, 0xcc, 0xcd, 0xce, 0xcf, 0x66, 0x67, 0x68, 0x69, 0x6a, 0x6b, 0x6c, 0x6d, 0x6e, 0x6f};
int two_byte_instruction[] = {0x24, 0x25, 0x34, 0x35, 0x52, 0x54, 0x55, 0x82, 0xb0, 0xc2, 0xb2, 0x15, 0x05, 0x76, 0x77, 0xa6, 0xa7, 0x74, 0xe5, 0xa2, 0x78, 0x79, 0x7a, 0x7b, 0x7c, 0x7d, 0x7e, 0x7f, 0xa8, 0xa9, 0xaa, 0xab, 0xac, 0xad, 0xae, 0xaf, 0x92, 0x86, 0x87, 0x88, 0x89, 0x8a, 0x8b, 0x8c, 0x8d, 0x8e, 0x8f, 0xf5, 0x42, 0x44, 0x45, 0x72, 0xa0, 0xd0, 0xc0, 0x94, 0x95, 0xc5, 0x62, 0x64, 0x65};
int three_byte_instruction[] = {0x53, 0x90, 0x75, 0x85, 0x43, 0x63};

ValueTracker opcode_tracker(16381 /* closest prime to 16384 */, 8);
ValueTracker pc_tracker(32771 /* closest prime to 32768 */, 16);

void valid_correction(Voc8051_tb* top, int init, int fin){
    int next_instruction, x;
    size_t n = sizeof(one_byte_instruction)/sizeof(one_byte_instruction[0]);
    std::cout << std::dec << "one byte instructions " << n << std::endl;
    n = sizeof(two_byte_instruction)/sizeof(two_byte_instruction[0]);
    std::cout << std::dec << "two byte instructions " << n << std::endl;
    n = sizeof(three_byte_instruction)/sizeof(three_byte_instruction[0]);
    std::cout << std::dec << "three byte instructions " << n << std::endl;
    for (int i = init; i<=fin;){
        x = top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i];
        if (std::find(std::begin(one_byte_instruction), std::end(one_byte_instruction), x) != std::end(one_byte_instruction)){
            next_instruction = i+1;
        }else if (std::find(std::begin(two_byte_instruction), std::end(two_byte_instruction), x) != std::end(two_byte_instruction)){
            next_instruction = i+2;
        }else if (std::find(std::begin(three_byte_instruction), std::end(three_byte_instruction), x) != std::end(three_byte_instruction)){
            next_instruction = i+3;
        }else{
            next_instruction = i+1;
            top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = 0;
        }

        if (next_instruction > fin){
            for(int j = i;j<=fin;j++){
                top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[j] = 0;
            }
            break;
        }
        i = next_instruction;
    }
}
void xram_read(Voc8051_tb* top, int init, int fin){
    for (int i = init; i<= fin; i++){
        // std::cout << std::dec << "xram[" << i << "]="
                  // << std::hex << "= " << int(top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[i]) << std::endl;
        std::cout << std::hex << " " << int(top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[i]);
    }

    return;
}

void tamper(Voc8051_tb* top, int init, int fin){
    std::ifstream infile;
    int a;
    tampf << "tamper start\n";
    for (int i = init; i<= fin; i++){
        std::cin >> a;
        a = a % 256;
        std::cout << std::dec << "data[" << i << "]="
                  << std::hex << a << std::endl;
	tampf << a << "\n";
        top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[i] = (unsigned int)a;
    }
    valid_correction(top, init, fin);
    tampf << "tamper end\n";
    return;
}



// introducing delay for each eval call
int  wait(unsigned long delay, Voc8051_tb *top,  std::ofstream& tracefile){
    int good = 0;
    int a = 0xff,b,c,d;
    while(delay || delay == -1){
        if(Verilated::gotFinish()){   // check if verilog code is finished
            std::cout << "finished " << Verilated::gotFinish() << std::endl;
            return a;
        }
        if (clk == 1){
            clk =0;
        }else {
            clk = 1;
            /* track signals on risiing clock. */
            opcode_tracker.track(top->oc8051_tb__DOT__oc8051_top_1__DOT__op1_d);
            pc_tracker.track(top->oc8051_tb__DOT__oc8051_top_1__DOT__pc);
        }
        top->oc8051_tb__DOT__clk = clk;
        top->eval();

        write_trace(top, tracefile);


        // if (a != top->oc8051_tb__DOT__data_out ||
        //     b != top->oc8051_tb__DOT__oc8051_top_1__DOT__wr_addr ||
        //     c != top->oc8051_tb__DOT__stb_o ||
        //     d != top->oc8051_tb__DOT__ack_i        ){
        //       std::cout << "write data, addr, stb, ack "<< std::hex << a << " " << b << " " << c << " " << d << std::endl;
        //       a = top->oc8051_tb__DOT__data_out;
        //       b = top->oc8051_tb__DOT__oc8051_top_1__DOT__wr_addr;
        //       c = top->oc8051_tb__DOT__stb_o;
        //       d = top->oc8051_tb__DOT__ack_i;
        //     }
        if (p0 != top->oc8051_tb__DOT__p0_out ||
            p1 != top->oc8051_tb__DOT__p1_out ||
            p2 != top->oc8051_tb__DOT__p2_out ||
            p3 != top->oc8051_tb__DOT__p3_out )
        {
                std::cout << "wait @ " << main_time << " " << std::hex << ": "<< p0 << "-"<< p1 << "-" << p2 << "-" << p3 << "-" <</* temp << "-" << c << "-" << d <<*/ std::endl;
                p0 = top->oc8051_tb__DOT__p0_out;
                p1 = top->oc8051_tb__DOT__p1_out;
                p2 = top->oc8051_tb__DOT__p2_out;
                p3 = top->oc8051_tb__DOT__p3_out;
        }

        delay--;
        main_time++;
    }
    return 2;
}
void new_test(Voc8051_tb *top){
    std::ifstream infile;
//    infile.open("secureboot");
    infile.open("../rom/secureboot.dat");
    int counter = 0 ;
    int num_buff,a,b;
    infile >> num_buff;
    //std::cout << num_buff << std::endl;
    for (int i=0; i<num_buff; i++){
        infile >>b>> a;
        top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[b] = (unsigned int)a;
    }
    for (;num_buff<10000;num_buff++){
        top->oc8051_tb__DOT__oc8051_cxrom1__DOT__buff[num_buff] = 0U;
    }
    infile.close();
    return;
}

int reset_uc(Voc8051_tb* top,  std::ofstream& tracefile)
{
    top->oc8051_tb__DOT__rst = 1;
    top->oc8051_tb__DOT__p0_in = 0x00;
    top->oc8051_tb__DOT__p1_in = 0x00;
    top->oc8051_tb__DOT__p2_in = 0xff;
    int a = wait(20,top, tracefile);
    //std::cout<< a << std::endl;
    if(a!=2){
        return 1;
    }
    top->oc8051_tb__DOT__rst = 0;
    a = wait(20,top, tracefile);
    //std::cout<< a << std::endl;
    if(a!=2){
        return 1;
    }
}
void fsm_write(Voc8051_tb* top){
  top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_addr[0] = 0x0500;
  top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_data[0] = 12;
  cout << "fsm " << hex << top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_data[0]<< " , " << top->oc8051_tb__DOT__fsm_writer_i__DOT__buf_data[0] << endl;
}
void load_image(Voc8051_tb* top){
  std::ifstream infile;
//    infile.open("secureboot");
  infile.open("../fw/prog.hex");
  int counter = 0 ;
  char c[2],d,e;
  int num_buff,a,b;
  a = 0x3000;
  // a = 0;
  infile.seekg(0, ios::end); // set the pointer to the end
	num_buff = infile.tellg() ; // get the length of the file
	cout << "Size of file: " << num_buff<<endl;
	infile.seekg(0, ios::beg); // set the pointer to the beginning


  //std::cout << num_buff << std::endl;
  cout << dec << num_buff << "loading image \n";
  for (int i=0; !infile.eof(); i++){
      // infile >>c[0];
      // infile >>c[1];
      // b = stoi(c,16);
      // cout << i << endl;
      infile >> std::hex >> b;
      top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[a+i] = (unsigned int)b;
      std::cout << std::hex << (unsigned int)top->oc8051_tb__DOT__oc8051_xiommu1__DOT__oc8051_xram_i__DOT__buff[a+i];
  }

  cout << endl;
  infile.close();
  return;
}
void test(Voc8051_tb* top, int option,  std::ofstream& tracefile){
    if(!reset_uc(top, tracefile)) {
        delete top;
        std::cout << "error reset top "  << std::endl;
        return;
    }
    CData *block = top->oc8051_tb__DOT__oc8051_xiommu1__DOT__memwr_i__DOT__block;
    std::cout << " " << std::hex << "block" << (int)block[0] << std::endl;

    new_test(top);
    load_image(top);
    // fsm_write(top);
    // cout << "xram read\n";
    // for (size_t i = 0; i < 20; i++) {
    //   xram_read(top, 6000,6000);
    //   wait(1,top, tracefile);
    // }
    // exit(1);

    wait(10000,top, tracefile);

    // if (option == 1)
    //   tamper(top,351,371);
    // giving two byte buffer in case initial nop is operand or data for the previous instruction
    // 379 => 381
    // aes_ctr_read(top,0,127);
    int r1 = wait(165288000,top, tracefile);
    // xram_read(top, 0x3000,0x3800);
    std::cout << "r1 " << r1 << std::endl;

}

int main(int argc, char *argv[]) {


    // afl init
    root1 = parse(p);
    root2 = parse(p);// interchanging the traces
    root1->display();
    cout << endl;
    std::unique_ptr<Voc8051_tb> top = std::make_unique<Voc8051_tb>();

    // afl init
    std::stringstream oldss;
    afl_init(&fid, &oldss);

    std::string traceFileName = std::string("traces/trace_") +  std::string(".txt");
    std::ofstream tracefile(traceFileName);
    std::string tamperfilename = "tamper/tamper_" + std::to_string(fid);

    // read test input and simulate
    run_number = 1;

    test(top.get(), 0, tracefile);

    cout << trace1.size() << endl;;
    // cout << "trace " << trace1[0][0] << " " << trace1[0][1]<<endl;;

    Verilated::reset_verilator();
    cout << " checking property" << endl;
    run_number = 2;
    main_time=0;

    //test(top.get(), 0, tracefile);
    tracefile << std::endl;
    tracefile.close();
    // push coverage
    std::vector<uint32_t> coverageBins(
        opcode_tracker.size() + pc_tracker.size());
    std::copy(opcode_tracker.begin(), opcode_tracker.end(),
              coverageBins.begin());
    std::copy(pc_tracker.begin(), pc_tracker.end(),
              coverageBins.begin() + opcode_tracker.size());
    afl_copy(coverageBins.data(), coverageBins.size());
    if (!check_property()){
            cout << "error property not satisfied " << check_property() << endl;
            std::ofstream tamperfile(tamperfilename);
            tamperfile << tampf.rdbuf();
            tamperfile.close();
            throw fid;
    }

    return 0;
}
