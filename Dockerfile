FROM alpine:3.11.5

ENV KUBECTL_VERSION v1.16.8

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl

RUN if [ -z ${KUBECTL_VERSION} ]; then curl -LO https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl; \
    else curl -LO https://storage.googleapis.com/kubernetes-release/release/${KUBECTL_VERSION}/bin/linux/amd64/kubectl; \
    install -t /usr/local/bin ./kubectl && \
    chmod +x /usr/local/bin/kubectl && \
    kubectl version --client