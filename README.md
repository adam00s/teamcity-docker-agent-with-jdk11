## Motivation

Standard teamcity-docker-agent is running on jdk1.8 and higher jdk can not be simply added to image becouse of conflict 
of options in JAVA_TOOL_OPTIONS.

It needs image crated by https://github.com/adam00s/teamcity-docker-agent-jdk10 in local docker.

## build script on linux

```
# get fresh files
rm -rf teamcity-docker-agent-with-jdk1x
git clone https://github.com/adam00s/teamcity-docker-agent-with-jdk1x.git

# go to docker build folder
cd teamcity-docker-agent-with-jdk1x

# run docker build
chmod +x build.sh
./build.sh
```

## examle of usage

```
docker run --name teamcity-agent2-with-jdk1x \
        -v /data/teamcity_agent2/conf:/data/teamcity_agent/conf \
        -v /data/teamcity_agent_common/root/.m2:/root/.m2 \
        -v /data/teamcity_agent_common/etc/default/docker:/etc/default/docker \
        -e SERVER_URL=http://server:8111 \
        --privileged -e DOCKER_IN_DOCKER=start \
        --link teamcity-server:server \
        --link registry:registry \
        --restart always \
        -d teamcity-agent-with-jdk1x
```

It supports building of docker images that can be pushed to local registry:

File `/data/teamcity_agent_common/etc/default/docker` contains:
```
DOCKER_OPTS="--insecure-registry registry:5000"
```

`registry` is name of local docker registry created with:
```
docker run --name registry \
        -v /data/docker-registry/data:/var/lib/registry \
        -p 5000:5000 \
        --restart always \
        -d registry:2
```
