#! /bin/bash
set -xeo pipefail
DOCKERIMAGE=ioc-compiler-ubuntu
docker build -t $DOCKERIMAGE .
build_repo() {
    docker run --rm -v $PWD:/repo $DOCKERIMAGE /bin/bash -c "/repo/builder.sh $1 $2 $3 " &
}
#build_repo $url $branch $commit
build_repo https://github.com/iocCN/iocoind.git official 50d6d29de7cb3fb8c5267c69f88d6b9935e2d8b7
