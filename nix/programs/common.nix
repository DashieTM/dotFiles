{ pkgs
, ...
}:
{
  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  fonts.fontconfig.enable = true;
  home.packages = with pkgs; [
    vesktop
    kitty
    firefox
    fish
    ripgrep
    rm-improved
    bat
    fd
    lsd
    (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
    flatpak
    networkmanager
    zoxide
    pkgs.greetd.greetd
    pkgs.greetd.regreet
    fastfetch
    pkgs.gnome.gnome-keyring
    dbus
    killall
    adw-gtk3
    qt5ct
    qt6ct
    libadwaita
    gnutar
    fishPlugins.tide
    nix-index
    libnotify
    zenith
  ];

  home.sessionPath = [
    "$HOME/.cargo/bin"
  ];

  home.sessionVariables = {
    GOROOT = "$HOME/.go";
  };

  home.keyboard = null;

  home.file.".local/share/flatpak/overrides/global".text = ''
    [Context]
    filesystems=xdg-config/gtk-3.0;xdg-config/gtk-4.0
  '';

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-theme = "adw-gtk3";
      cursor-theme = "Bibata-Modern-Classic";
      cursor-size = 24;
    };
  };

  programs.nix-index =
    {
      enable = true;
      enableFishIntegration = true;
    };
}
