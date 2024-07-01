# repository fonts
sudo apt-get install -y ttf-mscorefonts-installer

# downloaded fonts
for script in /home/djimenez/projects/omakub-davidjr82/fonts/!(_install-font).sh; do source $script; done