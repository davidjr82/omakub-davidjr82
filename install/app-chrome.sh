mkdir -p /tmp/omakub-davidjr82-debs
if [ ! -f /tmp/omakub-davidjr82-debs/google-chrome-stable_current_amd64.deb ]; then
    cd /tmp/omakub-davidjr82-debs
    wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
    sudo apt install -y ./google-chrome-stable_current_amd64.deb
    # rm google-chrome-stable_current_amd64.deb
    xdg-settings set default-web-browser google-chrome.desktop
    cd -
fi
