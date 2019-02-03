#!/bin/bash
set -x
set -e

CC=cl CXX="cl -TP -GR" ./configure --disable-test-compare-images --enable-external-libs --enable-werror --with-windows-wordsize=64 --with-buildrules=msvc --prefix="${LIBRARY_PREFIX_M}"
make -j ${CPU_COUNT}
make install
