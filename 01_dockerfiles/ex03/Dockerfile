# build:  docker build -t ex03 ex03

# Docker can be useful to test an application that’s still being developed
# without polluting your libraries. You will have to design a Dockerfile that
# gets the development version of Gitlab - Community Edition installs it with
# all the dependencies and the necessary configurations, and launches the
# application, all as it builds. The container will be deemed valid if you can
# access the web client, create users and interact via GIT with this container
# (HTTPS and SSH). Obviously, you are not allowed to use the official container
# from Gitlab, it would be a shame...

FROM		ubuntu:18.04

MAINTAINER	agavrel <gavrel.antonin@gmail.com>

RUN		apt-get update -y && apt-get -y upgrade \
		&& apt-get -y install wget openssh-server ca-certificates postfix

RUN		wget https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh \
		&& chmod 777 script.deb.sh && ./script.deb.sh && apt-get install -y gitlab-ce \
		&& apt update && apt install -y tzdata \
  		&& apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

EXPOSE		443 80 22

ENTRYPOINT	(/opt/gitlab/embedded/bin/runsvdir-start &) && gitlab-ctl reconfigure \
		&& tail -f /dev/null
# NB: tail -f /dev/null is a nice trick to keep the container active

# usage: docker run -it -p 8080:80 -p 8022:22 -p 8443:443 --privileged ex03
# to access: open chrome and use 'http://localhost:8080/' as url
