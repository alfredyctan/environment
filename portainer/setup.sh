#!/bin/sh

MKTEMP=`mktemp`
cat /lib/systemd/system/docker.service | sed "s/^ExecStart=\/usr\/bin\/dockerd -H fd:\/\/$/ExecStart=\/usr\/bin\/dockerd -H fd:\/\/ -H tcp:\/\/0.0.0.0:2375/g" > $MKTEMP
if [ -n "`diff /lib/systemd/system/docker.service $MKTEMP`" ]; then
	sudo cp /lib/systemd/system/docker.service /lib/systemd/system/docker.service.`date +%Y-%m-%d`
	sudo cp $MKTEMP /lib/systemd/system/docker.service
fi
rm $MKTEMP

sudo systemctl daemon-reload
sudo service docker restart
docker volume create portainer_data
