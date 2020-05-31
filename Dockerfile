FROM ubuntu:18.04

ENV SAUCE_VERSION 4.5.3

RUN apt update && apt install -y \
    bash \
    chromium-browser \
    curl \
    firefox \
    nodejs \
    npm \
    wget

SHELL ["/bin/bash", "-o", "pipefail", "-c"]

RUN wget https://saucelabs.com/downloads/sc-${SAUCE_VERSION}-linux.tar.gz -O - | tar -xz && \
    mv sc-${SAUCE_VERSION}-linux/bin/sc /usr/local/bin && \
    chmod 0777 /usr/local/bin/sc

COPY package*.json .

RUN npm install

ENV PATH /node_modules/.bin:$PATH
