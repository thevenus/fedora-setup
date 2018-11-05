#!/usr/bin/bash

set -e
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

dnf install $(cat fedora.packages) -y

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cp spacemacs.el ~/.spacemacs

cat bashrc.aliases >> ~/.bashrc

echo "TODO: Gnome Tweak: Alternate Tab"
echo "TODO: Gnome Tweak: Open New Window Instance"
echo "TODO: Download Chrome"
echo "TODO: Install Chrome"
echo "TODO: dnf update -y"
