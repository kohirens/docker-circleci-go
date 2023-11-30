#STAGE: Install Tool for CircleCI environment plus some
FROM kohirens/alpine-glibc:3.17-2.35-r1 AS base

ARG GH_CLI_VER='2.31.0'
ARG GTB_CLI_VER='2.1.2'

RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
    curl \
    docker \
    gettext \
    git \
    openssh \
    tar \
    unzip \
    wget \
    zip \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

RUN curl -LO https://github.com/cli/cli/releases/download/v${GH_CLI_VER}/gh_${GH_CLI_VER}_linux_amd64.tar.gz \
 && tar -xzvf ./gh_${GH_CLI_VER}_linux_amd64.tar.gz \
 && mv gh_${GH_CLI_VER}_linux_amd64/bin/gh /usr/local/bin \
 && rm -rf gh_${GH_CLI_VER}_linux_amd64 \
    gh_${GH_CLI_VER}_linux_amd64.tar.gz

RUN curl -LO https://github.com/kohirens/git-tool-belt/releases/download/${GTB_CLI_VER}/git-tool-belt-linux-amd64.tar.gz \
 && tar -xzvf ./git-tool-belt-linux-amd64.tar.gz \
 && ls -la . \
 && chmod +x git-tool-belt-linux-amd64 \
 && mv git-tool-belt-linux-amd64 /usr/local/bin/git-tool-belt \
 && rm -rf git-tool-belt-linux-amd64.tar.gz

RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    go \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

COPY ./start.sh /usr/local/bin

SHELL [ "/bin/bash", "-c" ]

ENTRYPOINT [ ]

CMD [ ]
