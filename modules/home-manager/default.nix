{ config, pkgs, ... }: {
  imports = [ ];

  home.packages = with pkgs; [
    # Add your home-manager packages here
  ];

  hydenix.hm = {
    enable = true;
    comma.enable = true;
    dolphin.enable = true;
    editors = {
      enable = true;
      neovim = true;
      vscode = {
        enable = true;
        wallbash = true;
      };
      vim = true;
      default = "code";
    };
    fastfetch.enable = true;
    firefox.enable = true;
    git = {
      enable = true;
      name = "MicahPeacock";
      email = "micah.peacock@proton.me";
    };
    hyde.enable = true;
    hyprland = {
      enable = true;
      extraConfig = "";
    };
    lockscreen = {
      enable = true;
      hyprlock = true;
      swaylock = false;
    };
    notifications.enable = true;
    qt.enable = true;
    rofi.enable = true;
    screenshots = {
      enable = true;
      grim.enable = true;
      slurp.enable = true;
      satty.enable = false;
      swappy.enable = true;
    };
    shell = {
      enable = true;
      zsh.enable = false;
      zsh.configText = "";
      bash.enable = false;
      fish.enable = true;
      pokego.enable = false;
      p10k.enable = false;
      starship.enable = true;
    };
    social = {
      enable = true;
      discord.enable = true;
      webcord.enable = false;
      vesktop.enable = false;
    };
    spotify.enable = true;
    swww.enable = true;
    terminals = {
      enable = true;
      kitty = {
        enable = true;
        configText = "";
      };
    };
    theme = {
      enable = true;
      active = "Obsidian Purple";
      themes = [
        "Amethyst Aura"
        "Ancient Aliens"
        "Catppuccin Mocha"
        "Code Garden"
        "Green Lush"
        "Moonlight"
        "Obsidian Purple"
        "One Dark"
        "Paranoid Sweet"
        "Piece of Mind"
        "Tokyo Night"
      ];
    };
    waybar.enable = true;
    wlogout.enable = true;
    xdg.enable = true;
  };
}
