# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a personal dotfiles repository managed by [chezmoi](https://www.chezmoi.io), based on Omarchy Linux. The repository contains configuration files for various tools and applications in a structured format.

## Architecture

### Chezmoi Structure
- Files prefixed with `dot_` represent dotfiles (e.g., `dot_config` → `~/.config`)
- `.chezmoi.toml.tmpl` is a template file that prompts for git email and SSH key configuration
- `.chezmoiignore` excludes LICENSE and README.md from being applied

### Configuration Organization
- `dot_config/` - Contains application configuration files
  - `alacritty/` - Terminal emulator configuration (TOML format)
  - `hypr/` - Hyprland window manager configuration (split into multiple .conf files)
  - `lazygit/` - Git TUI configuration
  - `private_fish/` - Fish shell configuration
  - `starship.toml` - Cross-shell prompt configuration with custom symbols

## Common Commands

### Chezmoi Operations
```bash
# Initialize and apply dotfiles
chezmoi init --ssh --apply jehrhardt

# Apply changes after editing
chezmoi apply

# Edit a file managed by chezmoi
chezmoi edit ~/.config/alacritty/alacritty.toml

# Check what would change
chezmoi diff

# Add a new file to be managed
chezmoi add ~/.config/newapp/config.toml
```

### Setup Requirements
Install required packages (Arch Linux/yay):
```bash
yay -S atuin chezmoi fish libfido2 starship ttf-firacode-nerd
```

### SSH Key Setup
Generate SSH key with Yubikey protection:
```bash
ssh-keygen -t ed25519-sk -C 59441+jehrhardt@users.noreply.github.com
```

GitHub authentication and signing key setup:
```bash
gh auth login
gh auth refresh -h github.com -s admin:ssh_signing_key
gh ssh-key add ~/.ssh/id_ed25519_sk.pub --type signing --title <key_name>
```

### Shell Configuration
Set Fish as default shell:
```bash
echo $(which fish) | sudo tee -a /etc/shells
chsh -s $(which fish)
```

## Development Workflow

When modifying configurations:
1. Edit files directly in the chezmoi source directory
2. Test changes with `chezmoi diff`
3. Apply changes with `chezmoi apply`
4. Commit changes to track configuration evolution

## Configuration Dependencies

- **Omarchy Linux** - Base system requirement
- **Hyprland** - Window manager (configs in `dot_config/hypr/`)
- **Alacritty** - Terminal emulator with custom theme
- **Fish Shell** - Default shell with private configuration
- **Starship** - Cross-shell prompt with extensive language/tool symbols
- **Yubikey** - Hardware security key for SSH authentication