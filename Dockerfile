FROM alpine:latest

ARG TZ="Asia/Shanghai"

ENV TZ ${TZ}

RUN apk --no-cache add \
    ca-certificates \
    bash  \
    tzdata \
    curl \
    zip

RUN mkdir -p /tmp/ssp/ /etc/ssp/ && cd /tmp/ssp \
  && curl -L -H "Cache-Control: no-cache" -o ssp-linux-64.zip https://github.com/ColetteContreras/ssp/releases/download/VERSION/ssp-linux-amd64.zip \
  && unzip ssp-linux-64.zip \
  && cp config.ini /etc/ssp/config.ini \
  && cp ssp / \
  && cd / && rm -rf /tmp/ssp

ENTRYPOINT [ "/ssp" ]
