{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/boot" = {
    fsType = "vfat";
    options = [ "defaults" "umask=0077" ];
  };

  fileSystems."/" = {
    fsType = "tmpfs";
    options = [
      "noatime"
      "size=8G"
      "mode=755"
    ];
  };

  fileSystems."/home" = {
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "noatime"
      "subvol=@home"
    ];
  };

  fileSystems."/nix" = {
    fsType = "btrfs";
    options = [
      "compress=zstd"
      "noatime"
      "subvol=@nix"
    ];
  };

  fileSystems."/nix/persist" = {
    fsType = "btrfs";
    neededForBoot = true;
    options = [
      "compress=zstd"
      "noatime"
      "subvol=@persist"
    ];
  };

  swapDevices = lib.mkForce [ ];

  networking.useDHCP = lib.mkDefault true;
  # networking.interfaces.eno1.useDHCP = lib.mkDefault true;
  # networking.interfaces.wlp11s0.useDHCP = lib.mkDefault true;

  nixpkgs.hostPlatform = lib.mkDefault "x86_64-linux";
  hardware.cpu.amd.updateMicrocode = lib.mkDefault config.hardware.enableRedistributableFirmware;
}
