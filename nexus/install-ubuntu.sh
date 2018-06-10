#!/bin/sh

VERSION=${1:-3.12.0-01}
INSTALL_DIR=${2:-"/opt/sys/vendor/nexus"}

sudo groupadd nexus
sudo useradd -g nexus -d $INSTALL_DIR nexus

mkdir -p $INSTALL_DIR
wget https://sonatype-download.global.ssl.fastly.net/repository/repositoryManager/3/nexus-${VERSION}-unix.tar.gz -P $INSTALL_DIR
tar -zxvf $INSTALL_DIR/nexus-${VERSION}-unix.tar.gz -C $INSTALL_DIR
rm -f $INSTALL_DIR/nexus-${VERSION}-unix.tar.gz
ln -s nexus-${VERSION} $INSTALL_DIR/current
sudo chown -R nexus:nexus $INSTALL_DIR

sudo cp nexus.service /etc/systemd/system/
sudo systemctl daemon-reload
sudo systemctl enable nexus.service
sudo systemctl start nexus.service

