#!/usr/bin/bash

set -e

dnf install $(cat fedora.packages) -y

git clone https://github.com/syl20bnr/spacemacs.git ~/.emacs.d
cp spacemacs.el ~/.spacemacs

cat bashrc.aliases >> ~/.bashrc

echo "TODO: Gnome Tweak: Alternate Tab"
echo "TODO: Gnome Tweak: Open New Window Instance"
echo "TODO: Download Chrome"
echo "TODO: Install Chrome"
echo "TODO: dnf update -y"
