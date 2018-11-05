#!/usr/bin/bash
cd ~
set -e
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
wget https://raw.githubusercontent.com/ChrisTitusTech/fedora-setup/master/fedora.packages
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Install Atom repo
sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
# Update cache for package installs
sudo dnf makecache

# grab all packages to install
sudo dnf install $(cat fedora.packages) -y

#Custom shell prompt with aliases Source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
cat bashrc.aliases >> ~/.bashrc

#Disable Weyland and use Xorg
sed -i '/WeylandEnable/s/^#//g' /etc/gdm/custom.conf

sudo dnf upgrade -y
