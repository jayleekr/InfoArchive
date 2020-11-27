#include <iostream>

template <int N>
struct fibonacci
{
    static int64_t const value =fibonacci<N-1>::value + fibonacci<N-2>::value;
};
template<>
struct fibonacci<0>
{
    static int64_t const value = 0;
};
template<>
struct fibonacci<1>
{
    static int64_t const value = 1;
};

int main(){
    std::cout << fibonacci<40>::value <<'\n';
}