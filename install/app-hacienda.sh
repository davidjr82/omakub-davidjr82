sudo apt install -y pcscd pcsc-tools pinentry-gtk2 libassuan0 libccid
sudo systemctl start pcscd
sudo systemctl enable pcscd

# autofirma
if ! [ -x "$(command -v autofirma)" ]; then
    
    cd /tmp/omakub-davidjr82-debs
    
    curl https://estaticos.redsara.es/comunes/autofirma/1/8/3/AutoFirma_Linux_Debian.zip --output AutoFirma_Linux_Debian.zip
    unzip AutoFirma_Linux_Debian.zip
    sudo apt install -y ./AutoFirma_1_8_3.deb
    rm AutoFirma_1_8_3.deb.deb

    curl https://www.sede.fnmt.gob.es/documents/10445900/11635686/libpkcs11-fnmtdnie_1.6.9_amd64.deb/ --output libpkcs11-fnmtdnie_1.6.9_amd64.deb
    sudo apt install -y ./libpkcs11-fnmtdnie_1.6.9_amd64.deb
    rm libpkcs11-fnmtdnie_1.6.9_amd64.deb
    open  /usr/share/libpkcs11-fnmtdnie/launch.html
    
    cd -
else
    echo "AutoFirma is already installed"
fi
