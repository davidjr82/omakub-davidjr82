# See https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
# for a guide on how to run Ubuntu inside it.
sudo apt install -y linux-headers-$(uname -r) dkms

# TODO: Accept user terms breaks the scritp
# sudo apt install -y virtualbox virtualbox-ext-pack
# sudo usermod -aG vboxusers ${USER}
