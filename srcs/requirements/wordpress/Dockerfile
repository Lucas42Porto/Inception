
FROM debian:bullseye

RUN apt update && apt upgrade -y && apt install -y \
        php7.4-fpm \
        php7.4-mysqli \
        curl

COPY ./conf/www.conf /etc/php/7.4/fpm/pool.d/.
COPY ./conf/script.sh .
RUN chmod +x script.sh

RUN mkdir -p /run/php && chown -R www-data:www-data /run/php
RUN mkdir -p /var/www/html && chown -R www-data:www-data /var/www/html

ENTRYPOINT ["./script.sh"]