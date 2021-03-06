# our local base image
FROM ubuntu:latest
USER root
ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get update
RUN apt-get install build-essential -y
RUN apt-get upgrade
RUN apt-get install curl -y
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.06.0-ce.tgz \
  && tar xzvf docker-17.06.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.06.0-ce.tgz
RUN apt-get install gcc -y
RUN apt-get install cmake -y
RUN apt-get install git -y

RUN git clone http://github.com/catchorg/Catch2 \
 && cd Catch2 \
 && cmake -Bbuild -H. -DBUILD_TESTING=OFF \
 && cmake --build build/ --target install 


