mkdir -p ~/.local/share/fonts

FONT_FILE_NAME="${FONT_NAME/ Nerd Font/}"

if ! $(fc-list | grep -i "$FONT_NAME" > /dev/null); then
    cd /tmp/omakub-davidjr82-debs
    wget -O "$file_name.zip" "$FONT_URL"
    unzip -o "$file_name.zip" -d "$file_name"
    cp "$file_name"/*."$FONT_FILE_TYPE" ~/.local/share/fonts
    rm -rf "$file_name.zip" "$file_name"
    fc-cache
    cd -
fi