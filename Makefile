#
# Makefile
# prashant, 2017-10-14 15:37
#

CC=clang++
FLAGS=-lhammer `pkg-config --libs --cflags glib-2.0`

all:
	$(CC) -c keggyfuzzer.cc $(FLAGS)
	ar rcs keggyfuzzer.a keggyfuzzer.o

# vim:ft=make
#

