#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

log_info() {
    echo -e "${GREEN}[INFO]${NC} $1"
}

log_warn() {
    echo -e "${YELLOW}[WARN]${NC} $1"
}

log_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if ! command -v pacman &> /dev/null; then
    log_error "This script requires Arch Linux (pacman not found)"
    exit 1
fi

log_info "Starting package installation..."

# Install base packages with pacman
log_info "Installing base packages with pacman..."
sudo pacman -S --needed --noconfirm base-devel rustup

# Configure rustup with stable toolchain
log_info "Setting up Rust stable toolchain..."
rustup default stable

# Install paru AUR helper if not already installed
if ! command -v paru &> /dev/null; then
    log_info "Installing paru AUR helper..."

    # Create temporary directory for paru installation
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"

    # Clone and build paru
    git clone https://aur.archlinux.org/paru.git
    cd paru
    makepkg -si --noconfirm

    # Clean up
    cd /
    rm -rf "$TEMP_DIR"

    log_info "paru installed successfully"
else
    log_info "paru already installed, skipping..."
fi

# Install required packages with paru
log_info "Installing required packages ..."
paru -S --needed --noconfirm \
    alacritty \
    atuin \
    bat \
    chezmoi \
    fish \
    mise \
    lazygit \
    starship \
    ttf-firacode-nerd \
    mako \
    hyprland \
    walker-bin \
    waybar \
    hypridle \
    hyprlock \
    libnotify \
    blueberry \
    brightnessctl \
    btop \
    ripgrep \
    fd \
    eza \
    zoxide \
    tree-sitter-cli \
    neovim \
    xdg-desktop-portal-gtk \
    xdg-desktop-portal-hyprland \
    qt5-wayland \
    qt6-wayland \
    hyprpolkitagent

# Set fish as default shell
log_info "Setting fish as default shell..."
FISH_PATH=$(which fish)

# Add fish to /etc/shells if not already present
if ! grep -q "^$FISH_PATH$" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
    log_info "Added fish to /etc/shells"
else
    log_info "Fish already in /etc/shells"
fi

# Change default shell to fish
if [ "$SHELL" != "$FISH_PATH" ]; then
    chsh -s "$FISH_PATH"
    log_info "Changed default shell to fish (will take effect on next login)"
else
    log_info "Fish is already the default shell"
fi

log_info "All packages installed and configured successfully!"
