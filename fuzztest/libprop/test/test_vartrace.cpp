
#include "trace.h"
#include <gtest/gtest.h>

using namespace std;


TEST(PropertyLibTest, TestVarTrace)
{

  VarTrace<unsigned> vartr;

  unsigned cycle = 0;
 
  for (; cycle < 4; ++cycle)
    vartr.updateValue(cycle, 1);

  for (; cycle < 6; ++cycle)
    vartr.updateValue(cycle, 2);

  for (; cycle < 10; ++cycle)
    vartr.updateValue(cycle, 3);


  // trace is in compressed format
  EXPECT_EQ(3, vartr.size());
  
  EXPECT_EQ(1, vartr[0]);
  EXPECT_EQ(1, vartr[1]);
  EXPECT_EQ(1, vartr[2]);
  EXPECT_EQ(1, vartr[3]);

  EXPECT_NE(1, vartr[4]);

  EXPECT_EQ(2, vartr[5]);

  EXPECT_EQ(3, vartr[6]);
}
