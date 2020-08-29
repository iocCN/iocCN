#!/bin/bash
set -eo pipefail
apt-get update >/dev/null 2>&1
apt-get -y -qq upgrade
apt install -y software-properties-common
apt-get update && \
    apt install -y --no-install-recommends \
        autoconf \
        automake \
        autotools-dev \
        bsdmainutils  \
        build-essential  \
        git  \
        make \
        libboost-all-dev \
        libdb++-dev \
        libtool  \
        libssl-dev  \
        libgmp3-dev \
        libminiupnpc-dev  \
        pwgen  \
        software-properties-common \
        sudo  \
        ufw  \
        unzip  \
        wget  && \
    apt-get -y autoremove && \
    apt-get -y autoclean && \

if [ -f /.dockerenv ]; then
    apt-get -yqq --purge autoremove unzip
    apt-get -yqq clean
    rm -rf /var/lib/apt/lists/* /var/cache/* /tmp/* /usr/share/locale/* /usr/share/man /usr/share/doc /lib/xtables/libip6*
fi
