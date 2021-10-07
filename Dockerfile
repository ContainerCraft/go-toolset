FROM registry.access.redhat.com/ubi8/go-toolset
LABEL maintainer="ContainerCraft.io"  \
      release="`date +'%Y%m%d%H%M%S'`"

USER root
ENV HOME=/root
WORKDIR /build

COPY contrib/bashrc /root/.bashrc

#ARG urlEpel="https://dl.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm"
#ARG urlTmux="http://mirror.centos.org/centos/8/BaseOS/x86_64/os/Packages/tmux-2.7-1.el8.x86_64.rpm"

ARG dnfFlags=" \
            -y \
            --disableplugin=subscription-manager \
" 
ARG dnfList=" \
  vi \
"

RUN set -x \
    && rm -rf $(which go)                                                      \
    && git clone https://github.com/udhos/update-golang.git /root/dev/update-golang \
    && cd /root/dev/update-golang                                              \
    && ./update-golang.sh                                                      \
    && /usr/local/go/bin/go version                                            \
    && ln -f /usr/local/go/bin/go /usr/bin/go                                  \
    && rm -rf /root/dev/update-golang                                          \
    && go version                                                              \
    && echo

#RUN set -x \
#    && dnf update     ${dnfFlags}            \
#    && dnf install    ${dnfFlags} ${dnfList} \
#    && dnf clean all                         \
#    && echo
#   && dnf install -y ${urlEpel}             \
#   && dnf install -y ${urlTmux}             \

ENTRYPOINT ["/usr/bin/bash"]
