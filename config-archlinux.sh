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

# Makepkg does not allow running as root
# Create a new user `builder`
# `builder` needs to have a home directory because some PKGBUILDs will try to
# write to it (e.g. for cache)
useradd builder -m
# When installing dependencies, makepkg will use sudo
# Give user `builder` passwordless sudo access
echo "builder ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers

sudo -H -u builder ghcup install stack latest
sudo -H -u builder ghcup install ghc latest
sudo -H -u builder ghcup install cabal latest

sudo -H -u builder ghcup set stack latest
sudo -H -u builder ghcup set ghc latest
sudo -H -u builder ghcup set cabal latest

