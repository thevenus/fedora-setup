#!/usr/bin/bash
# ===========================================
# ===== Setup Repos and Flatpak Remotes =====
# ===========================================

# First we setup the repositories so we can install lots of stuff
# Install Google Chrome repo
sudo dnf install fedora-workstation-repositories -y

# Install Rpmfusion repo
sudo dnf install https://download1.rpmfusion.org/free/fedora/rpmfusion-free-release-$(rpm -E %fedora).noarch.rpm https://download1.rpmfusion.org/nonfree/fedora/rpmfusion-nonfree-release-$(rpm -E %fedora).noarch.rpm -y

# Enable Flatpak Flathub 
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

# Update cache for package installs
sudo dnf makecache

# ===========================================
# ============ Installations ================
# ===========================================

# Install TeamViewer
sudo dnf install https://download.teamviewer.com/download/linux/teamviewer.x86_64.rpm -y

# Install packages (dnf)
sudo dnf install $(cat PackageLists/dnfs) -y

# Install Flatpak packages
flatpak install flathub $(cat PackageLists/flatpaks) -y

# Install Dash to dock
git clone https://github.com/micheleg/dash-to-dock.git
cd dash-to-dock
make && make install && echo "Installation of Dash to Dock extension is successful!\n"
cd ..
rm -r dash-to-dock

# Setting up Dotfiles and Binaries
sudo make clean
sudo make sync

# Disable Wayland and use Xorg
sudo sed -i '/WaylandEnable/s/^#//g' /etc/gdm/custom.conf
