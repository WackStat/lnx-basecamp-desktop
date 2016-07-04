#### Install script for a dektop installation
#### Elementary OS Freya, Ubuntu 14.04 LTS Trusty
lsb_release -a      # Relase distribution
cat /proc/version   # Internals

# Backup the source list and disable the cdrom repo
sudo cp /etc/apt/sources.list /etc/apt/sources.list.orig
sudo sed -e '/cdrom/ s/^#*/#/' -i /etc/apt/sources.list

#### Console Apps #####

# Upgrade the base system
sudo apt-get update && sudo apt-get --yes upgrade

# Console essentials
sudo apt-get --yes install zsh byobu vim alpine
sudo apt-get --yes install rsync parallel pv
sudo apt-get --yes install git-core tree 

# Network essentials
sudo apt-get --yes install nmap ngrep netcat mtr curl
sudo apt-get --yes install ssh wget lftp rtorrent ufw

# One archiver, one stat tool to rule them all
sudo apt-get --yes install dtrx dstat

# More utils
sudo apt-get --yes install qalc dict

# Bring some fun
sudo apt-get --yes install cowsay fortune lolcat

# Dev-java (default version)
sudo apt-get --yes install default-jdk maven2
sudo update-alternatives --config java

# Dev-R (default version)
sudo apt-get --yes install r-base r-base-dev

# Dev-nodejs (default version)
sudo apt-get --yes install nodejs npm


#### Grapical X Apps ####

## Upgrade graphical drivers (Intel), download deb files
# https://01.org/linuxgraphics/downloads

# Add the repo and keys, install the package
sudo sh -c 'echo "deb https://download.01.org/gfx/ubuntu/14.04/main trusty main" >> /etc/apt/sources.list.d/intel-graphics.list'
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg -O - | \
sudo apt-key add -
wget --no-check-certificate https://download.01.org/gfx/RPM-GPG-KEY-ilg-2 -O - | \
sudo apt-key add -
sudo apt-get update
sudo apt-get --yes install intel-linux-graphics-installer

## Must have for desktop

# Unrestricted codecs, fonts, flash
sudo apt-get --yes install ubuntu-restricted-extras libavcodec-extra libdvdread4
sudo /usr/share/doc/libdvdread4/install-css.sh

# Google Chrome, web shell
wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
sudo apt-get update
sudo apt-get --yes install google-chrome-stable
sudo apt-get --yes install icedtea-plugin

# Misc 
sudo apt-get --yes install dconf-editor gufw

# Better battery
sudo add-apt-repository ppa:linrunner/tlp -y && sudo apt-get update
sudo apt-get --yes install tlp tlp-rdw

## Elementary tweaks and eye-candiness

# Additional elementary stuff, mostly eye-candy
sudo add-apt-repository ppa:mpstark/elementary-tweaks-daily -y && sudo apt-get update
sudo apt-get --yes install elementary-tweaks

# Numix icons
sudo add-apt-repository ppa:numix/ppa -y && sudo apt-get update
sudo apt-get install numix-icon-theme and numix-icon-theme-circle

## Ubuntu after install for all those other optional propriety apps
sudo add-apt-repository ppa:thefanclub/ubuntu-after-install -y && sudo apt-get update
sudo apt-get --yes install ubuntu-after-install
# Atom / Sublime
# Spotify
# Evernote
# Gimp
# BleachBit


# Purge - use autoremove at your own risk ;)
#sudo apt-get autoremove
sudo apt-get autoclean
sudo apt-get clean

#### END
