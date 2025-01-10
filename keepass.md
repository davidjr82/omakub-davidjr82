# Download keepassxc
```
mkdir keepass_tmp
cd keepass_tmp
```
```
sudo apt install libfuse2t64

wget https://github.com/keepassxreboot/keepassxc/releases/download/2.7.9/KeePassXC-2.7.9-x86_64.AppImage
./KeePassXC-2.7.9-x86_64.AppImage --appimage-extract

mkdir /opt/keepassxc/
sudo mv squashfs-root /opt/keepassxc/

nano keepassxc.desktop
```

```
[Desktop Entry]
Name=KeepassXC
Type=Application
Categories=Network;
MimeType=image/svg+xml;
Exec=/opt/keepassxc/AppRun %F
Icon=/opt/keepassxc/keepassxc.svg
Terminal=false
StartupNotify=true
X-Desktop-File-Install-Version=0.27
```

```
sudo desktop-file-install keepassxc.desktop

cd ..
rm -rf keepass_tmp
```

# edit desktop file
sudo desktop-file-edit desktop-file-edit --set-key="Exec" --set-value="/opt/keepassxc/KeePassXC-2.7.9-x86_64.AppImage %F" keepassxc.desktop

# Create mount point
```
mkdir -p /home/djimenez/.keepass/remote_keepass_djimenez
mkdir -p /home/djimenez/.keepass/remote_keepass_edatta

chmod 700 /home/djimenez/.keepass/remote_keepass_djimenez
chmod 700 /home/djimenez/.keepass/remote_keepass_edatta
```
# Test mounting remote folder
```
sudo apt install rclone
rclone config
    new remote - keepass-djimenez - sftp - 143.42.56.88 - keepass-djimenez - 22 - y (password) - enter until end
    new remote - keepass-edatta - sftp - 143.42.56.88 - keepass-edatta - 22 - y (password) - enter until end

rclone mount keepass-djimenez:/keepass  ~/.keepass/remote_keepass_djimenez --daemon
rclone mount keepass-edatta:/keepass  ~/.keepass/remote_keepass_edatta --daemon
```

mount_keepass.sh:
```
#!/bin/bash

mkdir -p /home/djimenez/.keepass/remote_keepass_djimenez
/usr/bin/rclone mount keepass-djimenez:/keepass /home/djimenez/.keepass/remote_keepass_djimenez &

mkdir -p /home/djimenez/.keepass/remote_keepass_edatta
/usr/bin/rclone mount keepass-edatta:/keepass /home/djimenez/.keepass/remote_keepass_edatta &
```


# Unmount folder
```
fusermount -u /home/djimenez/.keepass/remote_keepass_djimenez
fusermount -u /home/djimenez/.keepass/remote_keepass_edatta
```
# keep on restart

sudo nano /etc/systemd/system/rclone_remote_keepass.service

```
[Unit]
Description=Mount remote folder for KeePassXC with Rclone
After=network-online.target
Wants=network-online.target

[Service]
Type=simple
User=djimenez
ExecStart=/home/djimenez/.keepass/mount_remotes.sh
ExecStop=/home/djimenez/.keepass/unmount_remotes.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```
```
sudo systemctl daemon-reload
sudo systemctl enable rclone_remote_keepass.service
sudo systemctl start rclone_remote_keepass.service
sudo systemctl status rclone_remote_keepass.service
sudo reboot
```
