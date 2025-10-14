#!/usr/bin/env bash

set -euo pipefail

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

log_info() {
  echo -e "${GREEN}[INFO]${NC} $1"
}

log_error() {
  echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on Arch Linux
if ! command -v pacman &>/dev/null; then
  log_error "This script requires Arch Linux (pacman not found)"
  exit 1
fi

log_info "Starting package installation..."

# Install required packages with paru
log_info "Installing required packages ..."
paru -S --needed --noconfirm \
  ttf-firacode-nerd \
  fcitx5 \
  hypridle \
  hyprlock \
  libnotify \
  blueberry \
  brightnessctl \
  libfido2 \
  fprintd \
  starship \
  zellij \
  eza \
  zoxide \
  atuin \
  mise \
  yazi \
  lazygit \
  lazydocker \
  docker \
  docker-buildx \
  docker-compose \
  tree-sitter-cli \
  neovim \
  uv

log_info "All packages installed and configured successfully!"
