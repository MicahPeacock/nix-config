{ config, pkgs, ... }: {
  imports = [
    ./boot.nix
    ./flatpak.nix
    ./hardware.nix
    ./networking.nix
  ];

  environment.systemPackages = with pkgs; [
    # Add your system packages here
  ];
}
