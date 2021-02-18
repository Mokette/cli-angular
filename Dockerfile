FROM node:14.15.5-alpine3.10 as node-angular-cli

LABEL authors="Mokette"

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk \
  && apk del alpine-sdk \
  && apk add make \
  && apk add gcc \
  && apk add g++ \
  && apk add python3 \
  && npm cache verify \
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

#Angular CLI
RUN npm install -g @angular/cli