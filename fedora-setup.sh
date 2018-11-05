#!/usr/bin/bash

set -e
# Set Virtual Box repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# grab all packages to install
sudo dnf install $(cat fedora.packages) -y

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cp spacemacs.el ~/.spacemacs

cat bashrc.aliases >> ~/.bashrc

sudo dnf upgrade -y
