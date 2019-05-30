FROM teamcity-minimal-agent-jdk10:latest

# look into for current version of AdoptOpenJDK 11
# https://github.com/AdoptOpenJDK/openjdk-docker/blob/master/11/jdk/ubuntu/Dockerfile.hotspot.releases.full

ENV BINARY_11_URL='https://github.com/AdoptOpenJDK/openjdk11-binaries/releases/download/jdk-11.0.3%2B7/OpenJDK11U-jdk_x64_linux_hotspot_11.0.3_7.tar.gz'

# look into for current version of AdoptOpenJDK 12
# https://github.com/AdoptOpenJDK/openjdk-docker/blob/master/12/jdk/ubuntu/Dockerfile.hotspot.releases.full

ENV BINARY_12_URL='https://github.com/AdoptOpenJDK/openjdk12-binaries/releases/download/jdk-12.0.1%2B12/OpenJDK12U-jdk_x64_linux_hotspot_12.0.1_12.tar.gz'

RUN curl -LSo /tmp/openjdk-11.tar.gz ${BINARY_11_URL} && \
    mkdir -p /usr/lib/jvm/jdk-11 && \
    cd /usr/lib/jvm/jdk-11 && \
    tar -xf /tmp/openjdk-11.tar.gz --strip-components=1 && \
    rm -rf /tmp/openjdk-11.tar.gz $$ \
    curl -LSo /tmp/openjdk-12.tar.gz ${BINARY_12_URL} && \
    mkdir -p /usr/lib/jvm/jdk-12 && \
    cd /usr/lib/jvm/jdk-12 && \
    tar -xf /tmp/openjdk-12.tar.gz --strip-components=1 && \
    rm -rf /tmp/openjdk-12.tar.gz
