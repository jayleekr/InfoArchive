## Adaptive Platform
### Architecture
#### Logical View
    ARA(AUTOSAR Runtime for Adaptive applications)
    ARA는 application interface들로 구성된다
    Application interface들은 APF(Adaptive Platform Foundation) 혹은 APS(AP Service)에 속하는 FC(Functional Cluster)들로 구성되어있다
    APF는 AP의 기초적인 기능들을 제공하고 APS는 AP의 플랫폼 표준서비스를 제공한다

    모든 AA(Application)는 다른 AA에게 서비스 제공이 가능하다
![](Images/architecture.png)

#### Language binding, C++ Standard Library, and POSIX API
    Language는 C++기반으로 되어있으며 c++ STL은 ARA의 일부로서 이용가능하다
    OS API는 PSE51 interface가 ARA의 일부로 이용가능하다
    (C++ STL은 POSIX 기반의 많은 interface들을 포함한다)

    C++ STL Threading과 native PSE51 threading interface를 혼용하여 사용하지 않기를 권장한다

    C++ STL은 PSE51의 모든 기능을 포괄하고 있지는 않다. (e.g. thread scheduling policy)

    이러한 경우에는 두 interface들을 조합하여 사용해야 할 것이다.


#### Application launch and shutdown
    Lifeycle은 EM(Excution Management)에서 관리한다

    FC도 사실 EM으로부터 실행되는 application에 불과하다

    다음 그림은 AP내의 다양한 타입의 application들을 나타낸다
![](Images/app.png)

    FC중 특별하게 SM(State Management)는 컨트롤러로서 EM에게 명령한다

    그 기준은 시스템의디자인에 따르며 다른 상태들을 중재하여 전체 시스템의 동작을 제어한다
    (그 내부 동작은 프로젝트마다 상이하다)
    
    SM은 또한 다른 FC와 상호작용하며 전체 Machine의 행동을 조율한다

    SM은 ARA interface 표준만을 이용하여 다른 AP 구현체간의 portability를 제공해야한다

#### Application Interactions
    PSE51에서는 IPC(Inter-Process-Communication)을 포함하지 않는다

    AA간의 통신은 direct interface가 없는 셈이다

    CM은 유일한 Interface로서 SOC(Service Oriented Communication)기능을 제공하여 Intra-, Inter-machine 간 통신을 가능하게한다
    (Application Point-of-view에서 CM은 투명(Transparent)하다)

    CM은 Service request/replies의 경로설정을 담당하며 이는 Service와 Client의 배치 토폴로지와 관계없이 이루어진다.

    ARA interface는 AA간의 interacton은 트리거할수 있으나, 이는 하나의 communication interface가 아닌 각각의 AA가 이용하는 ARA interface들로부터 제공된 부수적 기능에 의한 것이다

#### Non-standard interfaces
    AA와 FC는 non-standard interfaces들을 이용가능하다
    하지만 이는 standard AP 기능들과 충돌이 나서는 안되며, 해당 프로젝트의 안전 요구사항에 부합해야한다

    만약 그것들이 Local Runtime Lib들이 아니면, 최소한으로 이용되도록 주의해야하며, 이는 sw의 portability에 영향을 미칠수 있음을 인지해야한다

