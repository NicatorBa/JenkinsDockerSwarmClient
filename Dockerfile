FROM docker:18.02.0-ce

LABEL name=jenkins-docker-swarm-client \
      version=latest

ENV SWARM_CLIENT_VERSION 3.9

RUN apk add --no-cache --virtual .fetch-deps curl && \
    curl -o swarm-client.jar "https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar" && \
    apk del .fetch-deps && \
    apk add --no-cache openjdk8-jre

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh && \
    sed -i -e 's/\r$//' /entrypoint.sh

CMD [ "/entrypoint.sh" ]
