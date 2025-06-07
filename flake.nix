{
  description = "Micah Peacock's NixOS Flake";

  inputs = {
    nixpkgs.url = "nixpkgs/nixos-25.05";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    impermanence.url = "github:nix-community/impermanence";
    home-manager.url = "github:nix-community/home-manager";
  };

  outputs = { nixpkgs, disko, impermanence, home-manager, ... } @inputs: {
    nixosConfigurations = {
      nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./hosts/default
          ./hosts/default/disko.nix
          disko.nixosModules.disko
          impermanence.nixosModules.impermanence
        ];
      };
    };
  };
}
