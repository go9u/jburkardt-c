#!/bin/bash
#
gcc -c -I/$HOME/include simplex_grid_prb.c
if [ $? -ne 0 ]; then
  echo "Errors compiling simplex_grid_prb.c"
  exit
fi
#
gcc -o simplex_grid_prb simplex_grid_prb.o /$HOME/libc/$ARCH/simplex_grid.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading simplex_grid_prb.o."
  exit
fi
#
rm simplex_grid_prb.o
#
./simplex_grid_prb > simplex_grid_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running simplex_grid_prb."
  exit
fi
rm simplex_grid_prb
#
echo "Program output written to simplex_grid_prb_output.txt"
