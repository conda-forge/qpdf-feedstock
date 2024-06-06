@echo on

mkdir build_release
if %ERRORLEVEL% neq 0 exit 1

pushd build_release
if %ERRORLEVEL% neq 0 exit 1

cmake %CMAKE_ARGS% ^
    -GNinja ^
    -DCMAKE_BUILD_TYPE:STRING="Release" ^
    -DCMAKE_PREFIX_PATH:PATH=%LIBRARY_PREFIX% ^
    -DCMAKE_INSTALL_PREFIX:PATH=%LIBRARY_PREFIX% ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DBUILD_STATIC_LIBS:BOOL=OFF ^
    -DREQUIRE_CRYPTO_OPENSSL:BOOL=ON ^
    "%SRC_DIR%"
if %ERRORLEVEL% neq 0 exit 1

cmake --build . --target install --config Release
if %ERRORLEVEL% neq 0 exit 1

popd  # Leave `build_release`
if %ERRORLEVEL% neq 0 exit 1
