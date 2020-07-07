## Adaptive Platform
### Physical View
    해당 섹션에서 언급하는 내용들은 예제를 들기 위한 내용들이다
#### OS, processes, and threads
    AP의 OS는 multi-process POSIX OS capability를 제공해야한다

    각각의 AA는 독립된 process로 구현되고, 그것의 논리 메모리 공간과 namespace도 독립되어야한다

    하나의 AA는 여러 Process들을 가질수 있다. 이는 또다시 하나의 AP instance에 deploy될수도 있고, 분산되어 여러 AP instances에 있을 수도있다

    모듈의 시각으로는 각각의 process는 executable로부터 OS에 의해 Instance 화 된다

    Multi processes가 하나의 Instance로 부터 Instance화 될 수 도있다

    게다가 AA는 여러개의 executable을 구성한다.


    FC는 보통 process들로 구현된다
    FC도 하나의 process 또는 여러개의 process들로 구현가능하다
    APS와 NPS(Non-Platform Services) 역시 process들로 구현된다

    이러한 모든 process들은 single- 혹은 multi-threaded process일 수 있다
    하지만 그들이 사용가능한 OS API는 각각의 process들이 사용하는 logical layer에 따라 다를 수 있다
    만약 AA가 ARA위에서 구동된다면 PSE51을 따를 것이지만, 어떤 process가 FC들 중 하나라면 어떠한 OS interface를 써도 상관없다

    결로적으로 OS입장에서는, AP와 AA는 process들의 집합일 뿐이고, 각각은 하나이상의 thread들을 가지고 있는 것이다

    이러한 프로세스들은 IPC를 통해 통신할 수 도 있고 다른OS 기능으로 통신이 가능하다
    (AA process들은 IPC로 직접 통신하는 것이 불가능하며 ara::com을 통해야만 한다)

#### Library-based or Service based FC implementation
    FC는 APF module이 될 수도 있고 APS가 될 수도 있다
    위에서 언급했듯이 이 것들은 모두 프로세스이다
    
    그것들이 AA들과 통신하기위해서는 IPC가 필요하다

    2가지 방식이있는데
    1. Library-based design - FC가 제공하는 interface lib가 직접적으로 AA에 연결되어 IPC를 직접 부르는 방식
    2. Service-based design - process가 CM 기능을 사용하여 AA에 연결된 Server Proxy lib를 부르는 방식
    이다.

    Proxy lib는 CM interface를 부르고, 이는 AA process와 Server process 사이의 IPC를 조종한다
    (AA가 CM을 통하여 IPC를 직접 호출하거나 직접적인 IPC와 proxy library를 이용하는 Server를 혼용하여 사용하느냐는 구현체의 정의에 따라 달라진다)    

    FC의 디자인은 보통, AP Instance가 local에서 이용된다면 Library-based가 적절할 것이고 효율적일것이다

    반대로 AP Instance가 분산되어 사용된다면 Service-based로 구현해야 할 것이다.

    APF에 속하는 FC는 **Library-Based**이고, APS는 **Servicee-based** 이다(이름에서 언급하듯)

    결론적으로 FC의 구현체는 꼭 process를 가지지 않고 library의 형태로도 존재할 수 있다. 만약 AA process의 context에서 FC가 정의된 RS(Requirement Specification)와 SWS(SW Specification)만 잘 충족한다면 말이다

    이러한 경우에 AA와 FC의 통신은 일반적인 precedure call 일 것이다(IPC는 아니다)

#### The interaction between Functional Clusters
    FCs는 AP의 구현 방식에 의해 통신하며 그들은 ARA interface에 국한되지 않는다(PSE51에서는 IPC의 사용이 제한됨). 아마도 다른 FCs의 ARA interfaces들을 이용할 것이다(public으로 선언된)

    FCs사이에 통신의 전형적 예제는 FC의 __protected__ interfaces를 사용하는 것인데, 이는 privileged 한 접근 권한이 요구된다
    
    AP18-03 Release에서는 IFC(Inter-Functional-Cluster)를 제안했다. 여기서는 FC에서 다른 FC들로의 interface들을 제안한다. 이는 ARA의 scope도 아니고 AP 구현체의 공식적인 specification requirements도 충족하지 않는다
    
#### Machine/hardware
    AP는 실행되는 하드웨어를 **Machine**으로 간주한다
    이론적 이유는 어떠한 가상화기술을 사용하던지 관계없이 일관된 Platform View를 얻기 위함이다

    Machine은 Physical machine일수도 있고, 완전 가상화된 machine일 수도 있고, 반가상화 OS일 수도 있고, OS-level-virtulized container 혹은 다른 가상환경일 수도 있다

    하드웨어 입장에서 Machine은 하나이상일 수도 있고, 하나의 AP Instance만이 하나의 Machine에서 동작한다
    이는 이 __하드웨어__가 하나의 chip을 통해 하나이상의 Machine을 호스팅할 수 있다는 뜻이기도 하다

    그러나 여러 Chip들이 하나의 Machine을 구성하는 것도 가능하다(AP Implementation이 허용한다면 말이다)


    