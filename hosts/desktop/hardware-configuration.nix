{ config, lib, pkgs, modulesPath, ... }: {
  imports = [
    (modulesPath + "/installer/scan/not-detected.nix")
  ];

  boot.initrd.availableKernelModules = [ "xhci_pci" "nvme" "ahci" "usbhid" "usb_storage" "sd_mod" ];
  boot.initrd.kernelModules = [ ];
  boot.kernelModules = [ "kvm-amd" ];
  boot.extraModulePackages = [ ];

  fileSystems."/" = {
    fsType = "tmpfs";
    options = [
      "noatime"
      "size=8G"
      "mode=755"
    ];
  };

  fileSystems."/home" = {
    options = [
      "compress=zstd"
      "noatime"
      "subvol=@home"
    ];
  };

  fileSystems."/nix" = {
    options = [
      "compress=zstd"
      "noatime"
      "subvol=@nix"
    ];
  };

  fileSystems."/nix/persist" = {
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
