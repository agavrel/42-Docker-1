# https://docs.docker.com/engine/reference/builder/
# You can specify a repository and tag at which to save the new image if the build succeeds:
# sudo docker build -t ex00 ./ex00
# sudo docker run -it ex00

# Specify base image from docker build
FROM    alpine

# Download Vim
RUN     apk update \
        && apk add vim

# Launch Vim
CMD     ["vim"]
