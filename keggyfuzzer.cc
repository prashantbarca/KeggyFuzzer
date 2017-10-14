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
using namespace std;

typedef vector< int > vi; 
typedef vector< vi > vvi;
typedef vector< string > vs;
typedef pair<int,int> ii; 
#define sz(a) int((a).size()) 
#define pb push_back 
#define mp make_pair
#define all(c) (c).begin(),(c).end() 
#define tr(c,i) for(typeof((c).begin()) i = (c).begin(); i != (c).end(); i++) 
#define present(c,x) ((c).find(x) != (c).end()) 
#define cpresent(c,x) (find(all(c),x) != (c).end()) 
#define For(i, a, b) for(int i = (a), _b = (b); i < _b; i++)
#define Rep(i, n) For(i, 0, n)

int main(void) {
	uint8_t *Data;
	size_t size;
	target(Data, size);
    return 0;
}

