# Bash 
## 1. About Bash Script

## 2. Honey Tips 꿀팁s
### 2.1 if 
#### 2.1.1 string comparision
"==" and "!=" only can be used in case of string comparision.
``` sh
if [ "$STRING" == "abc" ];then
    echo "STRING is abc!"
fi 
```

### 2.2 set 
#### 2.2.1 set -e
set -e 가 script 내에 실행되어있으면 해당 스크립트가 동작하는 환경은 script명령어가 error 를 발생하면서 죽었을때 다음 명령을 수행하지 않는다

### 2.3 exit
일반적으로 unix 에서는 0 은 성공, 1~255 는 error code 로 인식됨
인식되는 범위는 0~255 16bit
$? 로 결과값을 확인 가능
``` sh
$ cat test.sh
echo "hello"
exit 100
$ sh test.sh
hello
$ echo $?
100
```

### 2.4 eval
eval 뒤의 string arg 들을 command 로 실행하게 해줌 
string 수준에서 최종 Command 조작 후 실행시 유용하다

### 2.5 array
Bash 에서는 괄호로 Array를 표현가능하다
그 안에서 구분자는 아무래도 띄어쓰기(space bar) 이다

``` sh
$ cat array_ex.sh
#!/bin/bash
lists=("a" b "c")
echo ${lists[1]}
echo ${lists[0]}
echo ${lists[3]}
echo ${lists[2]}
$ sh array_ex.sh
b
a

c
```

### 2.6 sed
sed Utility를 사용안해본사람은 있어도 한번만
```sh 
sed 
```

### 2.7 while

필자는 while보다는 for문을 더 좋아하는 스타일이라 잘 쓰진않지만,
텍스트 파일로 부터 line 을 읽어들여 작업하는 용도로 좀 쓴다.

```sh
$ while read line; do git rm -r $line; done < remove.lst
```

## 3. Useful technics
## 3.1 Get Ip Address
``` sh
$ IPADDR=$(ifconfig eth0|grep inet|head -1|sed 's/\:/ /'|awk '{print $2}')
$ echo $IPADDR
172.17.0.3
```
## Apendix. References

General : http://tldp.org/LDP/Bash-Beginners-Guide/html/sect_07_01.html

