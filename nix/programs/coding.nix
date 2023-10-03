{ lib
, pkgs
, ...
}:
{

  home.packages = with pkgs; [
    git
    gcc
    clang
    make
    meson
    ninja
    rustup
    go
    node
    npm
    rustpython
    neovim
    typst
  ];

  programs.rustup = {
    channel = "nightly";
  };

}
