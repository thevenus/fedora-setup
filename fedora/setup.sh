#!/usr/bin/bash
cd ~
# First we setup the repositories so we can install lots of stuff
# Set Virtual Box repo
# wget https://raw.githubusercontent.com/ChrisTitusTech/fedora-setup/master/fedora.packages
# wget https://raw.githubusercontent.com/ChrisTitusTech/fedora-setup/master/bashrc.aliases
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y
# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y
# Install Atom repo
sudo rpm --import https://packagecloud.io/AtomEditor/atom/gpgkey
sudo sh -c 'echo -e "[Atom]\nname=Atom Editor\nbaseurl=https://packagecloud.io/AtomEditor/atom/el/7/\$basearch\nenabled=1\ngpgcheck=0\nrepo_gpgcheck=1\ngpgkey=https://packagecloud.io/AtomEditor/atom/gpgkey" > /etc/yum.repos.d/atom.repo'
# Update cache for package installs
sudo dnf makecache
# Install TeamViewer
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y
# grab all packages to install
sudo dnf install $(cat ~/dnf.pkgs) -y

#Custom shell prompt with aliases Source: https://www.linuxquestions.org/questions/linux-general-1/ultimate-prompt-and-bashrc-file-4175518169/
cat ~/bashrc.aliases >> ~/.bashrc

#Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf
