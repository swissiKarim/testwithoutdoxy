APPNAME=ulam
APPMAIN=./src/main.cpp
TESTMAIN=ppr_tb_test_ulam
###########################################################################
# Which compiler
CC=g++
FC=g77
###########################################################################
# Where to install
TARGET=./
###########################################################################
# Where are include files kept
LIBS=-lcppunit
INCLUDES=-I./src -I./test
###########################################################################
# Compile option
CFLAGS=-g -Wall -coverage

SRC:=$(filter-out $(APPMAIN),$(wildcard ./src/*.c))
TEST:=$(wildcard ./test/*.c)
OBJ:=$(SRC:.c=.o) $(TEST:.c=.o)

###########################################################################
# Control Script
all: clean compile report
clean:
	find ./ -name *.o -exec rm -v {} \;
	find ./ -name *.gcno -exec rm -v {} \;
	find ./ -name *.gcda -exec rm -v {} \;
	-rm $(APPNAME)
	-rm $(TESTMAIN)

###########################################################################
# Body
compile: $(OBJ)
	$(CC) $(CFLAGS) $(OBJ) -o $(TESTMAIN) $(LIBS)

%.o : %.c
	$(CC) $(CFLAGS) $(LIBS) $(INCLUDES) -c $< -o $@

	
	