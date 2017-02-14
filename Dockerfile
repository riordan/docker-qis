FROM ruby:2.2-alpine

MAINTAINER David Riordan <dr@daveriordan.com>

## Dependencies: build tools
RUN apk update && \
    apk add ca-certificates wget g++ musl-dev make libstdc++ && \
    update-ca-certificates && \

## Download and install QIS + gem bundles
    wget https://github.com/propublica/qis/archive/master.zip && \
    unzip master.zip && \
    mv qis-master qis && \
    rm master.zip && \
    cd qis && \
    bundle install && \
## Remove installed build tools
    apk del ca-certificates wget g++ musl-dev make

WORKDIR /qis

ADD keys.yml keys.yml
EXPOSE 4567

ENTRYPOINT ["thin", "start", "-p 4567"]
