{ default, ... }: {
  programs.kitty = {
    enable = true;

    settings = {
      enable_audio_bell = "no";
      window_alert_on_bell = "no";
      background_opacity = 0.8;
      cursor_blink_interval = 0;
      window_padding_width = 1;
      shell_integration = "yes";
      sync_with_monitor = "no";

      font_family = "JetBrainsMono Nerd Font Mono";
      bold_font = "JetBrainsMono Nerd Font Mono Extra Bold";
      italic_font = "JetBrainsMono Nerd Font Mono Extra Italic";
      bold_italic_font = "JetBrainsMono Nerd Font Mono Extra Bold Italic";

      background = "#1a1b25";
      foreground = "#c5c8c6";

      selection_background = "#b2ceee";
      selection_foreground = "#080808";

      selection_background = "#33467c";
      selection_foreground = "#c0caf5";
      url_color = "#73daca";
      cursor = "#c0caf5";
      cursor_text_color = "#1a1b25";

      active_tab_background = "#7aa2f7";
      active_tab_foreground = "#16161e";
      inactive_tab_background = "#292e42";
      inactive_tab_foreground = "#545c7e";

      active_border_color = "#7aa2f7";
      inactive_border_color = "#292e42";

      color0 = "#15161e";
      color1 = "#c94448";
      color2 = "#9ece6a";
      color3 = "#e0af68";
      color4 = "#7aa2f7";
      color5 = "#bb9af7";
      color6 = "#7dcfff";
      color7 = "#a9b1d6";

      color8 = "#414868";
      color9 = "#f2201f";
      color10 = "#9ece6a";
      color11 = "#e0af68";
      color12 = "#7aa2f7";
      color13 = "#bb9af7";
      color14 = "#7dcfff";
      color15 = "#c0caf5";

      color16 = "#ff9e64";
      color17 = "#db4b4b";

      shell = "fish";
    };

    theme = "Catppuccin-Mocha";
  };
}
