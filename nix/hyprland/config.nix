{ config
, default
, ...
}:
let
  scripts = "${config.home.homeDirectory}/.config/scripts";
in
{
  wayland.windowManager.hyprland.extraConfig = ''
    #
    #fix the fucking portal
    exec-once=systemctl --user import-environment
    exec-once=dbus-update-activation-environment --all
    #
    #
    
    monitor=DP-3,2560x1440@165,-2560x0,1
    monitor=DP-1,3440x1440@180,0x0,1
    monitor=DP-2,1920x1200@60,3440x0,1
    monitor=DP-2,transform,1
    monitor=,highrr,auto,1
    
    workspace=DP-3,1 
    workspace=DP-1,2 
    workspace=DP-2,3
    
    
    input {
        kb_layout=diaeresis
        repeat_delay=200
        natural_scroll=false
        follow_mouse=1
        force_no_accel=true
    
        touchpad {
            natural_scroll=yes
    	      tap-to-click=yes
        }
    }
    
    general {
        sensitivity=1.0 # for mouse cursor
        gaps_in=3 3 3 3
        gaps_out=2 5 5 5
        border_size=3
        col.active_border=0xFFFF0000 0xFF00FF00 0xFF0000FF 45deg
        col.inactive_border=0x66333333
        apply_sens_to_raw=0 # whether to apply the sensitivity to raw input (e.g. used by games where you aim using your mouse)
    }
    
    decoration {
        rounding=4
    }
    
    animations {
        enabled=1
        animation=windowsMove,1,4,default
        animation=windows,1,7,default,popin 70%
        animation=border,1,10,default
        animation=fade,1,10,default
        animation=workspaces,1,6,default
    }
    
    dwindle {
        preserve_split=true
        pseudotile=0
        permanent_direction_override=false
    }
    
    gestures {
        workspace_swipe=yes
    }
    
    misc {
        vfr=true
        vrr = 1
        animate_manual_resizes=1
        enable_swallow=true
        disable_splash_rendering = true
        disable_hyprland_logo = true
        swallow_regex=^(.*)(kitty)(.*)$
        layers_hog_keyboard_focus=false
      }
    
    # window rules
    windowrule=tile,^(.*)(Spotify)(.*)$
    windowrule=float,^(.*)(OxiCalc)(.*)$
    windowrule=float,^(.*)(winecfg.exe)(.*)$
    windowrule=float,^(.*)(speed.exe)(.*)$
    windowrule=float,^(.*)(copyq)(.*)$
    windowrule=center,^(.*)(gnome)(.*)$
    windowrule=size 1200 800,^(org.gnome.NautilusPreviewer)$
    windowrule=center,^(.*)(swappy)(.*)$
    windowrule=float,title:^(.*)(Spirit)(.*)$
    
    # binds
    bind=SUPER,S,exec,grim -g "$(slurp)" - | wl-copy
    bind=SUPERSHIFTALT,S,exec, grim -g "$(slurp)" $HOME/gits/ost-5semester/Screenshots/$(date +'%Y_%m_%d_%I_%M_%S.png') && (date +'%Y_%m_%d_%I_%M_%S.png') | wl-copy
    bind=SUPERSHIFT,S,exec,grim -g "$(slurp)" - | swappy -f - 
    bind=SUPER,F,exec,firefox
    bind=SUPER,T,exec,kitty -1
    bind=SUPER,Q,killactive,
    bind=SUPERSHIFTALT,M,exit,
    bind=SUPER,E,exec,nautilus --new-window
    bind=SUPER,N,exec,neovide --novsync
    bind=SUPER,M,exec,oxidash --css $HOME/gits/oxidash/style.css
    bind=SUPER,V,togglefloating,
    bind=SUPER,B,fullscreen,
    bind=SUPER,R,exec,anyrun
    bind=SUPER,C,togglesplit
    bind=SUPER,G,exec,oxicalc
    bind=SUPERSHIFT,L,exec, playerctl -a pause & swaylock -c 000000 & systemctl suspend 
    bind=,XF86AudioMute,exec,pactl set-sink-mute @DEFAULT_SINK@ toggle
    bind=,XF86AudioLowerVolume,exec, ${scrips}/change-volume sink -5%
    bind=,XF86AudioRaiseVolume,exec, ${scripts}/change-volume sink +5%
    bind=,XF86AudioPlay,exec, playerctl play-pause
    bind=,XF86AudioNext,exec, playerctl next
    bind=,XF86AudioPrev,exec, playerctl previous
    bind=,XF86MonBrightnessDown,exec, ${scripts}/change-brightness brightness 10%-
    bind=,XF86MonBrightnessUp,exec, ${scripts}/change-brightness brightness +10%
    bind=SUPER,D,exec,oxishut --css $HOME/gits/OxiShut/style.css
    bind=SUPER,A,exec,copyq toggle
    bind=SUPERSHIFT,W,togglespecialworkspace
    bind=SUPER,W,movetoworkspace,special
    
    
    binde=SUPER,J,movefocus,l
    binde=SUPER,semicolon,movefocus,r
    binde=SUPER,L,movefocus,u
    binde=SUPER,K,movefocus,d
    
    binde=SUPER,U,resizeactive,-20 0
    binde=SUPER,P,resizeactive,20 0
    binde=SUPER,O,resizeactive,0 -20
    binde=SUPER,I,resizeactive,0 20
    
    bind=SUPER,left,movewindow,l
    bind=SUPER,right,movewindow,r
    bind=SUPER,up,movewindow,u
    bind=SUPER,down,movewindow,d
    
    bind=SUPER,1,workspace,1
    bind=SUPER,2,workspace,2
    bind=SUPER,3,workspace,3
    bind=SUPER,4,workspace,4
    bind=SUPER,5,workspace,5
    bind=SUPER,6,workspace,6
    bind=SUPER,7,workspace,7
    bind=SUPER,8,workspace,8
    bind=SUPER,9,workspace,9
    bind=SUPER,0,workspace,10
    
    bind=SUPERSHIFT,1,movetoworkspace,1
    bind=SUPERSHIFT,2,movetoworkspace,2
    bind=SUPERSHIFT,3,movetoworkspace,3
    bind=SUPERSHIFT,4,movetoworkspace,4
    bind=SUPERSHIFT,5,movetoworkspace,5
    bind=SUPERSHIFT,6,movetoworkspace,6
    bind=SUPERSHIFT,7,movetoworkspace,7
    bind=SUPERSHIFT,8,movetoworkspace,8
    bind=SUPERSHIFT,9,movetoworkspace,9
    bind=SUPERSHIFT,0,movetoworkspace,10
    
    bind=SUPERSHIFTALT,1,movetoworkspacesilent,1
    bind=SUPERSHIFTALT,2,movetoworkspacesilent,2
    bind=SUPERSHIFTALT,3,movetoworkspacesilent,3
    bind=SUPERSHIFTALT,4,movetoworkspacesilent,4
    bind=SUPERSHIFTALT,5,movetoworkspacesilent,5
    bind=SUPERSHIFTALT,6,movetoworkspacesilent,6
    bind=SUPERSHIFTALT,7,movetoworkspacesilent,7
    bind=SUPERSHIFTALT,8,movetoworkspacesilent,8
    bind=SUPERSHIFTALT,9,movetoworkspacesilent,9
    bind=SUPERSHIFTALT,0,movetoworkspacesilent,10
    
    bind=SUPERALT,j,layoutmsg,preselect l
    bind=SUPERALT,k,layoutmsg,preselect d
    bind=SUPERALT,l,layoutmsg,preselect u
    bind=SUPERALT,semicolon,layoutmsg,preselect r
    bind=SUPERALT,h,layoutmsg,preselect n
    
    bindm=SUPER,mouse:272,movewindow
    bindm=SUPER,mouse:273,resizewindow
    
    #binds for debug testing
    # bind=SUPERALT,J,pass,^(wlroots)$
    # bind=SUPERALT,left,pass,^(wlroots)$
    # bind=SUPERALT,right,pass,^(wlroots)$
    # bind=SUPERALT,up,pass,^(wlroots)$
    # bind=SUPERALT,down,pass,^(wlroots)$
    # bind=CTRLALT,P,pass,^(parcellite)$
    
    
    #autostart programs
    exec-once=hyprpaper
    exec-once=ironbar
    exec-once=firefox
    exec-once=streamdeck -n
    exec-once=copyq --start-server
    exec-once=/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1
    exec-once=nextcloud --background
    exec-once=oxinoti --css $HOME/gits/oxinoti/style.css
  '';
}
