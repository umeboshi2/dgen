#!/bin/sh
set -e
./autogen.sh
./configure
make sdl/pbm2df
make musa/m68kmake
make mz80/makez80
emconfigure ./configure --disable-threads --disable-opengl --enable-debug
make
cp dgen dgen.bc
