#!/bin/sh

VERSION=${1:-3.12.0-01}
INSTALL_DIR=${2:-"/opt/sys/vendor/nexus"}

PWD=`pwd`

sudo groupadd nexus
sudo useradd -g nexus nexus

mkdir -p $INSTALL_DIR
cd $INSTALL_DIR
wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-${VERSION}-unix.tar.gz 
tar -zxvf nexus-${VERSION}-unix.tar.gz
rm -f nexus-${VERSION}-unix.tar.gz
ln -s nexus-${VERSION} current
sudo chown -R nexus:nexus $INSTALL_DIR

cd $PWD
sudo cp nexus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable nexus.service
sudo systemctl start nexus.service

