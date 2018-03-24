#!/bin/sh

if [[ -z "${LABELS}" ]]; then
  echo "LABELS must be set."
  exit 1
fi

if [[ -z "${JENKINS_URL}" ]]; then
  echo "JENKINS_URL must be set."
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

if [[ -z "${CLIENT_NAME}" ]]; then
  CLIENT_NAME=$(hostname)
else
  CLIENT_NAME=${CLIENT_NAME}.$(hostname)
fi

mkdir -p ${JENKINS_HOME}
java -jar swarm-client.jar -fsroot ${JENKINS_HOME} -executors ${EXECUTORS} -name ${CLIENT_NAME} -labels "${LABELS}" -master ${JENKINS_URL} -username ${USER_NAME} -password ${USER_PASSWORD}
