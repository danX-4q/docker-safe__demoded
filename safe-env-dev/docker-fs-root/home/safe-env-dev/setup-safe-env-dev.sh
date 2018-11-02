#!/bin/bash

ROOT_DIR=/

mkdir -p ${ROOT_DIR}/home/safe-env-dev &&
cd ${ROOT_DIR}/home/safe-env-dev

apt-get update &&
apt-get install -y software-properties-common &&
add-apt-repository -y ppa:bitcoin/bitcoin &&
apt-get update

#######################################
#######################################
#######################################

APT_PACK_LIST_FILE=${ROOT_DIR}/home/safe-env-dev/safe-env-dev.apt-pack-list
{ sed -e 's|#.*$||g' ${APT_PACK_LIST_FILE} | xargs apt-get install -y; } && 
apt -y autoremove && 
apt-get clean

#######################################
#######################################
#######################################

tar xzvf depends.*.tar.gz &&

rm -rf depends_bin/x86_64-linux && cp -rf depends depends_bin/x86_64-linux && 
#( cd depends_bin/x86_64-linux && make -j4 ) &&

rm -rf depends_bin/x86_64-w64-mingw32 && cp -rf depends depends_bin/x86_64-w64-mingw32 &&
#( cd depends_bin/x86_64-linux && make HOST=x86_64-w64-mingw32 -j4 ) &&

rm -rf depends_bin/i686-w64-mingw32 && cp -rf depends depends_bin/i686-w64-mingw32 &&
#( cd depends_bin/x86_64-linux && make HOST=i686-w64-mingw32 -j4 ) &&

rm -rf depends_bin/x86_64-apple-darwin11 && cp -rf depends depends_bin/x86_64-apple-darwin11 &&
#( cd depends_bin/x86_64-linux && make HOST=x86_64-apple-darwin11 -j4 ) 

#######################################
#######################################
#######################################


echo "$0 said: run ok."
