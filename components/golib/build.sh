#!/bin/bash

# 确保脚本可执行
chmod +x "$0"

# 检查ESP-IDF环境
if [ -z "$IDF_PATH" ]; then
    echo "错误: 请先设置ESP-IDF环境变量"
    echo "运行: . $HOME/esp/esp-idf/export.sh"
    exit 1
fi

# 检查TinyGo环境
if ! command -v tinygo &> /dev/null; then
    echo "错误: TinyGo未安装或不在PATH中"
    exit 1
fi

# 检查源文件是否存在
if [ ! -f "lib.go" ]; then
    echo "错误: 源文件 lib.go 不存在"
    exit 1
fi

# 使用TinyGo编译，指定正确的目标和参数
echo "使用TinyGo编译Go源文件..."
tinygo build -o golib.o \
    -target=esp32-coreboard-v2 \
    -no-debug \
    -opt=2 \
    -gc=leaking \
    -scheduler=none \
    lib.go

if [ $? -ne 0 ]; then
    echo "TinyGo编译失败!"
    exit 1
fi

# 检查目标文件架构
echo "检查目标文件架构:"
file golib.o

# 使用ESP32工具链创建静态库
echo "使用ESP32工具链创建静态库..."
xtensa-esp32s3-elf-ar rcs libgolib.a golib.o

if [ $? -eq 0 ]; then
    echo "TinyGo静态库编译完成: libgolib.a"
    echo "库文件大小:"
    ls -lh libgolib.a
    
    # 检查符号
    echo "\n检查目标文件符号:"
    xtensa-esp32s3-elf-nm golib.o | grep -i add
    xtensa-esp32s3-elf-nm golib.o | grep -i mult
else
    echo "创建静态库失败!"
    exit 1
fi

echo "\n构建完成!"