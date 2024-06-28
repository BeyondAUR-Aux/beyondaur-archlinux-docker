#! /usr/bin/bash


# Enable the multilib repository
cat << EOM >> /etc/pacman.conf
[multilib]
Include = /etc/pacman.d/mirrorlist

[beyondaur]
SigLevel = Optional
Server = https://beyondaur.github.io/__repo__/\$arch
EOM

pacman -Syu --noconfirm --needed base-devel hx-ghcup-hs libyaml libffi

ghcup install stack latest
ghcup install ghc latest
ghcup install cabal latest

ghcup set stack latest
ghcup set ghc latest
ghcup set cabal latest

