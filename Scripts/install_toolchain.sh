#!/bin/bash

# Set the version and download URL of the toolchain
ARCH=$(uname -m)
TOOLCHAIN_VERSION=10.3-2021.10
TOOLCHAIN_URL=https://developer.arm.com/-/media/Files/downloads/gnu-rm/${TOOLCHAIN_VERSION}/gcc-arm-none-eabi-${TOOLCHAIN_VERSION}-${ARCH}-linux.tar.bz2

# Set the installation directory
INSTALL_DIR=/usr/share/

echo "================================================================"
echo "Installing in ${INSTALL_DIR}"
echo ""
echo "Downloading GNU arm ${TOOLCHAIN_VERSION}"



# # Download the toolchain
sudo wget -O /tmp/gcc-arm-none-eabi.tar.bz2 ${TOOLCHAIN_URL}

# # Extract the toolchain
sudo tar -xvf /tmp/gcc-arm-none-eabi.tar.bz2 -C ${INSTALL_DIR}

sudo rm /tmp/gcc-arm-none-eabi.tar.bz2

# Add the toolchain to the PATH
sudo apt install libncurses-dev
sudo ln -sf /usr/lib/x86_64-linux-gnu/libncurses.so.6 /usr/lib/x86_64-linux-gnu/libncurses.so.5
sudo ln -sf /usr/lib/x86_64-linux-gnu/libtinfo.so.6 /usr/lib/x86_64-linux-gnu/libtinfo.so.5


# Print the version information
arm-none-eabi-gcc --version
arm-none-eabi-gdb --version

echo "___________________________________________________"
echo ""
echo "Run the following commands to use GNU-Arm toolchain"
echo "___________________________________________________"
echo ""
echo "For BASH"
echo "    export PATH=\$PATH:${INSTALL_DIR}gcc-arm-none-eabi-${TOOLCHAIN_VERSION}/bin"
echo "    source ~/.bashrc"
echo ""

echo ""
echo "For fish"
echo "    set -a PATH ${INSTALL_DIR}gcc-arm-none-eabi-${TOOLCHAIN_VERSION}/bin"
echo ""