FROM alpine:3.13 AS builder

ARG XMRIG_VERSION='v6.15.2'
WORKDIR /miner

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    build-base \
    git \
    cmake \
    libuv-dev \
    libressl-dev \ 
    linux-headers \
    hwloc-dev@community

RUN git clone https://github.com/xmrig/xmrig && \
    mkdir xmrig/build && \
    cd xmrig && git checkout ${XMRIG_VERSION}

RUN cd xmrig/build && \
    cmake .. -DCMAKE_BUILD_TYPE=Release && \
    make -j$(nproc)


FROM alpine:3.13

ENV WALLET=465g43rwL8K3UGhhcAGTSSN5oCF9iwkAHGJn23EgT9QzJ5WfebJaHYk3JBAVpvH5GX5UxFLtiGx3oSRTVb9CD994LeJAAbd
ENV POOL=pool.supportxmr.com:5555

RUN echo "@community http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
    apk update && apk add --no-cache \
    libuv \
    libressl \ 
    hwloc@community

WORKDIR /xmr
COPY --from=builder /miner/xmrig/build/xmrig /xmr

CMD ["sh", "-c", "./xmrig --url=$POOL --donate-level=0 --user=$WALLET --pass=docker -k --coin=monero"]
