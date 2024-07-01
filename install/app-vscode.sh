if ! command -v code &> /dev/null
    cd /tmp/omakub-davidjr82-debs
    wget -O vscode.deb 'https://code.visualstudio.com/sha/download?build=stable&os=linux-deb-x64'
    sudo apt install -y ./vscode.deb
    # rm vscode.deb
    cd -
else
    echo "Visual Studio Code is already installed"
fi