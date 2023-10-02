{ pkgs
, config
, ...
}:
# media - control and enjoy audio/video
{
  home.packages = with pkgs; [
    # base audio
    pipewire
    wireplumber
    pipewire-pulse
    pipewire-alsa
    pipewire-jack
    # audio control
    pavucontrol
    playerctl
    # images
    imv
    # pdf
    zathura
    # spotify
    ncspot
  ];

  programs = {
    mpv = {
      enable = true;
      defaultProfiles = [ "gpu-hq" ];
      scripts = [ pkgs.mpvScripts.mpris ];
    };
    obs-studio.enable = true;
  };

  services = {
    playerctld.enable = true;
  };
}
