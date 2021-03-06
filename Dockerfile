FROM alpine:3.11.5

ENV KUBECTL_VERSION v1.17.4

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl bash

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    install -t /usr/local/bin ./kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client