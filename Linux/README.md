# Linux Info Archive

## /sbin/init

/sbin/init은 부트프로세스의 일부를 주관하며 사용자를 위한 환경을 설정합니다.

시스템 부팅시 부트로더는 커널을 메모리로 불러오고, 이는 모든 필요한 모듈을 순서대로 불러오며 읽기 전용 루트 파티션을 마운트합니다.

커널은 부트프로세스의 제어를 /sbin/init 프로그램으로 넘깁니다.

/sbin/init 프로그램은 모든 서비스 및 사용자 공간 도구를 읽어오며 /etc/fstab에 있는 모든 파티션을 마운트 합니다.

init 명령이 시작할 때 이는 시스템에서 자동으로 시작하는 모든 프로세스의 부모 또는 조부모가 됩니다. 이는 /etc/rc.d/rc.sysinit 스트립트를 실행하여 환경 경로, 스왑시작, 파일시스템 확인, 시스템 초기화에 필요한 다른단계를 실행합니다.
