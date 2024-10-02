#
# Note - this does not currently work properly
#
ARG nodeVer=20
ARG osVer=bookworm-slim

FROM node:${nodeVer}-${osVer} AS builder

# Install required tools
ARG DEBIAN_FRONTEND=noninteractive

# Set Python interpreter for `node-gyp` to use
ENV PYTHON=/usr/bin/python3

# Install isolate-vm dependencies, these are needed by the @backstage/plugin-scaffolder-backend.
RUN --mount=type=cache,target=/var/cache/apt,sharing=locked \
    --mount=type=cache,target=/var/lib/apt,sharing=locked \
    apt-get update && \
    apt-get install -y git curl \
        python3 g++ build-essential \
        wget gnupg yarn vim \
        libsqlite3-dev

ARG account=backstage
RUN groupadd --gid 1010 ${account} \
  && useradd --uid 1010 \
      --gid ${account} \
      --shell /bin/bash \
      --create-home ${account}
USER ${account}:${account}

WORKDIR /app
ENV nvmVer=0.40.1
RUN curl -sSLo /tmp/install.sh \
    "https://raw.githubusercontent.com/nvm-sh/nvm/v${nvmVer}/install.sh" \
    && chmod +x /tmp/install.sh
RUN /tmp/install.sh
ENV NVM_DIR="/home/backstage/.nvm"
RUN chmod a+rx "$NVM_DIR/nvm.sh"
RUN echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' > env.sh && chmod a+rx ./env.sh
RUN echo ". ./env.sh" > /tmp/install.sh
RUN echo "nvm install --lts=hydrogen" >> /tmp/install.sh
RUN echo "nvm use lts/hydrogen" >> /tmp/install.sh
RUN chmod a+rx /tmp/install.sh
RUN /tmp/install.sh

# Install backage
ENV backstageApp="backstage"
ENV backstageAppVer="latest"

# This switches many Node.js dependencies to production mode.
ENV NODE_ENV=dev

RUN echo ". ./env.sh" > /tmp/install.sh
RUN echo "nvm use lts/hydrogen" >> /tmp/install.sh
RUN echo "node --version && yarn --version && npx --version" >> /tmp/install.sh
RUN echo "echo ${backstageApp} | npx @backstage/create-app@${backstageAppVer}" >> /tmp/install.sh
RUN echo "chmod -R +rw ${backstageApp} && cd ${backstageApp} && git init" >> /tmp/install.sh
RUN echo 'git config --global user.email "backstage@noreply@github.com"' >> /tmp/install.sh
RUN echo 'git config --global user.name "backstage"' >> /tmp/install.sh
RUN echo 'git add . && git commit --allow-empty -n -m "Initial commit"' >> /tmp/install.sh
RUN chmod a+rx /tmp/install.sh
RUN /tmp/install.sh

WORKDIR /app
RUN echo ". ./env.sh" > /tmp/install.sh
RUN echo "nvm use lts/hydrogen" >> /tmp/install.sh
RUN echo "node --version && yarn --version" >> /tmp/install.sh
RUN echo "cd ${backstageApp}" >> /tmp/install.sh
#RUN echo 'yarn install --check-cache && yarn dev' >> /tmp/install.sh
RUN echo 'yarn dev' >> /tmp/install.sh
RUN chmod a+rx /tmp/install.sh

EXPOSE 3000 8081 7007

CMD [ "/bin/sh", "-c", "/tmp/install.sh" ]
