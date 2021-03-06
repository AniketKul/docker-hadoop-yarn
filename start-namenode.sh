#!/bin/bash

platform='unknown'
unamestr=`uname`

if [[ "$unamestr" == 'Linux' ]]; then
   platform='linux'
elif [[ "$unamestr" == 'FreeBSD' ]]; then
   platform='freebsd'
 elif [[ "$unamestr" == 'Darwin' ]]; then
    platform='osx'
fi

if [[ $platform != 'osx' ]]; then
  alias docker='sudo docker'
fi

docker run -d -p 8088:8088 -p 50070:50070 -p 50075:50075 --name namenode -h namenode --workdir /usr/local/hadoop yarn-cluster /etc/bootstrap.sh -d -namenode
