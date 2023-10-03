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
  inputs.flatpaks.url = "github:GermanBread/declarative-flatpak/stable";

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
