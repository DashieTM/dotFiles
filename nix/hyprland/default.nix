{ inputs
, lib
, pkgs
, ...
}: {
  imports = [ 
    ./config.nix
    ./anyrun.nix
    ./ironbar.nix
  ];

  home.packages = with pkgs; [
    xorg.xprop
    grim
    slurp
    swappy
    xdg-desktop-portals-gtk
    xdg-desktop-portals-hyprland
    hyprpaper
    ironbar
    copyq
    gnome.nautilus
    gnome.sushi
  ];


  wayland.windowManager.hyprland.enable = true;
}
