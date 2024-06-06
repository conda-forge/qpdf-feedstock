#!/bin/bash


mkdir build_release
pushd build_release

cmake ${CMAKE_ARGS} \
    -GNinja \
    -DCMAKE_BUILD_TYPE:STRING="Release" \ 
    -DCMAKE_INSTALL_PREFIX:PATH="${PREFIX}" \
    -DINSTALL_HEADERS:BOOL=ON \
    -DBUILD_SHARED_LIBS:BOOL=ON \
    -DBUILD_STATIC_LIBS:BOOL=OFF \
    -DBUILD_TESTING:BOOL=ON \
    -DREQUIRE_CRYPTO_OPENSSL:BOOL=ON \
    "${SRC_DIR}"

cmake --build . --target install --config Release

popd  # Leave `build_release`
