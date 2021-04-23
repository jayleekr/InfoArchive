#include <memory>
#include <utility>
float CaculateAverage(){
    float average=3;
    // ...
    return average;
}

int main(){
    int num = 10;                           // num -> l-value
    //int && rNum = num;                      // Error!!! num 은 l-value -> int & lnum 은 가능
    int && rNum = std::move(num);           // l-value인 num을 참조할 수 있도록 해주는 move
    num = 30;                               // num 을 바꾸면 rNum도 바뀐다 (reference 값이기때문)
    
    int && rNum1 = 10;                       // OK, 10 은 r-value

    float && rAverage = CaculateAverage();   // OK CaculateAverage 는 r-value
    float tmp_1 = std::move(rAverage);       // tmp_1 는 l-value, 즉 대입됨
    float tmp_2 = rAverage;                  // tmp_2 는 l-value, 즉 대입됨
    float && tmp_3 = std::move(rAverage);    // tmp_3 는 l-value, reference 값
    rAverage = 1.0f;                         // rAverage 를 바꾸면 tmp_3 값만 바뀜, tmp_1, tmp_2 는 대입
}