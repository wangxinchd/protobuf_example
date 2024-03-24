# 案例运行过程

如果在 protobuf_example/third_party/protobuf-3.21.12/tools 路径中 执行下面命令
```bash
./protoc --proto_path=仓库路径/protobuf_example/examples/case01-basecase person.proto --cpp_out=仓库路径/protobuf_example/examples/case01-basecase
```
在case01-basecase 目录中可以看到生成了文件 person.pb.h person.pb.cc两个文件。
这两个文件就是 person.proto对应的cpp h文件

如果在 protobuf_example/third_party/protobuf-3.21.12/tools 路径中 执行下面命令
```
./protoc -I仓库路径/protobuf_example/examples/case01-basecase person.proto --python_out=仓库路径/protobuf_example/examples/

```
在case01-basecase 目录中可以看到生成了文件 person_pb2.py 文件。
这两件就是 person.proto对应的python文件


目前命令已经通过cmake实现，实际上运行只需要
在protobuf_example目录执行，如下命令
仅仅支持ubuntu 16.04，其他系统静态库需要重新编译
```
mkdir build
cd build
cmake ../
make -j16
```