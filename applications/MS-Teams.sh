cat <<EOF >~/.local/share/applications/MS-Teams.desktop
[Desktop Entry]
Version=1.0
Name=Microsoft Teams
Exec=google-chrome --app="https://teams.microsoft.com/v2/" --name="Microsoft Teams"
Terminal=false
Type=Application
Icon=/home/$USER/.local/share/omakub-davidjr82/applications/icons/MS-Teams.png
Categories=GTK;
MimeType=text/html;text/xml;application/xhtml_xml;
StartupNotify=true
EOF