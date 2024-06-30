cat <<EOF >~/.local/share/applications/WhatsApp.desktop
[Desktop Entry]
Version=1.0
Name=WhatsApp
Comment=WhatsApp Messenger
Exec=google-chrome --app="https://web.whatsapp.com" --name=WhatsApp
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub-davidjr82/applications/icons/WhatsApp.png
Categories=Network;
Keywords=WhatsApp;webapp;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF