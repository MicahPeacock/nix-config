{ ... }: {
  services = {
    # libinput.enable = true;
    fstrim.enable = true;
    gvfs.enable = true;
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = true;
        KbdInteractiveAuthentication = true;
      };
      ports = [ 22 ];
    };
    blueman.enable = true;
    # tumbler.enable = true;
    # gnome.gnome-keyring.enable = true;
    smartd = {
      enable = true;
      autodetect = true;
    };
    pipewire = {
      enable = true;
      alsa.enable = true;
      alsa.support32Bit = true;
      pulse.enable = true;
      wireplumber.enable = true;
    };
  };
}
