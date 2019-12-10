FROM golang:1.13.5-buster

RUN apt-get update && apt-get install -y build-essential libssl-dev libsasl2-dev libzstd-dev

COPY . /librdkafka

RUN cd /librdkafka \
    && ./configure --install-deps \
    && make \
    && make install

RUN rm -rf /librdkafka