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
    # tumbler.enable = true;
    # gnome.gnome-keyring.enable = true;
    smartd = {
      enable = true;
      autodetect = true;
    };
  };
}
