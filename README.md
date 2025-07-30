# dotflakes

My personal NixOS configuration using Nix flakes.

## Installation

To install this configuration:

1. Boot from NixOS minimal ISO
2. Connect to internet
3. Run the installer:

```bash
sudo nix \
--experimental-features "nix-command flakes" \
run github:randizzwell/dotflakes#install
```
