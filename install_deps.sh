#!/bin/bash

# Uncomment the community [multilib] repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
sudo pacman -Syyu --noconfirm

# Install basic packages
sudo pacman -S --noconfirm base-devel \
                 git wget  \
                 cmake svn lzip patchelf \
                 inetutils python2 lld llvm \
                 clang gcc g++ bc ccache multilib-devel

export PATH=/usr/bin/gcc:$PATH

yay -S --noconfirm ncurses5-compat-libs \
                lib32-ncurses5-compat-libs \
                aosp-devel xml2 lineageos-devel