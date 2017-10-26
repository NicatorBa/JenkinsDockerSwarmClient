#!/bin/sh

EXECUTORS=${EXECUTORS:-1}
NAME=${NAME:-client-$(hostname)}

mkdir -p /var/jenkins
java -jar swarm-client.jar -fsroot /var/jenkins -executors ${EXECUTORS} -labels ${LABELS} -name ${NAME} -master ${MASTER} -username ${USER_NAME} -password ${USER_PASSWORD}
