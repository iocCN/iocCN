#! /bin/bash
set -eo pipefail

repo=$1
branch=$2
commit=$3
reponame=iocoin

#dpkg -s libboost-dev | grep Version # Version: 1.65.1.0ubuntu1
#dpkg -s libminiupnpc-dev | grep Version #Version: 1.9.20140610-4ubuntu2

# build core
#git clone $repo ${reponame}
git clone --single-branch --branch $branch $repo ${reponame}
cd ${reponame}
git checkout $commit
cd src
make -f makefile.unix
cp iocoind /repo/iocoind-$branch

cd /repo/iocoin/src
make -f makefile.unix clean
make -f makefile.unix
