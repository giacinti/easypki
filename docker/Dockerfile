# inspired from https://github.com/OpusVL/docker-easyrsa

FROM alpine:latest

RUN mkdir -p /data/pki
VOLUME /data/pki
RUN mkdir -p /data/pub
VOLUME /data/pub

RUN apk add --update --no-cache openssl bash coreutils nginx \
    && apk add libfaketime --repository=http://dl-cdn.alpinelinux.org/alpine/edge/testing

# needed by nginx
RUN mkdir -p /run/nginx

ARG EASYRSA_VERSION 3.0.8
RUN wget -O- https://github.com/OpenVPN/easy-rsa/releases/download/v$EASYRSA_VERSION/EasyRSA-$EASYRSA_VERSION.tgz | tar -C / -zx \
    && mkdir /usr/local/easyrsa \
    && mv EasyRSA-$EASYRSA_VERSION/* /usr/local/easyrsa \
    && ln -sf /usr/local/easyrsa/easyrsa /usr/local/bin/ \
    && rmdir EasyRSA-$EASYRSA_VERSION

# patching common file
COPY COMMON.add /tmp
RUN cat /usr/local/easyrsa/x509-types/COMMON /tmp/COMMON.add > /tmp/COMMON.new \
    && mv -f /tmp/COMMON.new /usr/local/easyrsa/x509-types/COMMON

# ocsp profile
COPY ocsp /usr/local/easyrsa/x509-types/

# startup script - real script should be in /data/pki/bin
COPY start.sh /usr/local/bin/start.sh

# default nginx config
COPY default.conf /etc/nginx/conf.d/default.conf
COPY nginx_ocsp.conf /var/opt/nginx_ocsp.conf
COPY nginx_docker.conf /etc/nginx/modules/nginx_docker.conf

WORKDIR /data/pki

CMD /usr/local/bin/start.sh
