FROM registry.access.redhat.com/ubi8/go-toolset
LABEL maintainer="ContainerCraft.io"  \
      release="`date +'%Y%m%d%H%M%S'`"

USER root
ENV HOME=/root 
WORKDIR /root/dev

COPY src/bashrc $HOME/.bashrc

ARG yumFlags=" -y --disableplugin=subscription-manager " 
ARG yumList=" \
            vim  \
            sudo \
            "

RUN set -ex \
    && dnf update ${yumFlags}             \
    && dnf install ${yumFlags} ${yumList} \
    && dnf clean all                      \
    && echo

ENTRYPOINT ["/bin/bash"]
CMD ["/bin/bash"]
