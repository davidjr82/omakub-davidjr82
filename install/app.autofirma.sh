if ! [ -x "$(command -v autofirma)" ]; then
    cd /tmp/omakub-davidjr82-debs
    curl https://estaticos.redsara.es/comunes/autofirma/currentversion/AutoFirma_Linux_Debian.zip --output AutoFirma_Linux_Debian.zip
    unzip AutoFirma_Linux_Debian.zip
    sudo apt install -y ./*.deb
    rm *.deb
    cd -
else
    echo "AutoFirma is already installed"
fi
