# Summary of AP Demonstrator
## About

Adaptive Platform Demonstrator는 AP가 어떠한 방향과 철학으로 구현되고 있는 지를 보여주는 문서와 코드의 집합입니다.

R19-11 버전의 표준을 기준으로 아래와 같은 장소에 위치합니다.
> R19-11/APDemonstrator/AUTOSAR_SRC_AdaptivePlatformDemonstrator.zip

각각의 FC 모듈별 구현이 어느정도 되어있지만 표준 버전에 준하는 요구사항들이 모두 구현되어있지는 않습니다.

예를들어 Demonstrator의 Application Error for method communication의 구현은 아직 18-03 버전 기준입니다.

FC 미들웨어를 구현하는 분들은 General의 API EXP문서를 먼저 정독하시고 진행하시기를 추천드리며, FC Demonstrator의 제약사항들을 충분히 인지하셔야 합니다.

이 문서에서는 Demonstrator FC Design에서 다루는 각 FC의 Design 접근법과 원칙들을 요약합니다.

## FC CM
### Code 생성의 최소화
AUTOSAR model들은 모두 데이터 타입과 인터페이스 그리고 소프트웨어 컴포넌트


## Manifest(ARXML)

AUTOSAR Adaptive Platform Database schema 는 xsd파일로 되어있습니다.
이는 xml형식으로 해당 표준에서 다루는 모든 데이터 타입형식에 대해 정의하고 있습니다.

이 Schema로 부터 만들어 낼수 있는 것이 바로 Manifest(ARXML) 입니다.

아래는 APD에서 제공하는 ARXML들입니다.

1. Machine Manifest 
2. Stdcpptypes, stdctypes
3. Network Manifest
4. Package Management
5. System Components

### 1. Machine Manifest
#### 1.1 function_group_modes
##### 1.1.1 Lane_Change_Assistance
    ON/OFF
##### 1.1.2 MachineState
    Driving, Leaving, Off, Parking, Restart, Shutdown, Startup
##### 1.1.3 Pedestrian_Protection
    Off,On

#### 1.2 machines
##### DevelopementMachine
    

