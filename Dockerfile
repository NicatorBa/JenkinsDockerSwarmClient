FROM docker:19.03

LABEL name="jenkins-docker-swarm-client" \
      version="1903.322"

ENV SWARM_CLIENT_VERSION="3.22" \
    JENKINS_HOME="/var/jenkins" \
    EXECUTORS="1"

RUN apk add --no-cache --virtual .fetch-deps curl && \
    curl -o swarm-client.jar "https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar" && \
    apk del .fetch-deps && \
    apk add --no-cache openjdk8-jre

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh && \
    sed -i -e 's/\r$//' /entrypoint.sh

CMD [ "/entrypoint.sh" ]
