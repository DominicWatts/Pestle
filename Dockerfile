FROM php:7.1-cli
MAINTAINER Dominic Xigen <dominic@xigen.co.uk>

RUN php --version

ENV PHP_MEMORY_LIMIT 2G

ENV PHP_CONF_DIR=/usr/local/etc/php/conf.d

RUN php -m

RUN curl -LO http://pestle.pulsestorm.net/pestle.phar \
  && php pestle.phar list-commands \
  && cp pestle.phar /usr/local/bin/pestle \
  && chmod +x /usr/local/bin/pestle 

VOLUME ["/code"]
WORKDIR /code

ENTRYPOINT ["/usr/local/bin/pestle"]

CMD ["list-commands"]