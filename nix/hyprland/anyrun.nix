{ pkg
, inputs
, osConfig
, ...
}: {
  programs.anyrun = {
    config = {
      plugins = with inputs.anyrun.packages.${pkgs.system}; [
        applications
        rink
        shell
        websearch
        inputs.anyrun-nixos-options.packages.${pkgs.system}.default
      ];

      position = "center";
      hideIcons = false;
      width = { fraction = 0.3; };
      layer = "overlay";
      hidePluginInfo = true;
      closeOnClick = true;
    };

    extraCss = ''
      #window {
        border-radius: 10px;
        background-color: none; 
      }

      box#main {
        border-radius: 10px;
      }

      list#main {
        border-radius: 10px;
        margin: 0px 10px 10px 10px;
      }

      list#plugin {
        border-radius: 10px;
      }

      list#match {
        border-radius: 10px;
      }

      entry#entry {
        border: none;
        border-radius: 10px;
        margin: 10px 10px 0px 10px;
      }

      label#match-desc {
        font-size: 12px;
        border-radius: 10px;
      }

      label#match-title {
        font-size: 12px;
        border-radius: 10px;
      }

      label#plugin {
        font-size: 16px;
        border-radius: 10px;
      }

      * {
        border-radius: 10px;
      }
    '';
  };
}
