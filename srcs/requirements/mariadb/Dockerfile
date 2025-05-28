FROM debian:bullseye

RUN apt update -y && apt upgrade -y && \
    apt install -y --no-install-recommends --no-install-suggests mariadb-server
    # rm -rf /var/lib/apt/lists/*

COPY ./tools/init-db.sh /etc/mysql/
COPY ./tools/init.sql /etc/mysql/init.sql
COPY ./conf/50-server.cnf /etc/mysql/mariadb.conf.d/

RUN chmod +x ./etc/mysql/init-db.sh

RUN mkdir /run/mysqld

CMD ["./etc/mysql/init-db.sh"]
