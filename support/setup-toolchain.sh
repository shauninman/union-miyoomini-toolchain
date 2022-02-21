#! /bin/sh

TOOLCHAIN_TAR="miyoomini-toolchain.tar.xz"
TOOLCHAIN_URL="https://github.com/shauninman/miyoomini-toolchain-buildroot/releases/download/v0.0.1/$TOOLCHAIN_TAR"

cd /opt
wget "$TOOLCHAIN_URL"
tar xf "./$TOOLCHAIN_TAR"
rm -rf "./$TOOLCHAIN_TAR"
