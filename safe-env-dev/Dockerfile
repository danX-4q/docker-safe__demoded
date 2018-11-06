FROM ubuntu:16.04

LABEL   author="danX <chenxd@bankledger.com>" \
        maintainer="danX <chenxd@bankledger.com>" \
        version="2.0.0" \
        description="This is the develop environment for compiling, deploying and running program bankledger.com/safe:^2.x.y"

ADD ./docker-fs-root/ /
WORKDIR /home/safe-env-dev/

ENV DEBIAN_FRONTEND noninteractive
RUN chmod +x setup-safe-env-dev.sh && \
    ./setup-safe-env-dev.sh

ENV TZ=Asia/Shanghai
RUN echo "Asia/Shanghai" > /etc/timezone && \
    dpkg-reconfigure -f noninteractive tzdata

RUN locale-gen zh_CN.UTF-8 && \
  DEBIAN_FRONTEND=noninteractive dpkg-reconfigure locales
RUN locale-gen zh_CN.UTF-8
ENV LANG zh_CN.UTF-8
ENV LANGUAGE zh_CN:zh
ENV LC_ALL zh_CN.UTF-8

CMD ["tail", "-f", "/dev/null"]

