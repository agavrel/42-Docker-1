# usage: sudo docker build -t ex01 ex01

# From a debian image you will add the appropriate sources to create a TeamSpeak
# server, that will launch along with your container. It will be deemed valid if at least
# one user can connect to it and engage in a normal discussion (no far-fetched setup), so
# be sure to create your Dockerfile with the right options. Your program should get the
# sources when it builds, they cannot be in your repository.
FROM  debian

# Get informations from https://teamspeak.com/en/downloads/#server
ENV	TS_VERSION="3.9.1" \
	TS_SHA256SUM="0a0497d6a8e5f3f48e10db8f89875286d6aa3388f171f828cf5d426cf305f16f" \
	TS_FILENAME="teamspeak3-server_linux_amd64" \
	TS_USER="teamspeak" \
	TS_HOME="/opt/teamspeak-server" \
	TS3SERVER_LICENSE="accept"

# Get all the required packages to download (curl), extract (bzip2) and run (mysql-common ca-certificates) Teamspeak Server
RUN   	apt-get -y update && apt-get -y install --no-install-recommends apt-utils curl bzip2 ca-certificates mysql-common \
      	&& apt-get -y autoremove && apt-get clean \
   	&& groupadd -r $TS_USER \
     	&& useradd -rm -g $TS_USER \
        -d $TS_HOME $TS_USER

# WORKDIR avoid the extensive use of cd https://docs.docker.com/v17.09/engine/userguide/eng-image/dockerfile_best-practices/#workdir
WORKDIR ${TS_HOME}

# Will 1/ Show commands in red, 2/ download file, 3/ check file integrity, 4/ extract the file, 5/ delete archive, 6/ move the file to the teamspeak-server repertory
RUN	set -ex \
	&& curl -sSLo "/tmp/$TS_FILENAME.tar.gz" "https://files.teamspeak-services.com/releases/server/${TS_VERSION}/${TS_FILENAME}-${TS_VERSION}.tar.bz2" \
	&& echo "${TS_SHA256SUM}  /tmp/$TS_FILENAME.tar.gz" | sha256sum -c \
        && tar -xvf "/tmp/$TS_FILENAME.tar.gz" \
        && rm /tmp/$TS_FILENAME.tar.gz \
        && mv ${TS_FILENAME}/* ${TS_HOME}
# bzip2 package required for tar -z
# -z: Compress the archive with gzip.
# -v: Display progress in the terminal while creating the archive, also known as “verbose” mode. The v is always optional in these commands, but it’s helpful.
# -f: Allows you to specify the filename of the archive.

# Copy mariadb lib
RUN 	cp "$(pwd)/redist/libmariadb.so.2" $(pwd)

ADD	myscript.sh ${TS_HOME}/myscript.sh

# To keep our server secure, we will create another user and let it run the server.
RUN	chown -R ${TS_USER}:${TS_USER} ${TS_HOME} \
	&& chmod +x myscript.sh

USER	${TS_USER}

# voice port, query port and file transer port
EXPOSE	9987/udp
EXPOSE	10011
EXPOSE	30033

ENTRYPOINT	["./myscript.sh"]

# sudo docker run -p 9987:9987/udp -p 10011:10011 -p 30033:30033 -e TS3SERVER_LICENSE=accept ex01
