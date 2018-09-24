FROM golang:1.9.2-alpine

ADD bin/dex /usr/bin
ADD bin/grpc-client /usr/bin
ADD bin/example-app /usr/bin


