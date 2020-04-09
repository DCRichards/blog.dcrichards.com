FROM ubuntu:bionic

ARG VERSION=0.68.3

RUN apt-get update && apt-get install -y curl

WORKDIR /src/hugo

RUN mkdir -p /tmp && \
    curl -Ls https://github.com/gohugoio/hugo/releases/download/v${VERSION}/hugo_${VERSION}_linux-64bit.tar.gz | tar -xz -C /tmp && \
    cp /tmp/hugo /usr/local/bin && \
    rm -rf /tmp

COPY . .

CMD ["hugo"]
