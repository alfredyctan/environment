#!/bin/sh
ENV=$1
USER=$2
for HOST in `cat $ENV/hosts.cfg`
do
	echo "working on $HOST"
	ssh ${USER}@${HOST} "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common"
	ssh ${USER}@${HOST} "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
	ssh ${USER}@${HOST} "sudo apt-key fingerprint 0EBFCD88"
	ssh ${USER}@${HOST} 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable'
    ssh ${USER}@${HOST} "apt-cache madison docker-ce"
    ssh ${USER}@${HOST} "sudo apt-get install -y docker-ce"

	ssh ${USER}@${HOST} "sudo usermod -G docker $USER"
	ssh ${USER}@${HOST} "docker info"
	ssh ${USER}@${HOST} "docker run hello-world"
done

