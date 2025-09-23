# dotfiles

My dotfiles for Arch, managed by [chezmoi](https://www.chezmoi.io).

## Usage

### Prerequisits

- [Arch Linux](https://archlinux.org)

### Setup

#### Required packages

Install required packages:

```bash
pacman -S chezmoi libfido2 git
```

#### SSH key

Generate a new SSH key protected by Yubikey:

```bash
# use default location for SSH key
# use no passphrase
ssh-keygen -t ed25519-sk -C 59441+jehrhardt@users.noreply.github.com
```

#### Setup dotfiles

Init and apply chezmoi:

```bash
chezmoi init --ssh --apply jehrhardt
```

This will automatically install and configure everything.
