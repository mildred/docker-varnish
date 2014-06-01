FROM ubuntu:14.04
MAINTAINER James Lal [:lightsofapollo]

RUN apt-get -y install curl; \
    curl http://repo.varnish-cache.org/debian/GPG-key.txt | sudo apt-key add -; \
    echo "deb http://repo.varnish-cache.org/ubuntu/ precise varnish-4.0" | sudo tee -a /etc/apt/sources.list; \
    sudo apt-get update; \
    sudo apt-get install -y varnish;

