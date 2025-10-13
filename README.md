# dotfiles

My dotfiles for CachyOS, managed by [chezmoi](https://www.chezmoi.io).

## Usage

### Prerequisits

- [CachyOS Desktop Edition](https://cachyos.org/download/)
- [Hyprland as desktop environment](https://wiki.cachyos.org/installation/desktop_environments/)

### Setup

#### Required packages

Install required packages:

```bash
pacman -S chezmoi libfido2 git
```

#### SSH key

Generate a new SSH key protected by Yubikey (default location, no passphrase)

```bash
ssh-keygen -t ed25519-sk -C 59441+jehrhardt@users.noreply.github.com
```

#### Setup dotfiles

Init and apply chezmoi:

```bash
chezmoi init --ssh --apply jehrhardt
```

This will automatically install and configure the system.
