#### Setup script for a dektop installation
#### Elementary OS Freya, Ubuntu 14.04 LTS Trusty
lsb_release -a      # Relase distribution
cat /proc/version   # Internals

#### Console ####

# Create an original lsb_realease to trick some checks
sudo cp /etc/lsb-release /etc/lsb-release.elementary
sudo echo 'DISTRIB_ID=Ubuntu
DISTRIB_RELEASE=14.04
DISTRIB_CODENAME=trusty
DISTRIB_DESCRIPTION="Ubuntu Trusty Tahr"' | sudo tee /etc/lsb-release.ubuntu

# Setup OH-MY-ZSH!
wget -–no-check-certificate https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh -O - | sh
sudo chsh -s $(which zsh) $(whoami)

#### Graphical X ####

# Update the grapical driver tricking the identity of the OS
# You only need to update if the driver is too old
sudo cp /etc/lsb-release.ubuntu /etc/lsb-release
intel-linux-graphics-installer
sudo cp /etc/lsb-release.elementary /etc/lsb-release

## Some default configuration with dconf-editor or gsettings below
# TODO

## Cosmetics

# Remove unwanted .desktop shortcuts from slingshot
sudo rm /usr/share/applications/byobu.desktop
sudo rm /usr/share/applications/R.desktop
sudo rm /usr/share/applications/ubuntu-after-install.desktop
sudo rm /usr/share/applications/dconf-editor.desktop

# Change the menu icon of slingshot
# https://www.reddit.com/r/elementaryos/comments/3fzd6s/tutorial_how_to_replace_the_applications_text_on/
# https://www.iconfinder.com/icons/526236/cheeky_determined_emoticons_mischievous_thinning_winking_smiley_icon#size=24

# Google Chrome, use theme below to integrate
# https://chrome.google.com/webstore/detail/elementary-os-03-freya-ch/faohdknlfnjkeaphndahbpabllhaodnl?hl=en-GB

### END
