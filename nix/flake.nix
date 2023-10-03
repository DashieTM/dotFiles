{
  description = "Dashie dots";

  inputs =
    {
      flatpaks.url = "github:GermanBread/declarative-flatpak/stable";
      nixpkgs-unstable.url = "github:nixos/nixpkgs";
    };

  outputs = { self, nixpkgs-unstable, home-manager, flatpaks }:
    let
      pkgs = import nixpkgs-unstable {
        system = "x86_64-linux";
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      import = [
        ./programs/default.nix
        ./hyprland/default.nix
      ];

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

      networking.networkmanager.enable = true;
      qt.enable = true;
      qt.platformTheme = "qt5ct";
      qt.style = "qt5ct";
    };
}
