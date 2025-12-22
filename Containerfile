FROM scratch AS ctx
COPY build_files /

FROM docker.io/archlinux/archlinux:latest

RUN --mount=type=tmpfs,dst=/tmp --mount=type=tmpfs,dst=/root \
    /ctx/base/base.sh

RUN bootc container lint
