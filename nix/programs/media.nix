{ pkgs
, config
, ...
}:
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
    # videos
    mpv
    # pdf
    zathura
    # spotify
    ncspot
    # video editing
    kdenlive
    # image creation
    inkscape
    gimp
    krita
    # recording
    obs-studio
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
