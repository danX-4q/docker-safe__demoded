FROM ubuntu:16.04

LABEL   author="danX <chenxd@bankledger.com>" \
        maintainer="danX <chenxd@bankledger.com>" \
        version="2.0.0" \
        description="This is the develop environment for compiling, deploying and running program bankledger.com/safe:^2.x.y"

ADD ./docker-fs-root/ /
WORKDIR /home/safe-env-dev/

RUN chmod +x setup-safe-env-dev.sh && \
    ./setup-safe-env-dev.sh

CMD ["tail", "-f", "/dev/null"]

