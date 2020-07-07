# Yocto

## Related Package To Build Yocto

build-essential \
chrpath \
diffstat \
gawk \
gcc-multilib \
git \
language-pack-en-base \
libsdl1.2-dev \
locales \
socat \
texinfo \
unzip \
wget \
xterm \
clang-format \
clang-tidy \
cppcheck \
python \
python-crypto \
python-pip \
python-pexpect \
python3 \
python3-crypto \
python3-pip \
python3-pexpect \
clang \
cmake \
cpio \
debianutils \
doxygen \
iptables \
iputils-ping \
libboost-all-dev \
libdbus-glib-1-dev \
net-tools \
pkg-config \
xz-utils \
zlib1g-dev 

## 2. Bitbake

### 2.1 Bitbake ?
OpenEmbedded 프로젝트에서 사용하는 Build tool

### 2.2 Build Sequence
1. 소스코드 다운로드 및 관련 파일 다운로드 
2. 소스코드 압축해제 및 patch 작업
3. 설정작업(configure) 
4. 컴파일 작업
5. 패키징 작업

### 2.3 Need to know before studying Bitbake..

#### 2.4.1 Configuration
   * conf/machine
     * Machine 정보
   * conf/distro
     * 관련 파일의 위치에 관한 정보
   * conf/local.conf
     * 사용자 관련 정보

#### 2.4.2 Work space
   * poky 로 환경 설정을 하게 되면 tmp directory 안에 아래와 같은 항목들이 생성된다.
     * stamps
       * 사용자 관련 정보
     * work
       * Working Directory이다.
       * 소스코드가 추출되고, 패치가 적용되고, 컴파일되고, 모든 패키지가 만들어지는 제일 중요한 위치이다.
     * deploy
       * 빌드 후 생성된 결과물이 배포되는 곳 이다.
     * 나머지는 생략ㅋㅋ :D  
   * tmp/work :D 
     * 소스를 저장하는 장소
     * recipe에서는 working directory (WORKDIR) 라고 한다.
     * bitbake에서 각 recipe는 WORKDIR아래 각 서브 디렉토리를 생성하고 작업을 진행한다.
     * 서브디렉토리는 [machine]-[os]/[recipename]/[verion] 으로 생성된다.
       * 예시
       * tmp/work/all-fsl-linux/packagegroup-core-ssh-openssh/1.0-r1
       * tmp/work/aarch64-fsl-linux/qemuwrapper-cross/1.0-r0
   
#### 2.4.3 Tasks
   * Bitbake에서 정의하는 빌드를 위한 과정 "task"
   * fetch
     * 필요한 소스코드를 다운로드하거나 저장소를 체크하는 작업
   * unpack
     * 압축 해제 하는 작업
   * configure
     * autotool이나 cmake등으로 설정하는 작업
   * compile
     * compile 작업
   * populate_staging(stage)
     * 다른 패키지가 빌드하는데 필요한 라이브러리나 헤더파일을 만드는 작업
   * install
     * 실제적인 인스톨 작업을 담당
   * package
     * 파일을 설치하는 작업을 하고 파일들을 패키지마다 디렉토리에 별도로 분류
   * pakage_write
     * 패키징 (.rmp .deb .ipk)

#### 2.4.4 Single Recipe 작업하기
   * ex) bitbake -b bb-file -c clean
   * ex) bitbake -b bb-file -D

   * Options
     * -b bb-file
       * 레시피 파일 지칭
     * -c action
       * 특정 task action 수행(fetch, unpack, patch, configure, compile)
     * -D
       * debugging info
     * -f
       * Force!

#### 2.4.5 Recipe Basics
   * function
     * task의 구현체
     * ex) do_install(), do_compile()
     * 기본 구현체를 override한다
   * variables
     * S,D, PR 등 변수(아래에서 자세히 다루겠다)
   * keywords
     * inherit : 공통기능을 포함하기위한 상속용
     * include or require : 다른 recipe파일을 포함
     * export : 외부로 변수값을 알림

#### 2.4.6 Recipe 
   * Naming : packagename_version.bb
   * Variables
     * PR 
       * 버전을 나나태는 변수
       * 값이 없을시 r0가 default값이다.
       * ex) PR = "r1"
     * PN
       * 패키지 이름
       * recipe name에서 첫 "_"가 나오기 전까지를 나타낸다
   * Header
     * DESCRIPTION
       * 소프트웨어의 설명
     * HOMEPAGE
       * URL?
     * PRIORITY
     * LICENSE
       * 라이센스 정보를 나타낸다. (필수)
   * Source
     * 빌드할 타겟 소프트웨어를 어디서 어떻게 얻는지를 정의한다.
     * SRC_URI 변수를 통해 지정한다.

   * Directory : What goes where
     * WORKDIR : Working Directory
       * 소스코드가 풀어지고, 일반파일이 복사되고 로그나 일스톨 파일이 만들어짐
     * S : Unpacked source code directory
       * 패치가 적용되고 컴파일될 위치
       * ex) 
         * SRC_URI = "http://www.example.com/software/widgets-${PN}.tar.gz"
         * S = "${WORKDIR}/widgets"
       * 위예제에서는 소스를 다운로드 받아 widgets dir에 압축을 해제 한다
     * D : Destination directory
       * 프로그램 패키지가 설치될 위치
       * ex) ${D}/usr/bin
       * Default 경로는 ${WORKDIR}/image 
     * FILE, FILE_DIRNAME, FILESDIR, FILESPATH
       * 발견되어진 파일들을 관리하는데 사용 된다.
     
### 2.4 Recipe Development 과정

fetch -> unpack -> patch -> lincense -> configure -> compile -> install -> packaging -> post-installation -> runtime Testing

#### 2.4.1 do_fetch
#### 2.4.2 do_unpack
#### 2.4.3 do_prepare_recipe_sysroot
#### 2.4.4 do_patch
#### 2.4.5. do_generate_toolchain_file
#### 2.4.6. do_configure
#### 2.4.7 do_compile
fetch, unpack, configure 이후에 작업이 된다

#### 2.4.8 do_install
패키지화 되어있는 파일들을 ${D}에 복사한다
autotool이나 cmake 툴을 이용해도 된다.
manually configuring 하려면 "install -d" command 로 디렉토리를 만들어야한다.


#### 2.4.7 do_deploy
${B} 에서 실행해야한다
inherit deploy 로 가능
Recipe 에서는 ${DEPLOYDIR} 에 Output을 써야한다.
sstate mechanism이 ${DEPLOYDIR} 에서 ${DEPLOY_DIR_IMAGE}에 Copy하기 때문
${DEPLOY_DIR_IMAGE} 에 output files 을 write한다.


#### 2.4.8 do_build
Default 명령어
모든 작업들을 다 하는 듯 하다

#### 2.4.9 do_package
${D} 에 있는 contents들을 분석하여 packages와 files들의 subsets으로 나눈다.
이 Task는 ${PACKAGES} 와 ${FILES} 변수로 관리 되어야한다

#### 2.4.10 do_package_write_tar
${DEPLOY_DIR_TAR}에 .tar 형태로 생성한다

#### 2.4.11 do_package_write_deb
${DEPLOY_DIR_TAR}에 .deb 형태로 생성한다


#### 2.4.13

