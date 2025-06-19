{
  description = "Micah Peacock's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    hydenix.url = "github:richen604/hydenix";
    impermanence.url = "github:nix-community/impermanence";
  };

  outputs = { nixpkgs, disko, hydenix, impermanence, ... } @inputs: let
    system   = "x86_64-linux";
    hostname = "nixos";
    username = "micahpeacock";
  in {
    nixosConfigurations = {
      nixos-desktop = hydenix.inputs.hydenix-nixpkgs.lib.nixosSystem {
        inherit (inputs.hydenix.lib) system;
        specialArgs = {
          inherit inputs;
          inherit username;
          inherit hostname;
        };
        modules = [
          ./hosts/desktop
          disko.nixosModules.disko
          impermanence.nixosModules.impermanence
          home-manager.nixosModules.home-manager
        ];
      };
    };
  };
}
