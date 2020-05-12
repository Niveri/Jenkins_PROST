# our local base image
FROM ubuntu

# Install Docker in the image, which adds a docker group
RUN apt-get -y update && \
 apt-get -y install \
   apt-transport-https \
   ca-certificates \
   curl \
   gnupg \
   lsb-release \
   software-properties-common

RUN curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add -
RUN add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"

RUN apt-get -y update && \
 apt-get -y install \
   docker-ce \
   docker-ce-cli \
   containerd.io
RUN groupadd -g id -g jenkins jenkins
RUN groupmod -g id -g stat -c %g /var/run/docker.sock docker
RUN useradd -c "Jenkins user" -g id -g jenkins -G stat -c %g /var/run/docker.sock -M -N -u id -u jenkins jenkins


