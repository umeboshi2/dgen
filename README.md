# current build instructions


Clone juj/emsdk

```
$ git clone https://github.com/juj/emsdk.git
$ cd emsdk
$ ./emsdk install --enable-wasm --build=Release sdk-incoming-64bit binaryen-master-64bit
$ ./emsdk activate --build=Release sdk-incoming-64bit binaryen-master-64bit
```

Source environment.


Build dgen:

```
./autogen.sh
./configure
make sdl/pbm2df
make musa/m68kmake
make mz80/makez80
emconfigure ./configure
make
cp dgen dgen.bc
```


Compile bytecode to webpage:

```
emcc dgen.bc -s ALLOW_MEMORY_GROWTH=1 -Oz  -v -o dgen.html
```

Error in browser:
```
dgen.js:1 Uncaught RangeError: Source is too large
    at Uint8Array.set (<anonymous>)
    at allocate (dgen.js:1)
    at dgen.js:1
```


Compile bytecode to webassembly:

```
emcc dgen.bc -s ALLOW_MEMORY_GROWTH=1 -s WASM=1 -Oz  -v -o dgen.html
```

Error in browser:

```
wasm-0059666e-131:20 Uncaught RuntimeError: memory access out of bounds
    at wasm-function[131]:39
    at Array.Module._malloc (http://localhost:8080/dgen.js:1:177658)
    at allocate (http://localhost:8080/dgen.js:1:6800)
    at Object.callMain (http://localhost:8080/dgen.js:1:180448)
    at doRun (http://localhost:8080/dgen.js:1:181448)
    at http://localhost:8080/dgen.js:1:181598
```





Use latest:

```
$ emsdk install latest
Installing SDK 'sdk-1.37.22-64bit'..
Installing tool 'clang-e1.37.22-64bit'..
Downloading: /freespace/home/umeboshi/workspace/emsdk/zips/emscripten-llvm-e1.37.22.tar.gz from https://s3.amazonaws.com/mozilla-games/emscripten/packages/llvm/tag/linux_64bit/emscripten-llvm-e1.37.22.tar.gz, 283938654 Bytes
 Unpacking '/freespace/home/umeboshi/workspace/emsdk/zips/emscripten-llvm-e1.37.22.tar.gz' to '/freespace/home/umeboshi/workspace/emsdk/clang/e1.37.22_64bit'
Done installing tool 'clang-e1.37.22-64bit'.
Installing tool 'node-4.1.1-64bit'..
The contents of file 'node-v4.1.1-linux-x64.tar.gz' already exist in destination '/freespace/home/umeboshi/workspace/emsdk/node/4.1.1_64bit', skipping.
Done installing tool 'node-4.1.1-64bit'.
Installing tool 'emscripten-1.37.22'..
Downloading: /freespace/home/umeboshi/workspace/emsdk/zips/1.37.22.tar.gz from https://github.com/kripken/emscripten/archive/1.37.22.tar.gz
Unpacking '/freespace/home/umeboshi/workspace/emsdk/zips/1.37.22.tar.gz' to '/freespace/home/umeboshi/workspace/emsdk/emscripten/1.37.22'
Done installing tool 'emscripten-1.37.22'.
Done installing SDK 'sdk-1.37.22-64bit'.
```

same errors in both asm.js and wasm builds.


