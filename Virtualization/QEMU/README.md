# QEMU
## 1. About

전가상화 기술 기반의 가상화 기능 지원 소프트웨어

Host OS와 다른 OS를 여러개 띄울수 있다.

VmWare나 Virtual Box와는 다르게 오픈소스로 개발되고 있다.

임베디드나 모바일 시장을 장악하고 있는 arm 아키텍쳐뿐 아니라 alpha, i386과 같은 구시대의 유물같은 아키텍쳐도 지원한다.

Guest OS의 수정없이도 잘 돌아가야 하기 때문에 QEMU내에선 Guest OS가 사용할 CPU, USB, PCI처럼 컴퓨터 본체에 있는 모든 디바이스들을 만든다.
 
이 방식은 모든 OS를 돌릴 수 있다는 장점이 있지만 막상 실행해보면 사용하기 어려울 정도로 매우 느리다.
사실 당연한 것이 Host의 관점에선 QEMU에서 만든 device들은 결국 process나 thread의 일종일 것이다. 
User process들은 Kernel process에 비해 우선 순위가 낮기 때문에 기존에 사용하던 운영체제와 동일하게 사용하는것이 거의 불가능 하다. 
게다가 만약 Host 내에서 처리해야하는 일이 많다면 자연스레 QEMU 작업들은 뒤로 밀릴 수 밖에 없다. 

이런 고민을 소프트웨어 회사만 한 것이 아니다. 
한창 가상화 기술이 뜨고 있을 무렵 Intel과 ARM 같은 아키텍처 하드웨어 회사도 어떻게 하면 하드웨어적으로 가상화를 지원 할 수 있을지를 연구를 했고 그에 맞춰 칩을 새롭게 디자인 했다. 
리눅스에선 하드웨어 상에서 지원하는 가상화 feature들을 모두 KVM이란 모듈에 통합해서 관리하도록 만들었다.

QEMU는 workload가 높은 작업들을 적절히 KVM으로 돌려서 Host에 가까운 성능을 내도록 했다. 구조적으로는 이렇게 잡아서 사용했다.


## Reference
 
 https://selfish-developer.com/entry/QEMU%EC%99%80-KVM-1?category=825819
