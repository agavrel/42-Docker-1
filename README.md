# 42 Docker Project

First [register to the project](https://projects.intra.42.fr/projects/docker-1)  

Then you will need to:
* Install Docker
* INstall Docker Machine

## 1/ Install Docker

---
### If you are running macOS:
https://docs.docker.com/docker-for-mac/install/

---
### If you are running Linux (ubuntu):

The below installation steps are already explained on [Docker Official Site](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

##### If docker was previously installed
Just in case, remove older versions:
```
sudo apt-get remove docker docker-engine docker.io containerd runc
```

The contents of /var/lib/docker/, including images, containers, volumes, and networks, are preserved. The Docker Engine - Community package is now called docker-ce.


#### A/ Install using the repository
Before you install Docker Engine - Community for the first time on a new host machine, you need to set up the Docker repository. Afterward, you can install and update Docker from the repository.
```
sudo apt-get update
```

Install packages to allow apt to use a repository over HTTPS:
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
```

Add Docker’s official GPG key:
```
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
```

Verify that you now have the key with the fingerprint 9DC8 5822 9FC7 DD38 854A E2D8 8D81 803C 0EBF CD88, by searching for the last 8 characters of the fingerprint.

```
$ sudo apt-key fingerprint 0EBFCD88

pub   rsa4096 2017-02-22 [SCEA]
      9DC8 5822 9FC7 DD38 854A  E2D8 8D81 803C 0EBF CD88
uid           [ unknown] Docker Release (CE deb) <docker@docker.com>
sub   rsa4096 2017-02-22 [S]
```

Use the following command to set up the stable repository. To add the nightly or test repository, add the word nightly or test (or both) after the word stable in the commands below. Learn about nightly and test channels.
```
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
```


#### B/ INSTALL DOCKER ENGINE - COMMUNITY

Update the apt package index.
```
sudo apt-get update
```

Install the latest version of Docker Engine - Community and containerd
```
sudo apt-get install docker-ce docker-ce-cli containerd.io
```
nb: check on the official website if you desire to install a specific version  

Verify that Docker Engine - Community is installed correctly by running the hello-world image.
```
sudo docker run hello-world
```

#### C/ (If Required) Uninstall Docker Engine - Community


Uninstall the Docker Engine - Community package:
```
sudo apt-get purge docker-ce
```

Images, containers, volumes, or customized configuration files on your host are not automatically removed. To delete all images, containers, and volumes:
```
sudo rm -rf /var/lib/docker
```

You must delete any edited configuration files manually

## Install Docker Machine

Download the Docker Machine binary and extract it to your PATH [(doc)](https://docs.docker.com/machine/install-machine/)

### If you are running macOS:
```
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
```

### If you are running Linux:
```
base=https://github.com/docker/machine/releases/download/v0.16.0 &&
  curl -L $base/docker-machine-$(uname -s)-$(uname -m) >/tmp/docker-machine &&
  sudo mv /tmp/docker-machine /usr/local/bin/docker-machine &&
  chmod +x /usr/local/bin/docker-machine
```

Check the installation by displaying the Machine version:
```
$ docker-machine version
docker-machine version 0.16.0, build 9371605
```

#### Install bash completion scripts

The Machine repository supplies several bash scripts that add features such as:

* command completion
* a function that displays the active machine in your shell prompt
* a function wrapper that adds a docker-machine use subcommand to switch the active machine

Confirm the version and save scripts to ```/etc/bash_completion.d``` or ```/usr/local/etc/bash_completion.d```:
```
base=https://raw.githubusercontent.com/docker/machine/v0.16.0
for i in docker-machine-prompt.bash docker-machine-wrapper.bash docker-machine.bash
do
  sudo wget "$base/contrib/completion/bash/${i}" -P /etc/bash_completion.d
done
```

Then you need to run
```
source /etc/bash_completion.d/docker-machine-prompt.bash
```
in your bash terminal to tell your setup where it can find the file docker-machine-prompt.bash that you previously downloaded.

To enable the docker-machine shell prompt, add $(__docker_machine_ps1) to your PS1 setting in ~/.bashrc.

```
PS1='[\u@\h \W$(__docker_machine_ps1)]\$ '
```

You can find additional documentation in the comments at the [top of each script](https://github.com/docker/machine/tree/master/contrib/completion/bash).
