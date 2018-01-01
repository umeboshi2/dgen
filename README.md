# current build instructions

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
