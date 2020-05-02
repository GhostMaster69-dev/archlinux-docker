#!/bin/bash

# Uncomment the community [multilib] repository
sed -i "/\[multilib\]/,/Include/"'s/^#//' /etc/pacman.conf

# Run pacman to update
pacman -Syyu --noconfirm

# Install basic packages
pacman -S --noconfirm base-devel \
                 git wget multilib-devel \
                 cmake svn lzip patchelf \
                 inetutils python3 lld llvm \
                 clang gcc

# Install ncurses5-compat-libs, lib32-ncurses5-compat-libs, aosp-devel, xml2, and lineageos-devel
for package in ncurses5-compat-libs lib32-ncurses5-compat-libs aosp-devel xml2 lineageos-devel; do
        git clone https://aur.archlinux.org/"${package}"
        cd "${package}" || continue
        makepkg -si --skippgpcheck
        cd - || break
        rm -rf "${package}"
    done

