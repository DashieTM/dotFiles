{
  xdg.configFile."ncspot/config.toml" = {
    text = ''
      notify = true
      shuffle = true
      cover_max_scale = 2
      audio_cache_size = 50000
      initial_screen = "library"
      library_tabs = ["playlists"]
      [theme]
      background = "#1a1b26"
      primary = "#c0caf5"
      secondary = "#1a1b26"
      title = "#e0af68"
      playing = "#7dcfff"
      playing_selected = "#73daca"
      playing_bg = "#1a1b26"
      highlight = "#73daca"
      highlight_bg = "#1a1b26"
      error = "#c0caf5"
      error_bg = "#f7768e"
      statusbar = "#24283b"
      statusbar_progress = "#73daca"
      statusbar_bg = "#7dcfff"

      cmdline_bg = "#24283b"
      search_match = "#bb9af7"

      [keybindings]
      "j" = "move left 1"
      "k" = "move down 1"
      "l" = "move up 1"
      ";" = "move right 1"

      [notification_format]
      title = "%artists"
      body = "%title"
    '';
  };
}
