# This image is used for running Argo CLI
FROM alpine:3

# Set up APK repositories and upgrade
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main git \
    && apk -U upgrade

# Install required tools
RUN apk add --no-cache git curl bash gzip 
RUN apk add --no-cache aws-cli nodejs npm
RUN npm install -g aws-cdk-lib 

WORKDIR /aws

ARG account=aws
RUN addgroup -S ${account} \
    && adduser -S ${account} -G ${account}
USER ${account}:${account}

CMD ["/bin/sh"]
