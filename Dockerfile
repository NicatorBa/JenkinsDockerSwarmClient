FROM docker:17.10.0-ce

ENV SWARM_CLIENT_VERSION 3.6

RUN apk add --no-cache curl openjdk8-jre && \
    curl -o swarm-client.jar https://repo.jenkins-ci.org/releases/org/jenkins-ci/plugins/swarm-client/${SWARM_CLIENT_VERSION}/swarm-client-${SWARM_CLIENT_VERSION}.jar

COPY entrypoint.sh /
RUN chmod +x /entrypoint.sh && \
    sed -i -e 's/\r$//' /entrypoint.sh

CMD [ "/entrypoint.sh" ]
