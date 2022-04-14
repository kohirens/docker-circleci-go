#STAGE: Install Tool for CircleCI plus some
FROM khalifahks/alpine-glibc:2.34-r0 AS base

ARG GH_CLI_VER='2.5.2'

RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade \
    bash \
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

RUN apk --progress --purge --no-cache upgrade \
 && apk --no-progress --purge --no-cache add --upgrade --repository=http://dl-cdn.alpinelinux.org/alpine/edge/community \
    go \
 && apk --progress --purge --no-cache upgrade \
 && rm -vrf /var/cache/apk/*

COPY ./start.sh /usr/local/bin

RUN chmod +x /usr/local/bin/start.sh

SHELL [ "bash" ]

ENTRYPOINT [ ]

CMD [ ]
