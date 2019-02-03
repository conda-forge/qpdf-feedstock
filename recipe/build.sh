#!/bin/bash

export CFLAGS="-I$PREFIX/include"
export LDFLAGS="-L$PREFIX/lib"

./autogen.sh
./configure --prefix="${PREFIX}"
make -j ${CPU_COUNT}
make install
