#!/bin/sh
ENV=$1
USER=$2
for HOST in `cat $ENV/hosts.cfg`
do
	echo "working on $HOST"
	scp install.sh ${USER}@${HOST}:/tmp/install.sh
	ssh ${USER}@${HOST} "cd /tmp; ./install.sh $ENV $USER; rm install.sh;"
done

