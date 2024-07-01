if ! [ -x "$(command -v localsend_app)" ]; then
    LOCALSEND_VERSION=$(curl -s "https://api.github.com/repos/localsend/localsend/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
    cd /tmp/omakub-davidjr82-debs
    wget "https://github.com/localsend/localsend/releases/latest/download/LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
    sudo apt install -y ./LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb
    # rm "LocalSend-${LOCALSEND_VERSION}-linux-x86-64.deb"
    cd -
else
    echo "LocalSend is already installed"
fi