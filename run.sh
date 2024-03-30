#!/bin/bash

# set environment variables
export KBUILD_BUILD_HOST="picasso09"
export KBUILD_BUILD_USER="picasso"
export PATH="$(pwd)/clang/bin:$PATH"

# build kernel
make -j$(nproc --all) O=out ARCH=arm64 rock_defconfig
make -j16 O=out ARCH=arm64 \
                  CC=clang \
                  CROSS_COMPILE=aarch64-linux-gnu- \
                  CROSS_COMPILE_ARM32=arm-linux-gnueabi-

