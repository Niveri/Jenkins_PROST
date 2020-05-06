# our local base image
FROM jenkinsci/blueocean
USER root

LABEL description="Container for use with Visual Studio" 

# install build dependencies 
RUN apk add build-base gcc abuild binutils binutils-doc gcc-doc

CMD ["cmake"]
