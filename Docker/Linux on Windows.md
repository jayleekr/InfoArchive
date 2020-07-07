# Linux on Windows

- General
  - Docker hub에 가보면 수 많은 ubuntu 관련 Image들이 올라와있음
    - [https://hub.docker.com/_/ubuntu](https://hub.docker.com/_/ubuntu)
  - version 별로 다양하게 있음
  - 18.04 bionic을 설치하도록 해보자
  - 사실 docker run 을 이용하면 이미지가 저장되어있는지 확인하고 다운로드(pull)하고 컨테이너 생성(create) 하고 시작까지한다
  - 그렇게 하지말고 우리는 Dockerfile 을 작성하여 각종 dependency와 option들을 한방에 처리하도록 하자
- WhatToDo & HowToDo
  - 무엇이 필요한지 알기위해서는 일단 ubuntu image를 기본으로 설치하여 package들을 하나 씩 설치하며 알아보자
- Example for dev environment Linux on Windows
  - docker run —rm —it ubuntu:18.04 /bin/bash
  - in ubuntu containter
    - apt-get update && apt-get -y upgrade
    - apt-get install -y build-essential git busybox net-tools vim cmake rsync wget curl inetutils-ping samba clang-6.0 python python-lxml xz-utils zlib1g-dev libdbus-1-dev pkg-config libboost-thread-dev libboost-log-dev libboost1.65-dev libboost-system-dev
    - echo -e "set nu\nset autoindent\nset smartindent\nset ruler\nset number\nset sm\nset tabstop=4\nset shiftwidth=4\nset title\nset cursorline\nset backup\nset incsearch\nsyntax on\nset hlsearch\nset history=100\ncolorscheme elflord" >> /etc/vim/vimrc
    - echo "export PS1='\[\e[1;32m\][\u@\h \W]\$\[\e[0m\]'" > /root/.bash_profile