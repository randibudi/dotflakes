# dotflakes

My personal NixOS configuration using Nix flakes.

## Installation

To install NixOS using this flake:

1. Boot from NixOS minimal ISO
2. Connect to internet
3. Run the installer:

```bash
sudo nix \
--experimental-features "nix-command flakes" \
run github:randizzwell/dotflakes#install
```

After installation, the flake will be available at `~/.dotflakes`.
