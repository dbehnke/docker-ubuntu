FROM ubuntu:14.04
MAINTAINER jgeiger@gmail.com

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
  apt-get upgrade && \
  dpkg-divert --local --rename --add /sbin/initctl && \
  ln -sf /bin/true /sbin/initctl && \
  dpkg-divert --local --rename --add /usr/bin/ischroot && \
  ln -sf /bin/true /usr/bin/ischroot && \
  apt-get install -y wget unzip language-pack-en software-properties-common && \
  locale-gen en_US && \
  apt-get clean
