# $Id: Makefile 37118 2015-02-17 07:02:59Z kristov $

CC = gcc
CFLAGS = -Wall -Wextra

PROGS = fdrecv fdsend

all: $(PROGS)
clean:
	rm -f $(PROGS) $(patsubst %,%.o,$(PROGS))

.PHONY: all clean
