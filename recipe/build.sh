#!/bin/bash

set -xeuo pipefail

mkdir build_release
pushd build_release

cmake ${CMAKE_ARGS} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_PREFIX_PATH:PATH="${PREFIX}" \
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_STATIC_LIBS:BOOL=OFF \
    -DREQUIRE_CRYPTO_OPENSSL:BOOL=ON \
    "${SRC_DIR}"

cmake --build . --target install --config Release

popd  # Leave `build_release`
