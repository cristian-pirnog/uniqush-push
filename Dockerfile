FROM golang:1.7
MAINTAINER Cristian Pirnog

ENV CODE_PATH=/go/src/github/cristian-pirnog/uniqush-push
ENV CONF_FILE=conf/uniqush-push.conf

WORKDIR ${CODE_PATH}
COPY . ${CODE_PATH}

RUN go-wrapper download
RUN go-wrapper install

RUN sed -i -e 's/localhost/0.0.0.0/' ${CONF_FILE}

EXPOSE 9898

CMD go-wrapper run -config ${CONF_FILE}
