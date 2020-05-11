# our local base image
FROM niveri/prost-jenkins:first
USER root

LABEL description="Container" 




CMD ["cmake"]
