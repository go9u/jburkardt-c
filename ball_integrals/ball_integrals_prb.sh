#!/bin/bash
#
gcc -c -g -I/$HOME/include ball_integrals_prb.c >& compiler.txt
if [ $? -ne 0 ]; then
  echo "Errors compiling ball_integrals_prb.c"
  exit
fi
rm compiler.txt
#
gcc ball_integrals_prb.o /$HOME/libc/$ARCH/ball_integrals.o -lm
if [ $? -ne 0 ]; then
  echo "Errors linking and loading ball_integrals_prb.o."
  exit
fi
#
rm ball_integrals_prb.o
#
mv a.out ball_integrals_prb
./ball_integrals_prb > ball_integrals_prb_output.txt
if [ $? -ne 0 ]; then
  echo "Errors running ball_integrals_prb."
  exit
fi
rm ball_integrals_prb
#
echo "Program output written to ball_integrals_prb_output.txt"
