#
# Makefile
# prashant, 2017-10-14 15:37
#

GENERATOR=ch ch_range
CC=clang++
FLAGS=-lhammer `pkg-config --libs --cflags glib-2.0` -g

all:
	$(CC) $(FLAGS) -c $(foreach var,$(GENERATOR), generators/$(var).cc) keggyfuzzer.cc
	ar rcs libkeggyfuzzer.a *.o

clean:
	rm libkeggyfuzzer.a

# vim:ft=make
#

