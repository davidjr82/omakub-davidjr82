# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.
sudo apt install -y linux-headers-$(uname -r) dkms

# TODO: Accept user terms breaks the script
# sudo apt install -y virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-utils virtualbox-guest-x11
# sudo usermod -aG vboxusers ${USER}
