{}: {
  services.flatpak.remotes = {
    "flathub" = "https://dl.flathub.org/repo/flathub.flatpakrepo";
  };
  services.flatpak.packages = [ "flathub:app/com.github.tchx84.Flatseal//stable" ];
}

