#!/bin/bash

VERSION=1.1

docker build . -t teamcity-agent-with-jdk1x:$VERSION
docker tag teamcity-agent-with-jdk1x:$VERSION teamcity-agent-with-jdk1x:latest
