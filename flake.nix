{
  description = "My laptop's nix-darwin + home-manager setup";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    darwin = {
      url = "github:lnl7/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ darwin, nixpkgs, home-manager, ... }:
    let

      inherit (darwin.lib) darwinSystem;
      inherit (nixpkgs.lib) attrValues makeOverridable optionalAttrs singleton;

      # Configure nixpkgs to allow unfree software
      nixpkgsConfig = {
        config =
          { allowUnfree = true; };
      };
    in
    {
      darwinConfigurations = {
        Surveillance-Van = darwin.lib.darwinSystem {
          system = "aarch64-darwin";
          modules = [
            ./darwin.nix
            home-manager.darwinModules.home-manager
            {
              nixpkgs = nixpkgsConfig;
              # Home Manager
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.users.ari = import ./home.nix;
            }
          ];
        };
      };
      formatter.aarch64-darwin = nixpkgs.legacyPackages.aarch64-darwin.nixpkgs-fmt;
    };
}
