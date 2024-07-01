if ! command -v zoom &> /dev/null
    cd /tmp/omakub-davidjr82-debs
    wget https://zoom.us/client/latest/zoom_amd64.deb
    sudo apt install -y ./zoom_amd64.deb
    # rm zoom_amd64.deb
    cd -
else
    echo "Zoom is already installed"
fi