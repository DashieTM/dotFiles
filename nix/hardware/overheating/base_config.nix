{ lib, config, ... }: {
  imports = [
    ../../modules/ironbar_config.nix
  ];
  wayland.windowManager.hyprland.settings.monitor = [
    # default
    "eDP-1,2944x1840@90,0x0,2"

    # all others
    ",highrr,auto,1"
  ];
  programs.ironbar.monitor = "eDP-1";
}
