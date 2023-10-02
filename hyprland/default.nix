{ inputs
, lib
, pkgs
, ...
}: {
  imports = [ ./config.nix ];

  home.packages = with pkgs; [
    xorg.xprop
    grim
    slurp
    swappy
    xdg-desktop-portals-hyprland
    hyprpaper
  ];

  wayland.windowManager.hyprland.enable = true;
}
