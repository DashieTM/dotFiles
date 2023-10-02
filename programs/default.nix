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
  imports = [
    ../kitty.nix
  ];

  programs = {
    firefox = {
      enable = true;
      profiles.mihai = { };
    };
    fish = {};
    ripgrep = {};
    rm-improved = {};
    bat = {};
    fd = {};
    rustup = {};
  };

  home.activation = { inherit dconfDark; };
}
