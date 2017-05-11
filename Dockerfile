FROM       alpine:3.5
MAINTAINER Yosuke Yamamoto "yosuke@pyrites.jp"

RUN apk update && \
    apk add supervisor && \
    mkdir -p /etc/supervisor.d
ADD supervisord.conf /etc/supervisord.conf

EXPOSE 9001:9001

ENV USERNAME user
ENV PASSWORD 123

VOLUME ["/var/log"]
ENTRYPOINT ["/usr/bin/supervisord", "-c", "/etc/supervisord.conf"]

