# Github Blog 만들기 
## How it works
Github 에서는 해당 계정 Username 이름으로 연동된 web page를 제공해둔다.

예를들면 필자의 Github User ID 가 jayleekr이고,
해당 계정의 Repository에 https://github.com/jayleekr/jayleekr.github.io 와 같이 새로운 블로그 용 Repository를 만들면
https://jayleekr.github.io/ 라는 주소로 웹페이지가 생성한 블로그용 Repository와 연동이 된다.

이 말은 해당 저장소를 가지고 있는 Github측(Remote)에서 백엔드 웹서버를 위 규칙에 의거하여 자동으로 생성해 준다는 의미이다. 

Front-end를 만들어 보자

## Front-end

Front-end 프레임웍이야 정말 종류가 많지만 좀 더 빠르게 만들기 위해 가장 유행하는 방법을 이용하여 만들어 보겠다.

이름하야 바로 **Jekyll** 인데, Github 공동 설립자인 Tom Preston-Werner 가 Ruby-on-rails 언어로 작성하였으며 MIT 라이센스를 따르는 정적 사이트 생성기이다.

(Github 공동 설립자가 만들어서 Github 와 기본 연동이 되는 건가)

## Create Repository 

도입부에서 언급했듯이 Github User name 에 맞게 생성해주면된다.

e.g.
User ID : jayleekr
Repository URL : https://github.com/jayleekr/jayleekr.github.io
Blog URL : https://github.com/jayleekr

저장소를 만들었으면 Local 에서 작업하여 Remote 에 Push 하는 형태로 작업할 계획이니, 블로그 저장소를 Local에 Clone 하자 

## Create Blog Site

Jekyll 을 이용하여 사이트를 생성하는 방식은 크게 두가지이다.
1. Local 에 Ruby, Bundler, 기타 gem Library들을 설치하여 Blog 를 생성하여 Remote에 Push하는 방법  
2. 애초에 jekyll 공식 저장소에서 Fork 해올때 블로그 화 할수있는 Repository 이름 형태로 땡겨오는 방법

> (필자는 2번 방식으로 Fork 해와서 기본적인 것들만 사용하다가, 
몇가지 애로사항으로 인하여 결국 2번방식으로 땡겨온 저장소를 Local에서 Debug 해가며 진행해야 했어서 1,2번 둘다 사용하고 있다)

## Set Jekyll-theme

Jekyll은 Theme 형태로 여러가지 Template을 제공한다. [http://jekyllthemes.org/]



## Decorate Layouts

Layout을 바꾸는 방법은 