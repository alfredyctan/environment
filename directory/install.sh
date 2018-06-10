#!/bin/sh
ENV=$1
USER=$2

sudo mkdir -p /opt/sys
sudo chown -R ${USER}:docker /opt/sys
echo "/opt/sys added"

mkdir -p /opt/sys/app 
mkdir -p /opt/sys/data
mkdir -p /opt/sys/log
mkdir -p /opt/sys/script
mkdir -p /opt/sys/vendor
echo "/opt/sys/\* added"

sudo apt install -y openjdk-8-jdk
echo "open jdk installed"

mkdir -p /opt/sys/vendor/jdk
cd /opt/sys/vendor/jdk
rm -f current
ln -s /usr/lib/jvm/java-8-openjdk-amd64 current
echo "linked jdk to vendor directory"

if [ ! -r "/home/$USER/.bash_profile" ] || [ -z "`grep contineo.profile ~/.bash_profile`" ]; then 
	echo ". /opt/sys/script/profile/contineo.profile $ENV" >> ~/.bash_profile; 
fi
echo "added profile"
