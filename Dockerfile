FROM alpine

RUN apk add --update nodejs npm

RUN apk add --no-cache --update bash ca-certificates curl gnupg \
  g++ make lz4-dev musl-dev cyrus-sasl-dev openssl-dev \
  python unzip wget jpeg-dev pango-dev cairo-dev pixman-dev \
  git

RUN apk add --no-cache --virtual .build-deps gcc zlib-dev libc-dev \
  bsd-compat-headers py-setuptools bash

RUN git clone https://github.com/edenhill/librdkafka.git && \
  cd librdkafka && \
  ./configure --install-deps && \
  make && \
  make install

ENV BUILD_LIBRDKAFKA=0
ENV LD_LIBRARY_PATH=/usr/local/lib
