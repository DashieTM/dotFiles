{ lib, config, options, pkgs, ... }: {
  options.mods.stylix = {
    colorscheme = lib.mkOption {
      default = {
        # custom tokyo night
        base00 = "1A1B26";
        # base01 = "16161E";
        # base01 = "15161e";
        base01 = "191a25";
        base02 = "2F3549";
        base03 = "444B6A";
        base04 = "787C99";
        base05 = "A9B1D6";
        base06 = "CBCCD1";
        base07 = "D5D6DB";
        base08 = "C0CAF5";
        base09 = "A9B1D6";
        base0A = "0DB9D7";
        base0B = "9ECE6A";
        base0C = "B4F9F8";
        # base0D = "2AC3DE";
        # base0D = "A9B1D6";
        # base0D = "62A0EA";
        # base0D = "779EF1";
        base0D = "366fea";
        base0E = "BB9AF7";
        base0F = "F7768E";
      };
      example = "catppuccin-mocha";
      type = with lib.types; oneOf [ str attrs path ];
      description = ''
        Base16 colorscheme.
        Can be an attribute set with base00 to base0F,
        a string that leads to a yaml file in base16-schemes path,
        or a path to a custom yaml file.
      '';
    };
  };
  config = (lib.optionalAttrs (options?stylix) {
    stylix = {
      enable = true;
      image = ../../base/black.jpg;
      polarity = "dark";
      targets = {
        nixvim.enable = false;
        fish.enable = false;
      };

      fonts = {
        serif = {
          package = pkgs.cantarell-fonts;
          name = "Cantarell";
        };

        sansSerif = {
          package = pkgs.cantarell-fonts;
          name = "Cantarell";
        };

        monospace = {
          package = (pkgs.nerdfonts.override { fonts = [ "JetBrainsMono" ]; });
          # name = "JetBrains Mono Nerd";
          name = "JetBrainsMono Nerd Font Mono";
        };

        emoji = {
          package = pkgs.noto-fonts-emoji;
          name = "Noto Color Emoji";
        };
      };

      cursor = {
        package = pkgs.bibata-cursors;
        name = "Bibata-Modern-Classic";
        size = 24;
      };

      base16Scheme =
        (if builtins.isAttrs config.mods.stylix.colorscheme then config.mods.stylix.colorscheme else "${pkgs.base16-schemes}/share/themes/${config.mods.stylix.colorscheme}.yaml");
    };
  });
}
