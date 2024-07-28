{ pkgs, ... }: {
  # Tool Replacements
  cd = "z"; # Zoxide (functions are created by zoxide cli on shell startup)
  ls = "${pkgs.eza}/bin/eza";
  l = "${pkgs.eza}/bin/eza -labghm --all --icons --git --color=always";

  # Utility
  darwin-switch = "darwin-rebuild switch --flake ~/.config/nix"; # quick nix-darwin switch (specify the flake path)
  tailscale = "/Applications/Tailscale.app/Contents/MacOS/Tailscale";
}
