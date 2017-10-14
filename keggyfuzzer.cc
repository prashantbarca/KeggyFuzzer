/*
 * keggyfuzzer.cc
 * Created on: 2017-10-14 15:30
 */

#include <sys/types.h>
#include <sys/stat.h>
#include <unistd.h>
#include <hammer/hammer.h>
#include <iostream>
#include <iomanip>
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cassert>
#include <stdint.h>
#include "keggyfuzzer.h"
#include "generators/ch_range.h"
#include "generators/sequence.h"
using namespace std;

void create_folder()
{
    struct stat st = {0};

    if (stat("./corpus", &st) == -1) {
        mkdir("./corpus", 0700);
    }
    else 
        system("rm ./corpus/*");
}

// Generator takes a parser and recursively calls itself until the entire thing is exhausted.
void generator(HParser* parser)
{
    create_folder();
    g_ch_range('c','d');
    g_sequence(parser);
}

// Accept the parser and the target from the user.
// Generate data from the parser variable.
int main(void) {
    HParser* parser = init_parser();
    generator(parser);
    uint8_t *Data;
    size_t size;
    target(Data, size);
    return 0;
}
