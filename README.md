# dotfiles

My dotfiles for CachyOS and macOS, managed by [chezmoi](https://www.chezmoi.io).

## Usage

### Prerequisits

[CachyOS Desktop Edition](https://cachyos.org/download/) or a Mac.

### Setup

#### Required packages

Install required packages:

###### CachyOS

```bash
paru -S \
  chezmoi \
  ttf-firacode-nerd \
  libfido2 \
  fprintd \
  starship \
  zellij \
  eza \
  zoxide \
  atuin \
  mise \
  github-cli \
  lazygit \
  tree-sitter-cli \
  neovim \
  lazydocker \
  docker \
  docker-buildx \
  docker-compose
```

##### macOS

```bash
brew install
  chezmoi \
  starship \
  zellij \
  eza \
  zoxide \
  atuin \
  mise \
  github-cli \
  lazygit \
  tree-sitter-cli \
  neovim
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
