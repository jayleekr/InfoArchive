# Platform Health Management
## 1. About
* PHM은 아래 네가지 기능을 제공함으로써 SW의 실행을 감독합니다
1. Alive supervision
2. Deadline supervision
3. Logical supervision
4. Health Channel Supervision

## 2. Functions

* Alive supervision은 개체가 너무 자주 실행되거나 너무 실행이 안되지는 않는지를 체크합니다.
* Deadline supervision은 개체가 설정된 최소 또는 최대하의 제한시간 안에 실행되는지를 감독합니다.
* Logical supervision은 디자인한 흐름에 맞게 개체가 실행되고 있는지를 확인합니다.
* Alive, Deadline, Logical Supervision은 Application이나 Cluster/Services들의 API ReportCheckPoint를 통해 checkpoint마다 수행합니다.
* Health channel supervision은 외부 도구들을 이용한하여 PHM관련 정보들(RAM test, voltage 모니터링)을 PHM으로 가져옵니다
* Health channel supervision은 API ReportHealthStatus를 통해 정보를 가져옵니다
* PHM은 관리하는 개체들 중 failure가 발견될시 configuragble recovery action을 Trigger합니다.
![](Images/phm.png)

