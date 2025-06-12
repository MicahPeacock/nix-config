{ config, pkgs, ... }: {
  imports = [
    ./boot.nix
    ./flatpak.nix
    ./hardware.nix
    ./networking.nix
    ./packaging.nix
    ./security.nix
    ./services.nix
    ./system.nix
    ./xserver.nix
  ];

  environment.systemPackages = with pkgs; [
    # Add your system packages here
  ];
}
