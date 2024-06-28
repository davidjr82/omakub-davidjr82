sudo apt install linux-headers-$(uname -r) dkms
sudo apt install virtualbox virtualbox-guest-additions-iso virtualbox-guest-utils
sudo usermod -a -G vboxusers $USER
