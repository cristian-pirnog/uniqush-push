FROM golang:1.7
MAINTAINER Cristian Pirnog

WORKDIR /go/src/github/cristian-pirnog/uniqush-push

COPY . .

RUN go-wrapper download && \
    go-wrapper install

EXPOSE 9898

ENTRYPOINT ["./entrypoint.sh"]
CMD ["go-wrapper", "run", "-config", "conf/uniqush-push.conf"]
