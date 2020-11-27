##  Xamarin

### 1. Preface

필자가 Xamarin Framework를 접한건 정확하진 않지만 2016~2017년 이었던 것으로 기억한다.

전문연구요원으로 복무시절 Windows Application 을 .NET Framework 4.0 기반이상에서 동작하는 WPF를 이용해서 개발했었는데,
업체측에서 특정기능을 Android로 쓸 수 있게 해달라는 요청이 있었었다.

Android Native는 JAVA 기반이다보니 C#기반과 크게 언어적으로 다르진 않았지만 아무래도 개발환경과 CI/CD를 구축하는데 시간이 촉박하여,
유지보수하는데 Hell 이 펼쳐질 것 같은 생각이 들어 찾아봤던 Cross-platform 개발 Framework 이다.
(사실 먼저 알아본건 UWP 였다. 이 Framework UI는 딱 Windows 10에서 계산기 생각하면 된다)

WPF로 개발되어있는 기능들을 빠르게 Android 로 포팅하기 위해 당시 궁여지책으로 썼었는데,
당시만해도 Xamarin이 Microsoft로 인수된지 얼마 되지 않았고 오픈소스 친화정책을 펼치기 시작한 초창기라 
Framework 자체의 버그도 좀 있고, 성능도 떨어지고, 지원되는 기능도 많지 않았다.
(아무래도 Android Studio 와 같은 Native 전용 Framework에 비하면 매우 떨어질 수 밖엔 없겠지만 좀 심했었다)

시간이 지나 2020년에 갑자기 궁금증이 생겨 얼마나 진화했는지 Microsoft Docs를 살펴봤다.

아니나 다를까 진짜 엄청나게 많은 지원기능들이 생겼고, 지원하는 플랫폼도 가지각색이다.
- [Link : Supported-platforms](https://docs.microsoft.com/ko-kr/xamarin/get-started/supported-platforms?tabs=windows)

예전엔 Android, iOS, Windows 만 돼도 감지덕지였는데 이젠 Tizen, macOS, GTK#, WPF 등도 지원한다.

Microsoft가 최근 Linux Kernel을 Windows에 거의 완벽하게 심더니 이젠 C#이라는 언어 하나로 다 묶어보려고 하는 그림인지 여튼간 스케일 대단하다.

앞으로는 Yocto에도 올라오는게 아닌가 싶다..


