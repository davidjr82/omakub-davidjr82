# Personalized Ubuntu customization

Personal customization for fresh Ubuntu.

Original idea: https://omakub.org/

## Develop

```bash
rm -rf ~/.local/share/omakub-davidjr82 && wget -qO- https://raw.githubusercontent.com/davidjr82/omakub-davidjr82/develop/install.sh | bash
```

Post-installation recommendations:

```bash
rm -rf ~/.local/share/omakub-davidjr82 && wget -qO- https://raw.githubusercontent.com/davidjr82/omakub-davidjr82/develop/post-install-recommendations.sh | bash
```

## Main / Stable

```bash
rm -rf ~/.local/share/omakub-davidjr82 && wget -qO- https://raw.githubusercontent.com/davidjr82/omakub-davidjr82/main/install.sh | bash
```

Post-installation recommendations:

```bash
rm -rf ~/.local/share/omakub-davidjr82 && wget -qO- https://raw.githubusercontent.com/davidjr82/omakub-davidjr82/main/post-install-recommendations.sh | bash
```

## Delete temporary deb files
```bash
rm -rf /tmp/omakub-davidjr82-debs
```