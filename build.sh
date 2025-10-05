#!/bin/bash
set -e

echo "=== Building native library ==="

# Переходим в webview core
cd ../webview

# Чистим и создаём сборочную директорию
rm -rf build
mkdir build
cd build

# Явно указываем CMake генерировать в текущую директорию
cmake .. -DCMAKE_BUILD_TYPE=Release -B. -S..

# Собираем с 8 потоками
make -j8

echo "=== Build complete! ==="

# Копируем собранную библиотеку в webview_go
cd ..
cp core/libwebview.0.12.dylib ../webview_go/libwebview.0.12.dylib
echo "Copied libwebview.0.12.dylib to webview_go"


cd ../webview_go

echo "=== Building Go example ==="
go build -o main ./examples/basic/main.go

# Добавляем rpath, чтобы бинарь знал, где искать .dylib
install_name_tool -add_rpath $(pwd) ./main

echo "✅ Build complete!"
echo "You can now run the example with:"
echo "    ./main"