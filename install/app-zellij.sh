if ! [ -x "$(command -v zellij)" ]; then
    cd /tmp/omakub-davidjr82-debs
    wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
    tar -xf zellij.tar.gz zellij
    sudo install zellij /usr/local/bin
    rm zellij.tar.gz zellij
    cd -
else
    echo "Zellij is already installed"
fi

# reset zellij configuration
rm -rf ~/.config/zellij/
mkdir -p ~/.config/zellij/
cp -r ~/.local/share/omakub-davidjr82/configs/zellij/. ~/.config/zellij/