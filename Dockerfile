FROM alpine:3.2
MAINTAINER Cagatay Gurturk <cguertuerk@ebay.de>

RUN apk add --update openssh-client && rm -rf /var/cache/apk/*

CMD ssh \
-vv \
-o StrictHostKeyChecking=no \
-Nn $TUNNEL_HOST \
-L *:$LOCAL_PORT:$REMOTE_HOST:$REMOTE_PORT
EXPOSE 1-65535