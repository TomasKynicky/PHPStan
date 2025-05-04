FROM php:8.4.6-cli-alpine3.20

WORKDIR /code

RUN apk add --no-cache bash git

COPY --from=ghcr.io/phpstan/phpstan:latest /composer/vendor/phpstan/phpstan/phpstan.phar /app/phpstan.phar

RUN mkdir /src
COPY default /src/default

COPY phpstan.sh /usr/local/bin/phpstan
RUN chmod +x /usr/local/bin/phpstan

ENTRYPOINT ["phpstan"]
