#!/bin/bash
set -e
./autogen.sh
./configure
make sdl/pbm2df
pushd sdl
make dgenfont_16x26.cpp
make dgenfont_7x5.cpp
make dgenfont_8x13.cpp
popd
pushd musa
make m68kmake
popd
pushd mz80
make makez80
popd
emconfigure ./configure
make
