set CMAKE_CONFIG=Release

mkdir build_%CMAKE_CONFIG%
if %ERRORLEVEL% neq 0 exit 1

pushd build_%CMAKE_CONFIG%
if %ERRORLEVEL% neq 0 exit 1

cmake -G "Ninja" ^
    -DCMAKE_BUILD_TYPE:STRING=%CMAKE_CONFIG% ^
    -DBUILD_SHARED_LIBS:BOOL=ON ^
    -DBUILD_STATIC_LIBS:BOOL=OFF ^
    -DCMAKE_INSTALL_PREFIX:PATH="%LIBRARY_PREFIX%" ^
    "%SRC_DIR%" 
if %ERRORLEVEL% neq 0 exit 1 

cmake --build . --target install --config %CMAKE_CONFIG%
if %ERRORLEVEL% neq 0 exit 1

popd
