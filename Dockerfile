FROM archlinux:latest

COPY config-archlinux.sh /config-archlinux.sh

RUN /config-archlinux.sh


