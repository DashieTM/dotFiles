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
      homeConfigurations."dashie@spaceship" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hardware/spaceship.nix ];
      };
      homeConfigurations."dashie@overheating" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hardware/overheating.nix ];
      };
      homeConfigurations."dashie@marmo" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./hardware/marmo.nix ];
      };

      homeConfigurations."base" = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [
          ./programs/default.nix
          ./hyprland/default.nix
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
          }
        ];
      };
    };
}
