# See here for image contents: https://github.com/microsoft/vscode-dev-containers/tree/v0.194.3/containers/ruby/.devcontainer/base.Dockerfile

FROM ruby:3.0.2-alpine3.14

ARG USER_ID=1000
ARG GROUP_ID=$USER_ID

RUN apk add --no-cache \
  build-base \
  coreutils \
  git \
  gnupg \
  libgcc \
  libstdc++ \
  libssl1.1 \
  make \
  mandoc \
  man-pages \
  openssh-client \
  tzdata

RUN addgroup ${GROUP_ID:+-g ${GROUP_ID}} developer \
  && adduser -D -g 'Default User' -G developer ${USER_ID:+-u ${USER_ID}} developer \
  && addgroup -g 2022 ssh_user \
  && addgroup developer ssh_user

USER developer

RUN mkdir /home/developer/app

WORKDIR /home/developer/app

RUN gem install solargraph