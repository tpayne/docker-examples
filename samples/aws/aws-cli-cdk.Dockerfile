# This image is used for running AWS CLI, CDK and Node
FROM alpine:20231219

# Set up APK repositories and upgrade
RUN apk add --no-cache --repository=http://dl-cdn.alpinelinux.org/alpine/edge/main git \
    && apk -U upgrade

# Install required tools
RUN apk add --no-cache git curl
RUN apk add --no-cache libstdc++

# Needed for AWS CLI/CDK
RUN apk add --no-cache nodejs npm
RUN apk add --no-cache aws-cli 
RUN npm install -g aws-cdk-lib 

# Adding react support for apps
RUN npm install -g react-native 
RUN npm install -g create-react-app

WORKDIR /aws

ARG account=aws
RUN addgroup -S ${account} \
    && adduser -S ${account} -G ${account}
USER ${account}:${account}

CMD ["/bin/sh"]
