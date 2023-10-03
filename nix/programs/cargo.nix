{ inputs
, lib
, pkgs
, rustPlatform
, ...
}: {
  imports = [
    ./config.nix
    ./anyrun.nix
    ./ironbar.nix
  ];

  home.packages = with pkgs; [
    (rustPackage {
      name = "oxinoti";
      version = "0.1.1";
      src = fetchCrate {
        inherit name version;
        sha256 = lib.fakesha256;
      };
    })
    (rustPackage {
      name = "oxidash";
      version = "0.1.0";
      src = fetchCrate {
        inherit name version;
        sha256 = lib.fakesha256;
      };
    })
    (rustPackage {
      name = "oxishut";
      version = "0.1.0";
      src = fetchCrate {
        inherit name version;
        sha256 = lib.fakesha256;
      };
    })
  ];
}

