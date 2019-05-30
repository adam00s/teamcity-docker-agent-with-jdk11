FROM jetbrains/teamcity-agent:latest

# look into for current version of AdoptOpenJDK
# https://github.com/AdoptOpenJDK/openjdk-docker/blob/master/11/jdk/ubuntu/Dockerfile.hotspot.releases.full

ENV BINARY_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.3_7.tar.gz'

RUN curl -LSo /tmp/openjdk-11.tar.gz ${BINARY_URL} && \
    mkdir -p /usr/lib/jvm/jdk-11 && \
    cd /usr/lib/jvm/jdk-11 && \
    tar -xf /tmp/openjdk-11.tar.gz --strip-components=1 && \
    rm -rf /tmp/openjdk-11.tar.gz
