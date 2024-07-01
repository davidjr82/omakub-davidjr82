if ! command -v anydesk &> /dev/null
    cd /tmp/omakub-davidjr82-debs
    wget 'https://download.anydesk.com/linux/anydesk_6.3.2-1_amd64.deb'
    sudo apt install -y ./anydesk_6.3.2-1_amd64.deb
    # rm anydesk_6.3.2-1_amd64.deb
    cd -
else
    echo "AnyDesk is already installed"
fi