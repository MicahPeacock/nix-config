{ config, pkgs, hostname, ... }: {
  imports = [
    ./audio.nix
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

  # time.timeZone       = lib.mkIf cfg.enable cfg.timezone;
  # i18n.defaultLocale  = lib.mkIf cfg.enable cfg.locale;
  # networking.hostName = lib.mkIf cfg.enable cfg.hostname;

  environment.systemPackages = with pkgs; [
    # Add your system packages here
  ];
}
