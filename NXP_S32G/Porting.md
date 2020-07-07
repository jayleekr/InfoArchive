# Porting to S32G

## About S32G
###  Features
- Quad Arm® Cortex®-A53 cores with Arm Neon™ technology organized in two clusters of two cores with optional cluster lockstep for applications and services
- Triple Arm Cortex-M7 lockstep cores for real-time applications
- Low Latency Communications Engine (LLCE) for automotive networks acceleration
- Packet Forwarding Engine (PFE) for Ethernet networks acceleration
- Hardware Security Engine (HSE) for secure boot and accelerated security services
- Advanced functional safety hardware and software for ASIL D systems
- AEC-Q100 Grade 2 device (-40°C to 105°C)

### Architecture

![](images/arch.png)

## Download BSP

[Link](www.nxp.com/activation)에서 지급받은 activation code를 입력하면 다운로드 페이지로 접근이 가능해 집니다.

## 개요
이 문서에서는 NXP사에서 개발한 차량환경 네트워크 프로세서 S32G를 간략하게 소개하고, 이를 타겟보드로 삼아 mobilgene Adaptive를 포팅하는 방법에 대해 다룹니다.

### About NXP S32G
S32G는 NXP Semiconductor 에서 CES2020에서 발표한 차량용 네트워크 프로세서입니다.

MCU로 3쌍의 저전력 Arm Cortex-M7과 AP로 4개의 Arm Cortex-A53, 전용 네트워크 가속 엔진(차량용 및 이더넷 네트워크), 다양한 메모리 인터페이스 등을 제공합니다.


기능안전성 ASIL D을 만족하며 Service-Oriented Gateway역할을 수행할 수 있게 제작된 것이 특징입니다.


참고자료 링크 : https://www.nxp.com/products/processors-and-microcontrollers/arm-processors/s32-automotive-platform/s32g-safe-and-secure-vehicle-network-processor:S32G274A?tid=vanS32G274A

### Target Board
Mar 16, 2020 기준으로 S32G는 아직 Pre-Production 상태의 제품입니다.

NXP에서 공식적으로 제공하는 BSP(Board Support Package)는 U-boot Bootloader, Linux Kernel Image, Rootfs 세가지로 구성됩니다.

메뉴얼에서 제공하는 빌드환경은 Ubuntu 18.04 LTS(Native or VM)에서 Yocto를 이용합니다.

## Linux BSP Installation
### Getting Yocto Image
필요 package : python(2.6이상), git (1.8.3 이상), curl, repo

How to get yocto image
``` sh
$ mkdir fsl-auto-yocto-bsp
$ cd fsl-auto-yocto-bsp
$ repo init -u  https://source.codeaurora.org/external/autobsps32/auto_yocto_bsp -b release/bsp24.0
$ repo sync
```
### Build Linux BSP
fsl-auto-yocto-bsp 디렉토리에서 시작합니다.

Yocto Build는 50GB이상의 저장공간이 필요합니다. (2~10시간의 시간소요)

Host OS의 빌드계정의 권한설정을 미리 해주시기 바랍니다.

(/etc/sudoer 에서  )

아래와 Release Version으로 빌하는 예제입니다.

Machines : s32g274aevb
Images : fsl-image-auto


1. 첫 설치시 호스트 환경 세팅
    Host OS Setup
    ``` sh
    $ ./sources/meta-alb/scripts/host-prepare.sh
    ```
2. Build Directory 생성
    Create Build Dir
    ``` sh
    $ source nxp-setup-alb.sh -m s32g274aevb
    ```
3. 빌드

    build
    ``` sh
    $ bitbake fsl-image-auto
    ```

위와 같이 빌드 시, <builddirectory>/tmp/deploy/images/ 에 이미지가 위치하게 됩니다.

## Board Setup
생성된 이미지를 Porting 하기 위해서는 Target Board의 몇가지 설정이 필요합니다.

### Jumper Setting for sdcard bootup
### Setup the sdcard
### Booting
### Terminal setting for tty console


## Port mobilgene Adaptive to Board


## Test


## Reference
[0] Auto_Linux_BSP_24.0_S32G274A_User_Manual.pdf

[1] Auto_Linux_BSP_24.0_S32G274A_Quick_Start.pdf

[2] pb423040 - S32G Product Brief - Rev.4 (4.0).pdf

