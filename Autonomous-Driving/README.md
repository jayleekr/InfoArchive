# Micellaneous for Autonomous-Driving
## 1. In-Vehicle Network IVN
### 1.1 차량이더넷 100Mbps/1Gbps IEEE802.3
  * QualCom Marvell
  * 올이더넷 차량을 위한 버스형 이더넷 (10BASE-T1S)
    * 2019년 표준화
    * CAN과 공존? 경쟁?
    * Radar 1.5~3.5Mbps 624us
    * Ultrasonic 0.3Mbps 624us
    * 10Mbps 까지 Support
    * 25/50/100  Bus Thunderbus(MultiDrop) 형으로 연구가 진행중
### 1.2 초고속 Automotive PHY 기술 비교
  * TI
    * 회사 독점기술
  * ASA (Automotive SerDes Alliance)
    * BMW, HMC 등 표준화 진행중
    * 가격이 저렴하고 고속
    * BMW, Continental, Broadcom, Marvell, NXP 
    * Coaxial -> STP+Coaxial
    * Up to 16Gbps
  * MIPI A-PH

### 1.3 고성능 IVN 기술 개발 이슈
  * 채널 왜곡 보상이 가능한 초고속 디지털 통신기술이 필요
  * 현재 10Mbps 수준
  * 토폴로지에 매우 민감

## 2. Operating System
### 2.1 RTOS
#### 2.1.1 QNX
#### 2.1.2 VxWorks

### 2.2 Linux
#### 2.2.1 AGL
  * Tizen OS 기반 차량용 OS
  * Tizen OS가 바다OS기반 모바일 구조이기 때문에 UI관련 기능포함 됨

#### 2.2.2 Web OS Auto
  * LG에서 만듬
  * QualCom SoC + Microsoft Azure
  * 
#### 2.2.3 ccOS (connected car Operating System)
  * 현대차 독자개발 중
  * 2020-05-12 현재 소식 찾아보기힘듬.. (?)

#### 2.2.4 Tesla OS
  * Tesla 독자 개발
  * Ubuntu 기반

#### 2.2.5 PikeOS
  * Vector
  * Adaptive MICROSAR와 연동

### 3. MCU/AP (Including SoC)
#### 3.1 Denvertor
  * Intel 제조
  * 14nm 공정 SoC
  * 2~16 Core
  * https://www.intel.co.kr/content/www/kr/ko/design/products-and-solutions/processors-and-chipsets/denverton/ns/atom-processor-c3000-series.html

#### 3.2 EyeQ5
  * Intel에 인수된 Mobileye 제조
  * Lidar 및 Radar 를 활용한 ADAS 플랫폼용 Chip
  * NN에 최적화
  * Tesla AutoPilot에 사용되었었음 (~2019)
  * 12TOPS(Tera operations per sec) 이상 
  * 10nm공정, FinFET 노드 설계
  * 40 Gbps IO
  * HSM(Hardware Scurity Module) 기반 보안기능 구축
  * OTA 제공

#### 3.3 Exynos 
  * Samsung 제조
#### 3.4 Renesas H3 (R-Car H3)
  * ASIL-B
    * https://www.renesas.com/tw/en/solutions/automotive/soc/r-car-h3.html
#### 3.5 AURIX
  * Infeneon
  * https://www.infineon.com/cms/en/applications/automotive/body-electronics-and-lighting/gateway 


### 4. Adaptive AUTOSAR
#### 4.1 Adaptive MICROSAR
  * Vector
    * SOME/IP 의 타이밍 이슈를 피하기 위해 V-IPC, SPI버스를 통한 이종간 통신구현
#### 4.2 Mobilgene Adaptive
  * Hyundai-autron
  