{
  description = "afonso system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs?ref=nixos-23.05";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager
  }: let 
    system = "x86_64-linux";
    pkgs = import nixpkgs {
      inherit system;
      config.allowUnfree = true;
    };
    lib = nixpkgs.lib;
  in {
    nixosConfigurations = {
      afonso = lib.nixosSystem {
      inherit system;
      modules = [ 
      ./system/configuration.nix];
      };
    };
    home-manager.lib.homeManagerConfiguration = {
      inherit pkgs;
      modules = [ ./modules/home.nix ];
    };
  };
}
