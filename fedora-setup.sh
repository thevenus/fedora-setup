#!/usr/bin/bash

set -e
# Set Virtual Box repo
sudo wget http://download.virtualbox.org/virtualbox/rpm/rhel/virtualbox.repo -P /etc/yum.repos.d/
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Install Google Chrome repo
sudo cat << EOF > /etc/yum.repos.d/google-chrome.repo
[google-chrome]
name=google-chrome
baseurl=http://dl.google.com/linux/chrome/rpm/stable/x86_64
enabled=1
gpgcheck=1
gpgkey=https://dl.google.com/linux/linux_signing_key.pub
EOF
# Update cache for package installs
sudo dnf makecache
# grab all packages to install
sudo dnf install $(cat fedora.packages) -y

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cp spacemacs.el ~/.spacemacs

cat bashrc.aliases >> ~/.bashrc

sudo dnf upgrade -y
