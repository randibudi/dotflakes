#!/bin/sh
set -euo pipefail

GITHUB_REPO_PATH="randizzwell/dotflakes"
TARGET_MACHINE="asus-m3400qa"
TARGET_USER="randizzwell"

# Prepare disks
sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode destroy,format,mount \
  --flake "github:${GITHUB_REPO_PATH}#${TARGET_MACHINE}"

# Install OS
sudo nixos-install \
  --no-channel-copy \
  --no-root-password \
  --flake "github:${GITHUB_REPO_PATH}#${TARGET_MACHINE}"

# Setup flake
sudo nix-shell -p git \
  --run "git clone https://github.com/${GITHUB_REPO_PATH}.git /mnt/home/${TARGET_USER}/.dotflakes"
sudo chown -R 1000:100 "/mnt/home/${TARGET_USER}/.dotflakes"

printf "\n\033[1;33mInstallation complete. Please reboot and remove the bootable disk.\033[0m\n"
