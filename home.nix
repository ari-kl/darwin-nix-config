{ pkgs, ... }: {
  home = {
    username = "ari";
    homeDirectory = "/Users/ari";

    # Shell Configuration
    shellAliases = import ./shell/aliases.nix { inherit pkgs; };
    sessionPath = import ./shell/path.nix;
    sessionVariables = import ./shell/env.nix;

    # Packages not linked through another file
    packages = [
      pkgs.nixpkgs-fmt
    ];
  };

  programs = {
    fish = import ./programs/fish.nix { inherit pkgs; };
    git = import ./programs/git.nix;
    eza = import ./programs/eza.nix;
    zoxide = import ./programs/zoxide.nix;
  };

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";
}
