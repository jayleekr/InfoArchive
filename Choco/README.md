# Readme.md
|Author|Jay Lee|
|-|-|
|Last Edit|2020.02.27|
|E-Mail|jayleekr0125@gmail.com|

## What is Choco?
windows 환경에서 cli로 동작하는 Package Manager이다.

## When to Use?
서버에서 aws, google cloud, azure 등을 사내정책 등에 의해 막는 경우가 있다.

이 경우 pandoc, git 등 필수 package를 설치하고 싶어도 못하는 경우가 발생한다. 

하지만 Choco를 이용해 Ubuntu의 apt처럼 package 설치를 할 수 있다.

## Install on Windows

Link : [https://chocolatey.org/install]

1. powershell을 관리자 계정으로 연다.
2. Set-ExecutionPolicy Allsigned
   - 실행 권한을 준다.
3. 설치 command line을 입력한다.
```
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
```

4. 완료!

