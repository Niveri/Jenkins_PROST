# our local base image
FROM ubuntu
USER root

# Install Docker in the image, which adds a docker group
RUN apt-get -y update 
RUN apt-get -y install 

RUN apt-get install build-base gcc abuild binutils binutils-doc gcc-doc
RUN apt-get install cmake
RUN git clone http://github.com/catchorg/Catch2
RUN cd catch2
RUN cmake -Bbuild -H. -DBUILD_TESTING=OFF
RUN cmake --build build/ --target install
CMD["cmake"]

