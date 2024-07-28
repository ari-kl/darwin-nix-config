{ config, pkgs, ... }:

{
  users.users.ari = {
    name = "ari";
    home = "/Users/ari";
  };

  programs.fish.enable = true;

  environment.shells = with pkgs; [ fish zsh ];

  networking = {
    computerName = "Surveillance Van";
    hostName = "Surveillance-Van";
  };

  # Used for backwards compatibility, please read the changelog before changing.
  # $ darwin-rebuild changelog
  system.stateVersion = 4;
  nix = {
    package = pkgs.nixVersions.git;

    # Automatically run the garbage collector at the beginning of every week
    gc = {
      automatic = true;
      interval = { Weekday = 0; };
      options = "--delete-older-than 1w";
    };

    # Nix settings
    settings.auto-optimise-store = true;
    settings.experimental-features = "nix-command flakes";
  };

  # Enable nix daemon
  services.nix-daemon.enable = true;
}
