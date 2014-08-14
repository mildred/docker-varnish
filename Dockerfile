FROM debian:stable
MAINTAINER Mildred Ki'Lya

RUN set -e; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get update; \
    apt-get -y install curl;

RUN set -e; \
    export DEBIAN_FRONTEND=noninteractive; \
    curl http://repo.varnish-cache.org/debian/GPG-key.txt | apt-key add -; \
    echo "deb http://repo.varnish-cache.org/debian/ wheezy varnish-4.0 > /etc/apt/sources.list.d/varnish.list"
    apt-get update;

RUN set -e; \
    export DEBIAN_FRONTEND=noninteractive; \
    apt-get install -y varnish vim nano;

RUN mkdir -p /etc/varnish;

VOLUME /etc/varnish

EXPOSE 80

ENV VARNISH_PORT 80

CMD touch /etc/varnish/default.vcl; \
    exec varnishd -F -f /etc/varnish/default.vcl -s malloc,100M -a 0.0.0.0:${VARNISH_PORT}

