#include <iostream>
constexpr int  fibonacci(int n){
    return n>=2 ? fibonacci(n-1) + fibonacci(n-2): n;
}

template<int N>
struct constN{
    constN(){ std::cout << N << '\n';}
};

int main(){
    //constN <fibonacci(40)> a; // Compile time
    std::cout <<fibonacci(40)<<'\n';  //Run time
}