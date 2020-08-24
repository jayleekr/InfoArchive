|Author  |Jay Lee|
|:-------|:------|
E-mail   |jayleekr0125@gmail.com
Last-Edit|2020-04-13

#Sample Applications

## Preread
본 문서는 R19-11 Adaptive AUTOSAR 표준의 sample-applications를 분석한 내용입니다. 

문서에서 다루는 application은 아래와 같습니다.

* emo_samples
* per_examples
* phm_exaples
* tsync_examples
* cm_provider_subscriber_scenario
* emo_integration_test
* system_init
* system_deinit

Yocto build로 qemux86 형태로 빌드하여 테스트를 진행하였습니다.

## Operation Sequence

>/usr/bin/execution_manager

위 EM binary는 초기화 단계에서 세가지를 단계를 갖습니다.
1. /etc/system/machine_manifest.json을 읽고 설정 합니다
2. cgroup을 설정합니다
3. /opt/ 안에 모든 directory들을 scan하여 찾은 manifest로 부터 application 실행 준비를 합니다
4. Machine State를 'Startup' 으로 변경 후 /opt안에 function들을 모두 시작합니다


## emo_samples
TestApp1 ~ 4 번의 Start/Terminate로 구성됩니다.
각각의 application에 다른 argument를 넣어가며 순차적으로 테스트 합니다.

이를 통해 테스트하는 기능은 다음과 같습니다.
1. StateClient를 통하여 EM에게 Machine State를 가져 옵니다
2. Application 시작 후 ExecutionClient를 통하여 EM에게 Application의 Execution의 State를 'Running' 보고(Report)합니다
3. Application 종료 전 ExecutionClient를 통하여 EM에게 Application의 Execution State를 Teminating으로 보고합니다
