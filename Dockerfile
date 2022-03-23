FROM golang:alpine
RUN apk --no-cache add ca-certificates make git
WORKDIR /app
COPY . .

#ENV CGO_ENABLED=0
#RUN go build -o . -installsuffix "static" -mod=readonly ./


RUN make && rm -rf vendor/

FROM arm64v8/alpine
LABEL maintainer="Tumblr"
RUN apk --no-cache add ca-certificates
COPY --from=0 /app/bin/docker-registry-pruner /bin/docker-registry-pruner
COPY ./entrypoint.sh /bin/entrypoint.sh
WORKDIR /app
COPY ./config ./config
ENTRYPOINT ["entrypoint.sh"]
CMD ["-h"]

