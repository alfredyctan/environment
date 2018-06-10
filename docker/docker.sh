#!/bin/sh
ENV=$1
USER=$2
for HOST in `cat $ENV/hosts.cfg`
do
	echo "working on $HOST"
	scp install-ubuntu.sh ${USER}@${HOST}:/tmp/install-ubuntu.sh
	ssh ${USER}@${HOST} "cd /tmp; ./install-ubuntu.sh $USER; rm install-ubuntu.sh;"
done

