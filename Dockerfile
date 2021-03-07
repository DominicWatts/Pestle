FROM php:7.2-cli
MAINTAINER Dominic Xigen <dominic@xigen.co.uk>

ENV PHP_MEMORY_LIMIT 2G

ENV PHP_CONF_DIR=/usr/local/etc/php/conf.d

RUN php -m

RUN curl -LO http://pestle.pulsestorm.net/pestle.phar \
  && php pestle.phar list-commands \
  && cp pestle.phar /usr/local/bin/pestle \
  && chmod +x /usr/local/bin/pestle 

VOLUME ["/code"]
WORKDIR /code

RUN mkdir -p /tmp/pestle_cache \
  && chmod 777 /tmp -R

ARG USER_ID
ARG GROUP_ID

RUN addgroup --gid $GROUP_ID user
RUN adduser --disabled-password --gecos '' --uid $USER_ID --gid $GROUP_ID user
USER user

RUN php --version

ENTRYPOINT ["/usr/local/bin/pestle"]

CMD ["list-commands"]