FROM scratch AS ctx
COPY build_files /

FROM docker.io/archlinux/archlinux:latest

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    --mount=type=tmpfs,dst=/tmp --mount=type=tmpfs,dst=/root \
    /ctx/base/base.sh

RUN --mount=type=bind,from=ctx,source=/,target=/ctx \
    /ctx/base/readonly.sh

RUN bootc container lint
