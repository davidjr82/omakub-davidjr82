# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git unzip

sudo apt install -y flatpak
sudo apt install -y gnome-software-plugin-flatpak
sudo flatpak remote-add --if-not-exists flathub https://dl.flathub.org/repo/flathub.flatpakrepo

mkdir -p /tmp/omakub-davidjr82-debs

# other utils
sudo apt install -y net-tools

echo "Cloning omakub-davidjr82..."
git clone -b develop https://github.com/davidjr82/omakub-davidjr82.git ~/.local/share/omakub-davidjr82 > /dev/null

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Run installers
for script in ~/.local/share/omakub-davidjr82/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y
sudo apt-get autoremove -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Recommendations
source ~/.local/share/omakub-davidjr82/post-install-recommendations.sh

# Logout to pickup changes
echo ""
echo "Logout for all settings to take effect (paste this command in the terminal):"
echo "gnome-session-quit --logout --no-prompt"
echo ""
echo ""
# gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
