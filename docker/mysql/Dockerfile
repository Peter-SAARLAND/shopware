FROM mysql:5.7

RUN apt update \
    && apt install --no-install-recommends -y \
    vim \
    netcat-openbsd

ADD shopware.cnf /etc/mysql/conf.d/shopware.cnf

RUN chmod 0444 /etc/mysql/conf.d/shopware.cnf