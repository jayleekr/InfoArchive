#include <memory>
#include <utility>
float CaculateAverage(){
    float average=3;
    // ...
    return average;
}

int main(){
    int num = 10;
    // int && rNum = num;                   // Error!!! num 은 l-value -> int & lnum 은 가능
    int && rNum = std::move(num);           // Error!!! num 은 l-value -> int & lnum 은 가능
    int && rNum1= 10;                       // OK, 10 은 r-value
    float&& rAverage = CaculateAverage();   // OK CaculateAverage 는 r-value
}