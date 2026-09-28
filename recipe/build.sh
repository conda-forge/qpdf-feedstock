#!/bin/bash

set -xeuo pipefail

# Native osx-arm64 runners have Homebrew in /opt/homebrew (e.g. gnutls);
# keep it out of cmake's search paths.
EXTRA_CMAKE_ARGS=""
if [[ "${target_platform}" == osx-* ]]; then
    EXTRA_CMAKE_ARGS="-DCMAKE_IGNORE_PREFIX_PATH:PATH=/opt/homebrew"
fi

mkdir build_release
pushd build_release

cmake ${CMAKE_ARGS} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING="Release" \
    -DCMAKE_PREFIX_PATH:PATH="${PREFIX}" \
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_STATIC_LIBS:BOOL=OFF \
    -DUSE_IMPLICIT_CRYPTO:BOOL=OFF \
    -DREQUIRE_CRYPTO_OPENSSL:BOOL=ON \
    ${EXTRA_CMAKE_ARGS} \
    "${SRC_DIR}"

cmake --build . --target install --config Release

popd  # Leave `build_release`
