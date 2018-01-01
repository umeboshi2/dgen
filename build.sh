#!/bin/sh
set -e
./autogen.sh
./configure
make sdl/pbm2df
make musa/m68kmake
make mz80/makez80
emconfigure ./configure
make
cp dgen dgen.bc
