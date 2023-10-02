{
  lib,
  self,
  ...
}: {
  home = {
    username = "dashie";
    homeDirectory = "/home/dashie";
    stateVersion = "23.11";
  };

  manual = {
    html.enable = false;
    json.enable = false;
    manpages.enable = false;
  };

  programs.home-manager.enable = true;
}
