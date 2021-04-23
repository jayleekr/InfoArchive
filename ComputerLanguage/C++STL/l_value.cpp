// 모두 좌측값
int a = 1;                    // global 변수 a -> l-value
int& function(){              // l-value function은 return 하는 a의 주소값으로 초기화
    a = 3;                    // a-> l-value, 대입가능  
    return a;
}

int main()
{
    int i = 3;                // i 는 l-value
    i = 4;                    // i 는 l-value, 대입가능
                              // i -> 4
    int *ptr = &i;            // i 는 l-value & 연산자 참조가능, ptr는 i의 주소값을 가르킴
                              // *ptr 는 i의 값 -> 4
    ptr = &a;                 // ptr 는 int * 타입의 pointer이므로 참조하는 주소를 변경가능
                              // *ptr 는 a의 값 -> 1
    int & r = i;              // l-value인 i의 주소값으로 r은 초기화, 즉 r은 l-value 가 대입된 l-value
    r = 5;                    // r이 가르키는 주소값에 그 위치에 값을 씀, 즉 i의 값이 변함(r 과 i 는 5)
                              // r 과 i 둘 다 같은 주소를 가르키고있음 -> 5
    int c = function();       // l-vlaue의 참조는 초기화시에만 그 주소를 저장
                              // c -> function의 내부 스택의 연산후의 return 값인 바뀐 a 값 3
    function() = 50;          // function 은 l-value, r-value 50을 대입가능
                              // a 의 값이 50으로 변한다. 
                              // 그리고 ptr 는 a의 주소를 가르키므로 *ptr -> 50 으로 대입된다.
    int d = a;                // l-value d는 a 값인 50이 대입된다.
    int *ptr_2 = &function(); // int *타입의 ptr_2는 &function 가능(funtion은 좌측값이므로)
                              // function의 내부 스택의 연산후의 return 값인 바뀐 a 값 3
                              // * ptr_2 -> 바뀐 a의 값 -> 3
                              // c 의 값 도 변함 -> 3
                              // * ptr 의 값도 변함 -> 3
    return 0;
}