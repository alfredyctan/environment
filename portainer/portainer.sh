#!/bin/sh
ENV=$1
USER=$2

for HOST in `cat portainer/$ENV/hosts.cfg`
do
	scp setup.sh ${USER}@${HOST}:/tmp
	ssh ${USER}@${HOST} "chmod 750 /tmp/setup.sh; /tmp/setup.sh; rm /tmp/setup.sh;"
done
