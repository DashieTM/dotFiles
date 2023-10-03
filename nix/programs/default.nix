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
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };


  programs.home-manager.enable = true;
  networking.networkmanager.enable = true;
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "qt5ct";

  imports = [
    flatpaks.nixosModules.default
    ../kitty.nix
    ../coding.nix
    ../media.nix
    ../xdg.nix
    ../flatpak.nix
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.mihai = { };
    };
    fish = { };
    ripgrep = { };
    rm-improved = { };
    bat = { };
    fd = { };
    lsd = { };
    nerdfonts = { };
    flatpak = { };
    gnome.gnome-software = { };
  };

  home.activation = { inherit dconfDark; };
  services.flatpak.enable = true;
  environment.etc = {
    "flatpak/remotes.d/flathub.flatpakrepo".source = pkgs.fetchurl {
      url = "https://dl.flathub.org/repo/flathub.flatpakrepo";
      # Let this run once and you will get the hash as an error.
      hash = "";
    };
  };
}
