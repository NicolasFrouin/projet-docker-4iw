FROM alpine:latest

RUN apk update && apk upgrade
RUN apk add --no-cache php composer

ENTRYPOINT ["composer", "--version"]