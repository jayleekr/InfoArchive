# Install on Linux

## Sequence
1. repository 의 package 정보를 최신 상태로 만든다.<br>
$ sudo apt-get update
2. 필요한 packet install<br>
$ sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common
3. gpg key 추가 작업<br>
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
1. 추가된 gpg key 확인<br>
$ sudo apt-key fingerprint 0EBFCD88 <br>
pub rsa4096 2017-02-22 [SCEA]<br>
9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88<br>
uid [ unknown] Docker Release (CE deb) docker@docker.com<br>
sub rsa4096 2017-02-22 [S]

1. repository 추가 작업<br>
    $ sudo add-apt-repository "deb \[arch=amd64\] https://download.docker.com/linux/ubuntu\$(lsb_release -cs) stable"<br>
    $ apt-get install
    apt-transport-https 
    ca-certificates
    curl 
    gnupg-agent 
    software-properties-common<br>
    curl -fsSL [https://download.docker.com/linux/ubuntu/gpg] | sudo apt-key add -<br>
    \$ sudo add-apt-repository "deb [arch=amd64] [https://download.docker.com/linux/ubuntu]$(lsb_release -cs)stable"