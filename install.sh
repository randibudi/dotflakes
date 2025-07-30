#!/bin/sh
set -euo pipefail

FLAKE_DIR="$(dirname "$(realpath "$0")")"

# Partition, format, and mount disks
sudo nix \
  --experimental-features "nix-command flakes" \
  run github:nix-community/disko/latest -- \
  --mode destroy,format,mount \
  --flake "path:${FLAKE_DIR}#asus-m3400qa"

# Install NixOS system
sudo nixos-install \
  --no-channel-copy \
  --no-root-password \
  --flake "path:${FLAKE_DIR}#asus-m3400qa"
