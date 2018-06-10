#!/bin/sh
ENV=$1
USER=$2
for HOST in `cat $ENV/hosts.cfg`
do
	echo "working on $HOST"
	sudo apt-get install apt-transport-https ca-certificates curl software-properties-common
	curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
	sudo apt-key fingerprint 0EBFCD88
	sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
    apt-cache madison docker-ce
    sudo apt-get install docker-ce

	sudo usermod -G docker $USER
	docker info
	docker run hello-world

done

