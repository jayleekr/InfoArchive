# 1. Useful Technics for git !!!

## 1.1 How to easily checkout files which are not staged yet
Untracked files are excluded in this case
``` sh
$ git status . -s -uno | awk '{print$2}' | xargs git checkout --
```

## 1.2 submodule

Submodule은 특정 저장소에 다른 저장소를 추가해서 관리가 가능하게 해주는 방식이다
부모-자식 저장소 관계를 갖게 된다.

처음 부모 Repository에서 Clone 해 왔을시, Submodule은 Clone이 되지 않는다.
이 때는 
``` sh
$ git submodule update --init --recursive
```
를 해주면 Remote저장소의 Submodule이 가르키고있는 Commit 으로 checkout 하게된다.
이 때, submodule은 최신이 아닌것 이다.

이를 최신의 것으로 Update 하고 싶으면?
``` sh
$ git submodule update --remote
```
위 와 같이 명령어를 쳐보자.

그러면 submodule을 최신상태로 update한다.

그 상태에서  parent repository에 git status 를 보면, 

## 1.3 format-patch

``` sh
$ git format-patch -1
```
위와 같은 커맨드는 patch 파일을 생성한다

## 1.4 branch

Remote 저장소에서 clone 해왔을때 처음엔 Base Branch(기본은 master)의 정보만 가져온다.
```sh
$ git clone https://ex.git
$ git branch
* master
```

여기서 아래 옵션으로 Remote저장소에서 관리중인 다른 Branch들도 확인 가능하다.
```sh
$ git branch -a
```

## 1.5 checkout
checkout의 주용도는 다른 branch로 이동하는 것이다.
그 외에도 원래 현재 branch의 마지막 staged 상태로 돌아가는 데에도 쓰인다

아래 커맨드는 remote에 있는 특정 브랜치를 fetch 해오며 checkout하는 커맨드이다.
``` sh
$ git checkout -t remote/<branch name>
$ git branch
  master
* <branch name>
```

