#include <iostream>
int fibonacci(int n){
    if (n >= 2) 
        return fibonacci(n-1) + fibonacci(n-2);
    else
        n;
}

int main(){
    std::cout << fibonacci(40) <<'\n';
}