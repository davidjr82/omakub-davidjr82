sudo apt install -y linux-headers-$(uname -r) dkms
sudo apt install -y virtualbox virtualbox-ext-pack virtualbox-guest-additions-iso virtualbox-guest-utils
sudo usermod -a -G vboxusers $USER
