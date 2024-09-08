#!/bin/bash

git config --global --add safe.directory /workdir/H618-Android12-Src
git config --global --add safe.directory /workdir/H618-Android12-Src/longan

# build u-boot/kernel
cd H618-Android12-Src/longan || exit 1
printf "0\n0\n2\n0\n0\n1\n" | ./build.sh config || exit 1
./build.sh || exit 1

# build android
cd ../  || exit 1
source build/envsetup.sh || exit 1
lunch apollo_p2-userdebug || exit 1
export CFLAGS="-v"
make -j$(nproc) || exit 1
pack || exit 1
