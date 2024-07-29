# darwin-nix-config

This repository contains my personal [nix-darwin](https://github.com/LnL7/nix-darwin) and [home-manager](https://github.com/nix-community/home-manager) configuration that I use on my laptop.

## Usage

1. Install Nix
2. Clone this repository
3. Initial setup: run `nix run nix-darwin -- switch --flake /path/to/repo`
4. Subsequent updates: run `darwin-rebuild switch --flake /path/to/repo`
