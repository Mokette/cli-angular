FROM node:14.6.0-alpine as node-angular-cli

LABEL authors="Mokette"

#Linux setup
RUN apk update \
  && apk add --update alpine-sdk \
  && apk del alpine-sdk \
  && apk add make \ 
  && rm -rf /tmp/* /var/cache/apk/* *.tar.gz ~/.npm \
  && npm cache verify \
  && sed -i -e "s/bin\/ash/bin\/sh/" /etc/passwd

#Angular CLI
RUN npm install -g @angular/cli