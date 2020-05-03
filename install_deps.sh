#!/bin/bash

# Uncomment the community [multilib] repository
sudo sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
sudo pacman -Syyu --noconfirm

# Install basic packages
sudo pacman -S --noconfirm base-devel \
                 git wget multilib-devel \
                 cmake svn lzip patchelf \
                 inetutils python2 lld llvm \
                 clang gcc g++ bc ccache

#export PATH=/usr/bin/gcc:$PATH
cd /home/builder

# Install ncurses5-compat-libs, lib32-ncurses5-compat-libs, aosp-devel, xml2, and lineageos-devel
for package in ncurses5-compat-libs lib32-ncurses5-compat-libs aosp-devel xml2 lineageos-devel; do
        git clone https://aur.archlinux.org/"${package}"
        cd ${package} || continue
        makepkg -sif --noconfirm --skippgpcheck
        #sudo pacman -U --noconfirm /home/builder/pkg/*.tar.xz
        cd - || break
        rm -rf "${package}"
    done
