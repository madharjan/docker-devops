FROM ubuntu:16.04
LABEL maintainer="Madhav Raj Maharjan <madhav.maharjan@gmail.com>"

ARG VCS_REF
ARG UBUNTU_VERSION
ARG HTTP_PROXY
ARG DEBUG=false

ENV http_proxy $HTTP_PROXY
ENV https_proxy $HTTP_PROXY

LABEL description="Docker container for Development (devops)" os_version="Ubuntu ${UBUNTU_VERSION}" \
      org.label-schema.vcs-ref=${VCS_REF} org.label-schema.vcs-url="https://github.com/madharjan/docker-devops"

RUN mkdir -p /build
COPY . /build

RUN chmod 755 /build/scripts/*.sh && /build/scripts/install.sh && /build/scripts/cleanup.sh

ENV http_proxy ""
ENV https_proxy ""
