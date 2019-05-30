#!/bin/bash

VERSION=1.0

docker build . -t teamcity-agent-with-jdk11:$VERSION
docker tag teamcity-agent-with-jdk11:$VERSION teamcity-agent-with-jdk11:latest
