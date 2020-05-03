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
                 clang bc ccache multilib-devel glibc
