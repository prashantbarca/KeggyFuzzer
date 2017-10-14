/*
 * keggyfuzzer.cc
 * Created on: 2017-10-14 15:30
 */

#include <hammer/hammer.h>
#include <vector>
#include <list>
#include <map>
#include <set>
#include <queue>
#include <deque>
#include <stack>
#include <bitset>
#include <algorithm>
#include <functional>
#include <numeric>
#include <utility>
#include <sstream>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cmath>
#include <cstdlib>
#include <ctime>
#include <cstring>
#include <cassert>
#include <stdint.h>
#include "keggyfuzzer.h"
#include "generators/ch_range.h"
#include "generators/ch.h"
using namespace std;

void generator(HParser* parser)
{
	
}

int main(void) {
	HParser* parser = init_parser();
	generator(parser);
	uint8_t *Data;
	size_t size;
	g_ch_range('c','d');
    return 0;
}

