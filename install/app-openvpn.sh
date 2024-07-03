sudo apt install -y openvpn

# Add the official openvpn repo
sudo install -m 0755 -d /etc/apt/keyrings
sudo wget -qO /etc/apt/keyrings/openvpn.asc https://packages.openvpn.net/packages-repo.gpg
sudo chmod a+r /etc/apt/keyrings/openvpn.asc
echo "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/openvpn.asc] https://packages.openvpn.net/openvpn3/debian $(. /etc/os-release && echo "$VERSION_CODENAME") main" | sudo tee /etc/apt/sources.list.d/openvpn3.list > /dev/null
sudo apt update

# Install openvpn cli
sudo apt install openvpn3
