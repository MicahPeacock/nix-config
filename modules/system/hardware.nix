{ pkgs, ... }: {
  hardware = {
    graphics.enable = true;
    graphics.enable32Bit = true;
    enableRedistributableFirmware = true;

    bluetooth.enable = true;
    bluetooth.powerOnBoot = true;
  };

  environment.systemPackages = with pkgs; [
    # brightnessctl
    # udiskie
    # ntfs3g
    # exfat
    # libinput-gestures
    # libinput
    # lm_sensors
    # pciutils
  ];
}
