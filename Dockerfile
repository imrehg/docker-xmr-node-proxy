FROM ubuntu:16.04

WORKDIR /usr/src/app/

RUN    apt-get update \
    && apt-get install -qy --no-install-recommends \
         curl git python-virtualenv python3-virtualenv curl ntp build-essential screen cmake pkg-config libboost-all-dev libevent-dev libunbound-dev libminiupnpc-dev libunwind8-dev liblzma-dev libldns-dev libexpat1-dev libgtest-dev libzmq3-dev \
    && curl -sL https://deb.nodesource.com/setup_6.x | bash - \
    && apt-get install nodejs

ARG PROXY_VERSION
RUN git clone https://github.com/Snipa22/xmr-node-proxy \
    && cd xmr-node-proxy \
    && git checkout -b build ${PROXY_VERSION} \
    && npm install

WORKDIR /usr/src/app/xmr-node-proxy/

CMD ["node", "proxy.js"]
