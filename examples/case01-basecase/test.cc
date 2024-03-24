#include "test.h"
#include "person.pb.h"


void Test::test()
{
    // 序列化
    Person p;
    p.set_id(11);
    p.set_age(23);
    p.set_sex("man");
    p.set_name("test-01");


    // 序列化对象 p, 最终得到一个字符串
    std::string output;
    p.SerializeToString(&output);

    // 反序列化数据
    Person pp;
    pp.ParseFromString(output);
    std::cout << "id: " << pp.id() << ", "
              << "name: " << pp.name() << ", "
              << "sex: " << pp.sex() << ", "
              << "age: " << pp.age() << std::endl;
}