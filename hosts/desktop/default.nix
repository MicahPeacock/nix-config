{ config, pkgs, ... }: {
  imports = [
    ./disko.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/system
    ../../modules/drivers
  ];

  time.timeZone = "America/Edmonton";
  i18n.defaultLocale = "en_CA.UTF-8";

  drivers.amdgpu.enable = true;

  services.displayManager.sddm.enable = true;
  services.desktopManager.plasma6.enable = true;

  services.printing.enable = true;

  users.users.micahpeacock = {
    isNormalUser = true;
    description = "Micah Peacock";
    hashedPassword = "$6$Xhb4wrtUnbRV77gz$wOdz/NaWT6HheRzNi9Bp8Ia0D2D5lSMGPLMmqKxgjtAk2ZhvaQEVC9Ok91Lc1KikcqSkTfhX0coyRD7znJZub1"; # In a separate window, $ nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
    extraGroups = [
      "video"
      "audio"
      "input"
      "networkmanager"
      "wheel"
    ];
    packages = with pkgs; [
      kdePackages.kate
      brave
      zed-editor
    ];
  };

  nixpkgs.config.allowUnfree = true;
  environment.systemPackages = with pkgs; [
    vim
    wget
    git
  ];

  zramSwap.enable = true;

  system.stateVersion = "25.05";
}
