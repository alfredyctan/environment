#!/bin/sh
echo "sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common"
sudo apt-get install -y apt-transport-https ca-certificates curl software-properties-common

echo "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

echo "sudo apt-key fingerprint 0EBFCD88"
sudo apt-key fingerprint 0EBFCD88

echo 'sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"'
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"

echo "sudo apt-get update"
sudo apt-get update

echo "sudo apt-cache madison docker-ce"
sudo apt-cache madison docker-ce

echo "sudo apt-get install -y docker-ce"
sudo apt-get install -y docker-ce

echo "sudo usermod -G docker $USER"
sudo usermod -G docker $USER

echo "docker info"
docker info

echo "docker run hello-world"
docker run hello-world
