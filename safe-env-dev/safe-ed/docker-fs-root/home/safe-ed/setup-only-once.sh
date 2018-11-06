#!/bin/bash

ROOT_DIR=/
MAIN_DIR_NAME="safe-ed"

find ${ROOT_DIR}/home/{bankledger,ex-work,safe-ed}/ | grep  -E '.gitkeep|.gitignore'


mkdir -p ${ROOT_DIR}/home/${MAIN_DIR_NAME} &&
cd ${ROOT_DIR}/home/${MAIN_DIR_NAME}

#######################################
#######################################
#######################################

DEPENDS_GZ_FILE=${ROOT_DIR}/home/${MAIN_DIR_NAME}/build-aux/depends.*.tar.gz

tar xzvf ${DEPENDS_GZ_FILE} &&

rm -rf depends_bin/x86_64-linux && cp -rf depends depends_bin/x86_64-linux && 
( cd depends_bin/x86_64-linux && make -j4 ) &&

rm -rf depends_bin/x86_64-w64-mingw32 && cp -rf depends depends_bin/x86_64-w64-mingw32 &&
( cd depends_bin/x86_64-w64-mingw32 && make HOST=x86_64-w64-mingw32 -j4 ) &&

rm -rf depends_bin/i686-w64-mingw32 && cp -rf depends depends_bin/i686-w64-mingw32 &&
( cd depends_bin/i686-w64-mingw32 && make HOST=i686-w64-mingw32 -j4 ) &&

rm -rf depends_bin/x86_64-apple-darwin11 && cp -rf depends depends_bin/x86_64-apple-darwin11 &&
( cd depends_bin/x86_64-apple-darwin11 && make HOST=x86_64-apple-darwin11 -j4 ) ||

{
 echo "$0 said: run failed; abort now." ; exit 1; 
}

#######################################
#######################################
#######################################

echo 
echo "##########"
echo "$0 said: run ok."
echo "##########"
echo
