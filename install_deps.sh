#!/bin/bash

# Uncomment the community [multilib] repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
sudo pacman -Syyu --noconfirm

# Install basic packages
sudo pacman -S --noconfirm \
                 wget  \
                 cmake svn lzip patchelf \
                 inetutils python2 lld llvm \
                 clang gcc gcc-libs g++ bc ccache multilib-devel glibc

export PATH=/usr/bin/:$PATH
export LD_LIBRARY_PATH=/usr/lib64/:$LD_LIBRARY_PATH
