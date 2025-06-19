{ inputs, username, hostname, ... }: let
  pkgs = import inputs.hydenix.inputs.hydenix-nixpkgs {
    inherit (inputs.hydenix.lib) system;
    config.allowUnfree = true;
    overlays = [
      inputs.hydenix.lib.overlays
      (final: prev: {
        userPkgs = import inputs.nixpkgs {
          config.allowUnfree = true;
        };
      })
    ];
  };
in {
  nixpkgs.pkgs = pkgs;
  imports = [
    inputs.hydenix.inputs.home-manager.nixosModules.home-manager
    inputs.hydenix.lib.nixOsModules

    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-gpu-amd
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc
    inputs.hydenix.inputs.nixos-hardware.nixosModules.common-pc-ssd

    ./disko.nix
    ./hardware-configuration.nix
    ./impermanence.nix
    ../../modules/system
    ../../modules/drivers
  ];

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
    };

    users."${username}" = { ... }: {
      imports = [
        inputs.hydenix.lib.homeModules
        inputs.nix-index-database.hmModules.nix-index
        ../../modules/home-manager
      ];
    };
  };

  programs = {
    fuse.userAllowOther = true;
    fish.enable = true;
  };

  hydenix = {
    enable = true;
    hostname = "${hostname}";
    timezone = "America/Edmonton";
    locale = "en_CA.UTF-8";
    boot = {
      enable = true;
      useSystemdBoot = false;
      grubTheme = "Retroboot";
      grubExtraConfig = "";
      kernelPackages = pkgs.linuxPackages_latest;
    };
    gaming.enable = false;
  };

  users.mutableUsers = false;
  users.users."${username}" = {
    isNormalUser = true;
    description = "Micah Peacock";
    hashedPassword = "$6$Xhb4wrtUnbRV77gz$wOdz/NaWT6HheRzNi9Bp8Ia0D2D5lSMGPLMmqKxgjtAk2ZhvaQEVC9Ok91Lc1KikcqSkTfhX0coyRD7znJZub1"; # In a separate window, $ nix-shell --run 'mkpasswd -m SHA-512 -s' -p mkpasswd
    extraGroups = [
      "video"
      "audio"
      "input"
      "docker"
      "libvirtd"
      "networkmanager"
      "wheel"
    ];
    shell = pkgs.fish;
  };

  zramSwap.enable = true;

  system.stateVersion = "25.05";
}
