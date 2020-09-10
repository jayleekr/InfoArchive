# 꼼수
## x86_64위에서 qemu 로 target (e.g. aarch64)로 image 만드는법
https://github.com/multiarch/qemu-user-static

``` sh
$ docker run --rm -t arm64v8/ubuntu uname -m
standard_init_linux.go:211: exec user process caused "exec format error"
$ docker run --rm --privileged multiarch/qemu-user-static --reset -p yes
$ docker run --rm -t arm64v8/ubuntu
aarch64
```

# 2. FAQ
## 2.1 sudo 실행 문제
Host OS : Ubuntu 18.04 LTS 64bit
현상 : ./create-docker.sh에서 docker pull ubuntu은 되는데 그 이후에 access denied가 뜸

원인 : 
- docker 생성시 User계정으로 docker Image안에 User를 추가하는데, 
  sudo(superuser)계정으로 생성시 이를 실행시 중간에 abort된다
해결 :
- superuser로 실행시 막는 기능을 추가

## 2.2 /var/run/docker.run access denied
Host OS : Ubuntu 18.04 LTS 64bit
현상 : ./create-docker.sh에서 docker pull ubuntu은 되는데 그 이후에 access denied가 뜸

원인 :
- docker 를 최초 설치후 docker 그룹에 user계정을 추가하고 service docker restart 를 해서 재시작하면
  /var/run/docker.run 의 socket 에 접근이 되어야하는데, 일반적인 방법으로 해결되지 않았았다.
- 관련 : https://velog.io/@pop8682/Docker-Cannot-connect-to-the-Docker-daemon-at-unixvarrundocker.sock.-Is-the-docker-daemon-running-%EC%97%90%EB%9F%AC-%ED%95%B4%EA%B2%B0
해결 :
- 리부팅 하니 해결;;
- 리부팅만이 해결법
  - service restart 해결안됨
  - systemctl start & enable 해결안됨