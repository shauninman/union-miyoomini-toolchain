#! /bin/sh

TOOLCHAIN_VERSION=v0.0.2
TOOLCHAIN_TAR="miyoomini-toolchain.tar.xz"
TOOLCHAIN_URL="https://github.com/shauninman/miyoomini-toolchain-buildroot/releases/download/$TOOLCHAIN_VERSION/$TOOLCHAIN_TAR"

if [ -f "./$TOOLCHAIN_TAR" ]; then
	echo "using local toolchain"
	cp "./$TOOLCHAIN_TAR" /opt
	cd /opt
else
	echo "getting remote toolchain"
	cd /opt
	wget "$TOOLCHAIN_URL"
fi
tar xf "./$TOOLCHAIN_TAR"
rm -rf "./$TOOLCHAIN_TAR"
