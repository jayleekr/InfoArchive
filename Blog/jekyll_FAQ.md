# Truble Shooting while installing jekyll

### 1. tzinfo-data 가 없음
Gemfile 에 tzinfo-data 를 기록하고 bundler update
아무래도 bundler 는 gemfile 로 부터 읽어들여 해당 프로젝트 기준으로 dependency를 설치하는 듯


### 2. undefined local variable or method `parse_header_contents' for #<Kramdown::Parser::GFM:0x0000555b87df9890> Did you mean? parse_atx_header

jekyll 과 ruby 버전이 안맞으며 발생하는 에러
debian ubuntu로 설치했다면 먼저 패키지를 지우자
ruby 만 다시 apt 를 통해 설치하고,
gem install jekyll으로 jekyll 설치하면 해결완료

### 3.     Permission denied @ rb_sysopen - /var/lib/gems/2.5.0/gems/nokogiri-1.10.10/LICENSE-DEPENDENCIES.md

ubuntu 에서 벌어진 문제인데,
ruby-dev 를 설치하니 일단 해결이 되더라
이유는....

### 3. theme 바꾸기
 
