## Methodology and Manifest
### Methodology
    See more details in AUTOSAR_TR_AdaptiveMethodology
![](Images/AP_dev.png)

### Manifest
    Manifest는 AUTOSAR 모델 명세의 일부를 표현한다
    이는 AUTOSAR AP Product의 설정을 지원하기 위함이며 또 이는 AUTOSAR AP Product에 업로드 된다
    업로드는 Manifest가 적용되는 다른 artifacts(e.g. bin 파일)의 조합으로 된다

    Manifest를 AUTOSAR AP에만 이용되지만 프로젝트 개발 과정에서 생성된 ARXML들이 모두 Manifest라는 것은 아니다
    (AUTOSAR AP가 차량 프로젝트에 독점적으로 이용되고 있지 않기때문)

    일반적으로 차량은 CP(Classic Platform) 위에서 동작하는 수많은 ECU들을 장착하고 있을 것이다. 그러므로 차량 시스템의 전체 Design은 CP위에서 동작하는 ECU와 AP위에서 동작하는 ECU 둘다를 고려하여 만들어진다

    원칙적으로는 Manifest는 하나만 존재하여 모든 배포과정이 이안에 녹아있어야 하지만 Manifest와 관련된 model 요소들이 존재하고, 이 요소들은 또 완전 다른 개발 프로젝트와 관련이 있기 때문에 사실 상 여러개로 존재하여야만 한다

    1. Application Design
    - AP application SW의 design 관련한 모든 명세를 담는다
    - 항상 AP machine에 배포되어야할 필요는 없지만, Application Design은 Execution manifest와 Machine manifest를 도와 Application의 정의를 좀 더 명확히 도와준다
    2. Execution Manifest
    - AP위에서 구동하는 application의 배포관련한 정보들을 명기한다
    - 실제 machine에서 구동될 executable code들을 실행하기 위한 code들과 묶음으로 제공된다
    3. Service Instance Manifest
    - SOC(Service Oriented Comm')이 동작하기 위하여 Trapsport 계층에서 필요한 요구사항들을 명기한다
    - 각각의 SOC의 usage를 구혀한 executable code와 함께 제공된다
    4. Machine Manfest
    - AP를 구동하는 Machine의 설정들에 적용되는 배포관련 정보들을 담는다
    - AP의 Instance들을 구성하기위해 필요한 sw들을 포함한다
    
    위 4가지 외에도 AUTOSAR Methodology에서는 System Design도 지원을 한다
    System Design은 하나의 System에서 사용하는 CP와 AP 모두의 SWC(SW Component)들을 명기한다 
    
### Application Design
    Application Design에서는 다음과 같은 사항들을 다룬다

    1. sw design과 implementaion을 classify하는 Data type
    2. SOC를 위한 중추적(pivotal) Service interface
    3. persistent data/file에 접근하기위한 중추적 Persistency Interface
    4. Application이 접근하는 persistent data에 대한 정의
    5. Application이 접근하는 file에 대한 정의
    6. Application이 접근하는 crypto sw의 정의
    7. Application이 접근하는 PHM에 대한 정의
    8. Nework의 Transport게층에 data가 직렬화(Serialized)되어 있는지에 대한 Property 정의
    9. REST API를 이용한 web서비스의 통신을 위한 REST Service Interface 정의
    10. Client와 Service의 Capability
    11. SW배포를 쉽게 하기위한 Application의 Grouping

### Execution manifest
    Execution manifest의 목적은 실제 application을 AP에 배포할 때 필요한 정보들을 제공하는 것이다

    최대한 Application SW code를 독립적으로 유지하여 배포 시나리오에서 SW가 다른 배포 시나리오에도 재사용 가능하도록 하는 것이 중점 아이디어

    Execution manifest에서는 application들의 instance화를 제어하므로 다음과 같은 것들이 가능해 진다
    1. 같은 Machine 내에서 같은 application을 여러번 instance화 할 수 있다        
    2. Application을 여러 Machine들에 배포 할 수있고, Machine마다 Instance화 할 수 있다
    
    Execution manifest는 다음과 같은 사항들을 다룬다
    1. Application instance가 어떻게 실행되는지에 대한 Startup 설정. 이는 startup option들과 access role들도 정의한다. 각각의 Startup은 machine state와 function group states에 따라 다를 수 있다
    2. Resource Management(특히 group assignment시)

### Service Instance Manifest
    네트워크 위에서 SOC를 구현하기 위해서는 사용하는 comm' technology(e.g. SOME/IP)의 설정이 요구된다
    Communication Infrastructure는 서비스의 Provider나 Requesters 모두에게 동일하게 동작하기 때문에, 서비스의 구현은 양측에 호환이 되어야만 한다

    Service Instance Manifest는 다음과 같은 사항들을 다룬다
    1. 서비스가 특정 통신 기술위에서 어떻게 표현되는지에대해 정의한 Service Interface Deployment
    2. 제공되고 요구되는 특정 서비스 Instance들을 위해 통신기술의 요구되는 보안정보(Credentials)을 정의한 Service Instance Deployment
    3. E2E Protection 설정
    4. Security Protection 설정
    5. Log and Trace 설정

### Machine Manifest
    Machine manifest는 특정 hardware에서 동작하는 AP instance의 설정을 할 수 있도록 한다

    Machine manifest는 다음과 같은 사항들을 다룬다
    1. 통신 연결 설정과 통신 기술 기초 보안정보들을 정의한 설정(e.g. 이더넷사용을 위해 static IP address 나 dhcp 정의를 포함)
    2. 서비스 탐색 기술 설정(e.g. SOME/IP 사용을 위해 IP port와 IP multicast address를 포함)
    3. 사용된 machine의 상태를 정의
    4. 사용된 function group들을 정의
    5. AP FC 구현체들의 정의(e.g. OS는 특정 권한을 가진 OS users를 제공)
    6. Crpyto platform Module의 설정
    7. PHM 설정
    8. TSYNC 설정 
    9. 이용가능한 HW resource의 Documentation(e.g. available RAM, processor core 개수)
   
