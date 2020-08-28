#!/bin/bash
set -e

CONFFILE=/ioc/conf/iocoin.conf
DATADIR=/ioc/datadir
ZIPBOOTSTRAP=https://github.com/IOCoin/DIONS/releases/download/DIONS-SIRIUS-v5.0.0.0-g5729cf1/IOC-Boostrap-2917292.zip

if [ "$1" = '' ]; then
        if test -f "$CONFFILE"; then
                echo "$CONFFILE exist"
        else
                echo "Config file not found, creating..."
                echo -n rpcpassword= > $CONFFILE
                head /dev/urandom | tr -dc A-Za-z0-9 | head -c 32 >> $CONFFILE
                echo date +%s | sha256sum | base64 | head -c 32 >> $CONFFILE
                echo -iocoin.network >> $CONFFILE
                echo rpcuser=iocoin.network >> $CONFFILE
                echo server=1 >> $CONFFILE
                echo rpcallowip=* >> $CONFFILE
                echo addnode=amer.supernode.iocoin.io >> $CONFFILE
                echo addnode=emea.supernode.iocoin.io >> $CONFFILE
                echo addnode=apac.supernode.iocoin.io >> $CONFFILE
                cat $CONFFILE
        fi
        if test -f "$DATADIR/blk0001.dat"; then
                echo "$DATADIR/blk0001.dat exist"
        else
                echo "$DATADIR/blk0001.dat not exist"
                rm -rf $DATADIRtxleveldb
                echo "Downloading bootstrap file..."
                wget -O iocbootstrap.zip $ZIPBOOTSTRAP
                unzip iocbootstrap -d $DATADIR
        fi
fi

./iocoind -datadir=$DATADIR -conf=$CONFFILE -logtimestamps "$@"