#FROM ubuntu:16.04
FROM dockerhub.bankledger.com/safe-ed-base:2.0.0-snapshot

ADD ./docker-fs-root/ /
WORKDIR /home/safe-ed/

ENV DEBIAN_FRONTEND noninteractive
RUN chmod +x setup-safe-ed.sh && \
    ./setup-safe-ed.sh

CMD ["tail", "-f", "/dev/null"]

