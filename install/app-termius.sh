if ! [ -x "$(command -v termius)" ]; then
    cd /tmp/omakub-davidjr82-debs
    wget 'https://www.termius.com/download/linux/Termius.deb'
    sudo apt install -y ./Termius.deb
    rm Termius.deb
    cd -
else
    echo "Termius is already installed"
fi
