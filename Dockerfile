FROM golang:1.4
MAINTAINER Nicolas Ruflin <spam@ruflin.com>

# Install go package dependencies
RUN go get \
	github.com/tools/godep \
	github.com/pierrre/gotestcover \
	golang.org/x/tools/cmd/cover \
	golang.org/x/tools/cmd/vet

# Setup work environment
RUN mkdir -p /go/src/github.com/elastic/topbeat
WORKDIR /go/src/github.com/elastic/topbeat

COPY ./topbeat/ /go/src/github.com/elastic/topbeat
COPY . /beat/

# Make sure to clean up environment first
RUN make clean

RUN make

ENTRYPOINT make -C /beat/ run-topbeat
