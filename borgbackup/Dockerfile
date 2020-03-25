FROM alpine:edge

LABEL maintainer "yitiandelan@outlook.com"

RUN echo "https://mirrors.ustc.edu.cn/alpine/edge/testing" >> /etc/apk/repositories \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.ustc.edu.cn/g" /etc/apk/repositories \
    && apk add --update --no-cache s3fs-fuse borgbackup rclone

VOLUME /mnt/repo

# RUN export AWSACCESSKEYID=
# RUN export AWSSECRETACCESSKEY=
# RUN s3fs backup /mnt/repo -o use_path_request_style,url=
