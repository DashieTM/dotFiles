{ lib
, self
, ...
}: {
  import = [
    ./programs/default.nix
    ./hyprland/default.nix
  ];

  home = {
    username = "dashie";
    homeDirectory = "/home/dashie";
    stateVersion = "23.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  networking.networkmanager.enable = true;
  qt.enable = true;
  qt.platformTheme = "qt5ct";
  qt.style = "qt5ct";
}
