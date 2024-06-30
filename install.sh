# Exit immediately if a command exits with a non-zero status
set -e

# Needed for all installers
sudo apt update -y
sudo apt install -y curl git unzip
mkdir -p /tmp/omakub-davidjr82-debs

# other utils
sudo apt install -y net-tools

echo "Cloning omakub-davidjr82..."
git clone -b develop https://github.com/davidjr82/omakub-davidjr82.git ~/.local/share/omakub-davidjr82 > /dev/null

# Ensure computer doesn't go to sleep or lock while installing
gsettings set org.gnome.desktop.screensaver lock-enabled false
gsettings set org.gnome.desktop.session idle-delay 0

# Install fonts
mkdir -p ~/.local/share/fonts

set_font() {
  local font_name=$1
  local url=$2
  local file_type=$3
  local file_name="${font_name/ Nerd Font/}"

  if ! $(fc-list | grep -i "$font_name" > /dev/null); then
    cd /tmp
    wget -O "$file_name.zip" "$url"
    unzip -o "$file_name.zip" -d "$file_name"
    cp "$file_name"/*."$file_type" ~/.local/share/fonts
    rm -rf "$file_name.zip" "$file_name"
    fc-cache
    cd -
  fi

  sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$font_name\"/g" ~/.config/Code/User/settings.json
}

for script in ~/.local/share/omakub-davidjr82/fonts/*.sh; do source $script; done

# Run installers
for script in ~/.local/share/omakub-davidjr82/install/*.sh; do source $script; done

# Upgrade everything that might ask for a reboot last
sudo apt upgrade -y

# Revert to normal idle and lock settings
gsettings set org.gnome.desktop.screensaver lock-enabled true
gsettings set org.gnome.desktop.session idle-delay 300

# Recommendations
source ~/.local/share/omakub-davidjr82/post-install-recommendations.sh

# Logout to pickup changes
echo "Logout for all settings to take effect"
# gum confirm "Ready to logout for all settings to take effect?" && gnome-session-quit --logout --no-prompt
