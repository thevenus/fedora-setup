#!/usr/bin/bash

set -e
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# enable mosquito/aton
sudo dnf copr enable mosquito/atom -y
# Update cache for package installs
sudo dnf makecache

# grab all packages to install
sudo dnf install $(cat fedora.packages) -y

#Custom shell prompt with aliases Source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
cat bashrc.aliases >> ~/.bashrc

#Disable Weyland and use Xorg
sed -i '/WeylandEnable/s/^#//g' /etc/gdm/custom.conf

sudo dnf upgrade -y
