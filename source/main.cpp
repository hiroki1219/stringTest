#include <iostream>

int main( void )
{
    char c[10];
    std::string s;

    std::cout << "string size   : " << s.size() << std::endl;
    std::cout << "char[10] size : " << sizeof( c ) << std:: endl;
    return 0;
}
