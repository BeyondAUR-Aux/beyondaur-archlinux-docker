#! /usr/bin/bash


# Enable the multilib repository
cat << EOM >> /etc/pacman.conf
[beyondaur]
SigLevel = Optional
Server = https://beyondaur.github.io/__repo__/\$arch
EOM

pacman -Syu --noconfirm --needed base-devel clang llvm libyaml libffi python hx-ghcup-hs



