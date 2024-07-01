FONT_NAME="JetBrainsMono Nerd Font"
FONT_URL="https://github.com/ryanoasis/nerd-fonts/releases/latest/download/JetBrainsMono.zip"
FONT_FILE_TYPE="ttf"

source ~/.local/share/omakub-davidjr82/fonts/_install-font.sh

# set JetBrainsMono as default font in vs code
sed -i "s/\"editor.fontFamily\": \".*\"/\"editor.fontFamily\": \"$FONT_NAME\"/g" ~/.config/Code/User/settings.json