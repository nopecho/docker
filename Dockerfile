##빌드 이미지의 베이스 이미지
FROM ubuntu:latest

##Dockerfile 내부에서만 사용하는 변수 , java로 치면 지역변수 쯤..?
ARG HELLO_ARG=1.0

##컨테이너 내부의 환경 변수
ENV HELLO_ENV=1.0

RUN echo $HELLO_ARG

RUN echo $HELLO_ENV

##컨테이너 내부로 현재 디렉토리 내의 파일 복사
COPY . /copy-dir

##컨테이너 내부로 현재 디렉토리 내의 파일 및 외부 리소스 복사 가능
ADD --keep-git-dir=true https://github.com/nopecho/docker.git /add-dir

WORKDIR /copy-dir

##컨테이너 실행 시 무조건 실행되는 명령
ENTRYPOINT ["/bin/sh", "-c", ""]

##컨테이너 실행 시 실행 되는 명령 (
#CMD ["--h"]