#!/bin/sh

ENV=$1
USER=$2
cd $ENV
for HOST in `cat hosts.cfg`
do
	scp authorized_keys id_rsa id_rsa.pub known_hosts ${USER}@${HOST}:/home/${USER}/.ssh
	ssh ${USER}@${HOST} "cd /home/${USER}/.ssh; chmod 600 *;"
done
