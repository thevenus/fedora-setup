#!/usr/bin/bash

set -e
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Update cache for package installs
sudo dnf makecache

# grab all packages to install
sudo dnf install $(cat fedora.packages) -y

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cp spacemacs.el ~/.spacemacs

cat bashrc.aliases >> ~/.bashrc

sudo dnf upgrade -y
