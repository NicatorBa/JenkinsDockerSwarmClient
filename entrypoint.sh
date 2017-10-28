#!/bin/sh

if [[ -z "${LABELS}" ]]; then
  echo "LABELS must be set."
  exit 1
fi

if [[ -z "${MASTER}" ]]; then
  echo "MASTER must be set."
  exit 1
fi

if [[ -z "${USER_NAME}" ]]; then
  echo "USER_NAME must be set."
  exit 1
fi

if [[ -z "${USER_PASSWORD}" ]]; then
  echo "USER_PASSWORD must be set."
  exit 1
fi

EXECUTORS=${EXECUTORS:-1}
NAME=${NAME:-client-$(hostname)}

mkdir -p /var/jenkins
java -jar swarm-client.jar -fsroot /var/jenkins -executors ${EXECUTORS} -labels ${LABELS} -name ${NAME} -master ${MASTER} -username ${USER_NAME} -password ${USER_PASSWORD}
