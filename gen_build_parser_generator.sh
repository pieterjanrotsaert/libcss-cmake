#!/usr/bin/env bash
#perl ./libcss/build/mkprops.pl > ./libcss/src/autogen_stubs.c
cmake -S . -B "build-libcss-parser-generator" -DLIBCSS_BUILD_PARSER_GENERATOR=ON -DCMAKE_INSTALL_PREFIX=./ -DCMAKE_INSTALL_BINDIR=build-libcss-parser-generator/bin
cmake --build ./build-libcss-parser-generator --config Release
cmake --install ./build-libcss-parser-generator
./build-libcss-parser-generator/bin/css-parser-gen.exe -o ./libcss/src/parse/properties/properties.gen > test.txt