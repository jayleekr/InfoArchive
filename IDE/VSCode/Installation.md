# 1. Linux (Debian)

## 1.1 Add apt repository

``` sh
$ curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
$ sudo install -o root -g root -m 644 packages.microsoft.gpg /etc/apt/trusted.gpg.d/
$ sudo sh -c 'echo "deb [arch=amd64 signed-by=/etc/apt/trusted.gpg.d/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
```
## 1.2 Apt update and install
``` sh
$ sudo apt-get install apt-transport-https
$ sudo apt-get update
$ sudo apt-get install code
```


## 1.3 Through Web Browser

URL : https://code.visualstudio.com/


# 2. Windows 10

## 2.1 Through Web Browser
URL : https://code.visualstudio.com/

## 2.2 Choco
Powershell또는 CMD를 열자
```sh
choco install vscode
```

### 2.2.1 What is Choco?
windows 환경에서 cli로 동작하는 Package Manager이다.

### 2.2.2 When to Use?
서버에서 aws, google cloud, azure 등을 사내정책 등에 의해 막는 경우가 있다.

이 경우 pandoc, git 등 필수 package를 설치하고 싶어도 못하는 경우가 발생한다. 

하지만 Choco를 이용해 Ubuntu의 apt처럼 package 설치를 할 수 있다.

### 2.2.3 Install Choco on Windows

Link : [https://chocolatey.org/install]

1. powershell을 관리자 계정으로 연다.
``` sh
Set-ExecutionPolicy Allsigned
```
   - 실행 권한을 준다.
2. 설치 command line을 입력한다.
``` sh
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```