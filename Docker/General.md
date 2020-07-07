# General
## About
* LXC(LinuX Container)기술의 등장 이후 전가상화(Full Virtualization) 및 반가상화의 시대는 저물고 있습니다. ([에뮬레이션과 가상화-naver blog][1])


## Container는 가상머신?
* Container 는 기존 hypervisor와는 완전히 달라서 filesystem만을 가상화 한다고 생각하면 좋습니다. 호스트 PC의 커널을 공유하고 init프로세스가 떠있을 필요가 없어 메모리사용량 측면에서 훨씬 cost-efficient합니다.

## Container Technologies
* Hypervisor기반의 가상머신에서는 머신별로 독릭적인 공간을 제공하고 서로가 충돌하지 않게하는 기술을 가지고 있습니다.
* Container에서도 이와 비슷한 역할을 하는 기능들을 리눅스에서는 커널에 내장하고 있습니다.(namespace)
  1. mnt : 호스트 파일시스템과 독립적으로 파일시스템을 mount/umount 가능
  2. pid : 독립된 프로세스 공간 소유
  3. net : namespace간에 network충돌 방지 가능
  4. ipc : 프로세스간의 독립적인 통신통로 할당
  5. uts : 독립적인 hostname 할당
  6. user : 독립적인 사용자 할당

* namespace를 통해 독립적인 공간을 할당한 후에는 nsenter라는 명령어를 통해 이미 돌아가고 있는 namespace 공간에 접근할 수 있습니다.
* docker에서는 exec가 비슷한 역할을 하고있습니다.

* cgroups(Control Groups)는 메모리, CPU, I/O, Network, device 노드(/dev) 리소스를 제어할 수 있습니다.

* lxc, libcontainer, runc는 위 기능들(namespace, cgroup)을 표준으로 정의해둔 OCI(Open Container Initative) 스펙을 구현한 컨테이너 기술 구현체입니다.
* LXC는 Canonical이 지원하고 있는 리눅스 컨테이너 프로젝트로 Docker 1.8 버전까지는 LXC를 이용해 구현해 사용했었습니다.
* 이후에 Docker는 libcontainer -> runC로 자체 구현체를 갖게 되었습니다.

## Dockerfile
  - Dockerimage를 배포하기 위해 필요한 textfile
  - Maintainer 이름을 설정할 수 있고, 환경변수 설정, mount설정, 각종 필요한 파일들을 복사하고 이동시켜 최초 개발환경세팅을 하기 편하게 해줍니다.


[1]:http://blog.naver.com/PostView.nhn?blogId=alice_k106&logNo=221179347223&parentCategoryNo=7&categoryNo=&viewDate=&isShowPopularPosts=true&from=search
