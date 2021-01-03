ARG BASE_IMAGE
FROM $BASE_IMAGE

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install \
    -y -o Dpkg::Options::="--force-confold" --no-install-recommends --no-install-suggests \
    mc \
    cron \
    imagemagick \
    build-essential \
    yarn

ENV NVM_DIR=/usr/local/nvm

### Install nvm with default node version
ENV DEFAULT_NODE_VERSION=14
RUN curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh -o install_nvm.sh
RUN mkdir -p $NVM_DIR && bash install_nvm.sh
RUN echo "source $NVM_DIR/nvm.sh" >> /etc/profile
RUN bash -ic "nvm install $DEFAULT_NODE_VERSION && nvm use $DEFAULT_NODE_VERSION"
RUN bash -ic "nvm alias default $DEFAULT_NODE_VERSION"
RUN chmod -R ugo+w $NVM_DIR