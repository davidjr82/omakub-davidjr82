if ! [ -x "$(command -v zellij)" ]; then
    cd /tmp/omakub-davidjr82-debs
    wget -O zellij.tar.gz "https://github.com/zellij-org/zellij/releases/latest/download/zellij-x86_64-unknown-linux-musl.tar.gz"
    tar -xf zellij.tar.gz zellij
    sudo install zellij /usr/local/bin
    rm zellij.tar.gz zellij
    cd -

    mkdir -p ~/.config/zellij/
    [ ! -f "$HOME/.config/zellij/config.kdl" ] && cp ~/.local/share/omakub-davidjr82/configs/zellij.kdl ~/.config/zellij/config.kdl
    [ ! -L "$HOME/.config/zellij/themes" ] && ln -s ~/.local/share/omakub-davidjr82/themes/zellij ~/.config/zellij/themes
else
    echo "Zellij is already installed"
fi