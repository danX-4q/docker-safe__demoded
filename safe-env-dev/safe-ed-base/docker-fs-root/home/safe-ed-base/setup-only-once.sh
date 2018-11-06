#!/bin/bash

ROOT_DIR=/
MAIN_DIR_NAME="safe-ed-base"

find ${ROOT_DIR}/home/{bankledger,ex-work,safe-ed-base}/ | grep  -E '.gitkeep|.gitignore'


mkdir -p ${ROOT_DIR}/home/${MAIN_DIR_NAME}/ &&
cd ${ROOT_DIR}/home/${MAIN_DIR_NAME}/

#######################################
#######################################
#######################################

APT_PACK_LIST_FILE=${ROOT_DIR}/home/${MAIN_DIR_NAME}/build-aux/apt-pack-list
#APT_CACHE_TAR_FILE=${ROOT_DIR}/home/${MAIN_DIR_NAME}/build-aux/cache.apt.archives.*.tar

#>>>>>>>>>>
#tar xvf ${APT_CACHE_TAR_FILE} -C / &&
#i have test this, but when apt-get install os will download all packages again

apt-get update &&
apt-get install -y software-properties-common &&
add-apt-repository -y ppa:bitcoin/bitcoin
apt-get update &&

{ 
sed -e 's|#.*$||g' ${APT_PACK_LIST_FILE} | xargs apt-get install -y; 
sed -e 's|#.*$||g' ${APT_PACK_LIST_FILE} | xargs apt-get install -y;
sed -e 's|#.*$||g' ${APT_PACK_LIST_FILE} | xargs apt-get install -y;
} && 
apt -y autoremove && 
apt-get clean

#######################################
#######################################
#######################################

echo
echo "##########"
echo "$0 said: run ok."
echo "##########"
echo 
