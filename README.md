# jenkins-docker-swarm-client

Jenkins client with support for docker swarm.

## 1. Preparation

on Jenkins master:

* install [Self-Organizing Swarm Module](https://plugins.jenkins.io/swarm) (ID:swarm)
* set "Configure Global Security"->"TCP port for JNLP agents" (default:50000)

on the server running Jenkins:

* add port for "JNLP agents" to your system firewall
* initialize docker swarm

## 2. Usage

```bash
docker service create \
 --name jenkins-swarm-client \
 -e LABELS=swarm-client \
 -e MASTER=http://127.0.0.1:80 \
 -e USER_NAME=jenkins \
 -e USER_PASSWORD=jenkins_pw \
 --mount "type=bind,source=/var/run/docker.sock,target=/var/run/docker.sock" \
 nicatorba/jenkins-docker-swarm-client
```

### Environment variables

| Environment variable | Default value | Description |
| -------------------- | ------------- | ----------- |
| LABELS | *required* | Whitespace-separated list of lables to be assigned for this client |
| MASTER | *required* | The complete target Jenkins URL |
| USER_NAME | *required* | The Jenkins username for authentication |
| USER_PASSWORD | *required* | The Jenkins user password |
| EXECUTORS | **1** | Number of executors |
| NAME | **client** | Name of the client |
