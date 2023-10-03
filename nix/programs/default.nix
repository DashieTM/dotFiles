{ lib
, pkgs
, ...
}:
let
  colorschemePath = "/org/gnome/desktop/interface/color-scheme";
  dconf = "${pkgs.dconf}/bin/dconf";

  dconfDark = lib.hm.dag.entryAfter [ ] ''
    ${dconf} write ${colorschemePath} "'prefer-dark'"
  '';
in
{
  home = {
    username = "dashie";
    homeDirectory = "/home/dashie";
    stateVersion = "unstable";
    activation = { inherit dconfDark; };
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  imports = [
    flatpaks.nixosModules.default
    ../kitty.nix
    ../coding.nix
    ../media.nix
    ../xdg.nix
    ../flatpak.nix
  ];

  home.packages = with pkgs; [
    firefox
    fish
    ripgrep
    rm-improved
    bat
    fd
    lsd
    nerdfonts
    flatpak
    gnome.gnome-software
  ];

  services.flatpak.enable = true;
  programs.home-manager.enable = true;
  networking.networkmanager.enable = true;
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "qt5ct";
}
