FROM registry.access.redhat.com/ubi8/go-toolset
LABEL maintainer="ContainerCraft.io"  \
      release="`date +'%Y%m%d%H%M%S'`"

USER root
ENV HOME=/root
WORKDIR /root/dev

COPY src/bashrc /root/.bashrc

ARG urlEpel="https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm"
ARG urlTmux="http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/tmux-2.7-1.el8.x86_64.rpm"
ARG yumFlags=" -y --disableplugin=subscription-manager " 
ARG yumList=" \
            vim  \
            sudo \
            "

RUN set -x \
    && git clone https://github.com/udhos/update-golang.git                    \
    && cd  update-golang                                                       \
    && ./update-golang.sh                                                      \
    && rm -rf $(which go)                                                      \
    && cp -f /usr/local/go/bin/go /usr/bin/go                                  \
    && dnf update     ${yumFlags}            \
    && dnf install    ${yumFlags} ${yumList} \
    && dnf install -y ${urlEpel}             \
    && dnf install -y ${urlTmux}             \
    && cd \
    && rm -rf update-golang                  \
    && dnf clean all                         \
    && go version                            \
    && echo

ENTRYPOINT ["/usr/bin/bash"]
