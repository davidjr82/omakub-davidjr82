mkdir -p ~/.local/share/fonts

FONT_FILE_NAME="${FONT_NAME/ Nerd Font/}"

if ! $(fc-list | grep -i "$FONT_NAME" > /dev/null); then
    cd /tmp/omakub-davidjr82-debs
    wget -O "$FONT_FILE_NAME.zip" "$FONT_URL"
    unzip -o "$FONT_FILE_NAME.zip" -d "$FONT_FILE_NAME"
    cp "$FONT_FILE_NAME"/*."$FONT_FILE_TYPE" ~/.local/share/fonts
    rm -rf "$FONT_FILE_NAME.zip" "$FONT_FILE_NAME"
    fc-cache
    cd -
fi