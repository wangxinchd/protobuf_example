# protobuf教程
protobuf也叫protocol buffer是google 的一种数据交换的格式，它独立于语言，独立于平台。google 提供了多种语言的实现：java、c#、c++、go 和 python 等，每一种实现都包含了相应语言的编译器以及库文件。
由于它是一种二进制的格式，比使用 xml 、json进行数据交换快许多。可以把它用于分布式应用之间的数据通信或者异构环境下的数据交换。作为一种效率和兼容性都很优秀的二进制数据传输格式，可以用于诸如网络传输、配置文件、数据存储等诸多领域。

考虑到protobuf后面会用于数据的序列化，主要用于自动驾驶系统数据的写文件，所以这里整理了protobuf的常用案例

# 安装
采用Ubuntu 16.04的镜像，下载的版本是3.21.12 具体下载链接：https://github.com/protocolbuffers/protobuf/releases/tag/v3.21.12
执行下面的命令可以完成编译：
```bash
mkdir build
cd build
cmake -Dprotobuf_BUILD_TESTS=OFF ../  # .gitmodules文件显示需要第三方库，采用这个命令避免编译第三方库的gtest
make -j16
```
编译完成之后，在build的路径下面存在：
```bash
drwxr-xr-x  3 uisee uisee     4096 Mar 24 14:10 lib/cmake  #里面主要是生成的*.cmake文件，其中包括了 PROTOBUF_GENERATE_CPP 函数的定义
-rw-r--r--  1 uisee uisee  3308670 Mar 24 14:10 libprotobuf-lite.a
-rw-r--r--  1 uisee uisee 26270610 Mar 24 14:10 libprotobuf.a # 静态库，后续需要使用
-rw-r--r--  1 uisee uisee 29913870 Mar 24 14:11 libprotoc.a
lrwxrwxrwx  1 uisee uisee       16 Mar 24 14:11 protoc -> protoc-3.21.12.0* # proto转代码工具
-rwxr-xr-x  1 uisee uisee  9681480 Mar 24 14:11 protoc-3.21.12.0*
```
其中：protoc为编译生成的工具，可以用于对proto文件构建对应的.cc 和 .h的，也可以构建成python的
这里编译采用的是静态编译，如果使用ldd protoc可以发现仅仅只有系统基础的动态库。

# 项目文件说明
- .vscode 用于保存这个项目的特殊设置
- cmake 里面自己实现了一版本 Findprotobuf.cmake，用于通过 find_package(protobuf REQUIRED) 找到protobuf项目自己的设置
- examples 里面记录了各种case
  -- case01-basecase 最简单的case，确定序列化或者反序列化能够基本跑通
- CMakelists.txt 外部编译开始的文件
- LICENSE protobuf文件的证书
- third_party/protobuf-3.21.12
  -- cmake 从编译成功的build目录中copy过来的，但是里面的PROTOBUF_GENERATE_CPP 函数实现存在问题，自己重新修改之后保留了
  -- include 来自protobuf中编译需要的声明。copy protobuf-3.21.12/src/google 里面的.h文件，去掉了所有.cc文件
  -- lib 从编译成功的build目录中copy过来的静态库
  -- tools 从编译成功的build目录中，copy过来的 protoc 工具【由于这个工具是静态链接的 protobuf库，所以使用不需要设置环境】
