{
  # Add the ironbar flake input
  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
  inputs.ironbar = {
    url = "github:JakeStanger/ironbar";
    inputs.nixpkgs.follows = "nixpkgs";
  };
  inputs.hm = {
    url = "github:nix-community/home-manager";
    inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs: {
    homeManagerConfigurations."USER@HOSTNAME" = inputs.hm.lib.homeManagerConfiguration {
      pkgs = nixpkgs.legacyPackages.x86_64-linux;
      modules = [
        # And add the home-manager module
        inputs.ironbar.homeManagerModules.default
        {
          programs.ironbar = {
            enable = true;
            config = "ironbar/config.toml";
            style = "ironbar/style.css";
            package = inputs.ironbar;
            features = [ "feature" "another_feature" ];
          };
        }
      ];
    };
  };
}
