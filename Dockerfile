FROM alpine:3

ARG BIN "https://github.com/gruntwork-io/cloud-nuke/releases/download/v0.1.18/cloud-nuke_linux_amd64"
ARG SHASUM "7cf26457baa404017b2e89b6768a1ee24073ec0ca17bcdf23a79efb27f5bb736  cloud-nuke_linux_amd64"

RUN apk add -U --no-cache curl shasum \
    && curl -L $BIN > cloud-nuke_linux_amd64 \
    && echo $SHASUM | sha256sum -c - \
    && mv cloud-nuke_linux_amd64 /usr/local/bin/cloud-nuke

ENTRYPOINT ["cloud-nuke"]



