# our local base image
FROM ubuntu:latest
USER root


RUN apt-get update
 
RUN curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.03.0-ce.tgz \
  && tar xzvf docker-17.03.0-ce.tgz \
  && mv docker/docker /usr/local/bin \
  && rm -r docker docker-17.03.0-ce.tgz
RUN apt-get install build-base gcc abuild binutils binutils-doc gcc-doc
RUN apt-get install cmake
RUN git clone http://github.com/catchorg/Catch2
RUN cd catch2
RUN cmake -Bbuild -H. -DBUILD_TESTING=OFF
RUN cmake --build build/ --target install
RUN cmake

