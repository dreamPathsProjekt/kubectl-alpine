FROM alpine:3.11.5

ARG VERSION
ENV KUBECTL_VERSION ${VERSION}

RUN mkdir -p /opt/kube
WORKDIR /opt/kube

RUN apk update && \
    apk upgrade && \
    apk add --no-cache curl && \
    if [ -z ${KUBECTL_VERSION} ]; then KUBECTL_VERSION=$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt); fi

RUN curl -LO https://storage.googleapis.com/kubernetes-release/release/v${KUBECTL_VERSION}/bin/linux/amd64/kubectl && \
    chmod +x kubectl && \
    mv kubectl /usr/local/bin/kubectl