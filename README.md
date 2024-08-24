```
██████   █████  ███████ ██   ██ ███    ██ ██ ██   ██
██   ██ ██   ██ ██      ██   ██ ████   ██ ██  ██ ██
██   ██ ███████ ███████ ███████ ██ ██  ██ ██   ███
██   ██ ██   ██      ██ ██   ██ ██  ██ ██ ██  ██ ██
██████  ██   ██ ███████ ██   ██ ██   ████ ██ ██   ██
```

A very opinionated (technically only for me) configuration that allows easy adding and removing of systems alongside custom configurations for each system.

# Usage

This flake is intended to be used as an input to your own NixOS configuration:

```nix
dashNix = {
  url = "github:DashieTM/DashNix";
  inputs = {
    # ensure these are here to update the packages on your own
    nixpkgs.follows = "nixpkgs";
    stable.follows = "stable";
  };
};
```

You can then configure your systems in your flake outputs with a provided library command:

```nix
nixosConfigurations = (inputs.dashNix.dashNixLib.build_systems [
  "system1"
  "system2"
  "system3"
] ./.);
```

In order for your configuration to work, you are required to at least provide a single config file with a further config file being optional for custom configuration.

|- flake.nix\
|- flake.lock\
|- system1/\
|---- system1.nix (required)\
|---- configuration.nix (optional)\
|- system2/\
|---- system2.nix (required)\
|---- configuration.nix (optional)\
|- system3/\
|---- system3.nix (required)\
|---- configuration.nix (optional)

Here is a minimal required configuration (the TODOs mention a required change):
```nix
{
  # variables for system
  conf = {
    # TODO change this to your monitor and your pc name
    # should be something like DP-1
    monitor = "YOURMONITOR";
    username = "YOURNAME";
    # the name of your system
    hostname = "YOURNAME";
    # TODO only needed when you use intel -> amd is default
    # cpu = "intel";
  };
  # modules
  mods = {
    sops.enable = false;
    nextcloud.enable = false;
    hyprland.monitor = [
      # default
      # TODO change this to your resolution
      "DP-1,1920x1080@144,0x0,1"
      # all others
      ",highrr,auto,1"
    ];
    # or amd, whatever you have
    nvidia.enable = true;
    kde_connect.enable = true;
    # TODO change this to your main resolution
    # -> this will be your login manager
    greetd = { resolution = "3440x1440@180"; };
  };
}
```

# Modules

This configuration features several modules that can be used as preconfigured "recipies".
These modules attempt to combine the home-manager and nixos packages/options to one single configuration file for each new system.
For package lists, please check the individual modules, as the lists can be long.

- base packages : A list of system packages to be installed by default
- home packages : A list of home packages to be installed by default
- media packages : A list of media packages to be installed by default
- coding packages : A list of coding packages to be installed by default
- acpid : Enables the acpid daemon
- bluetooth : Configures/enables bluetooth and installs tools for bluetooth
- drives : A drive configuration module
- flatpak : Installs and enables declarative flatpak
- gnome_services : Gnome services for minimal enviroments -> Window managers etc
- gpu : GPU settings (AMD)
- greetd : Enables and configures the greetd/regreet login manager with Hyprland
- kde_connect : Enables KDE connect and opens its ports
- layout : Modules to configure keyboard layout system wide
- piper : Installs and enables piper alongside its daemon
- printing : Enables and configures printing services
- virtualbox : Enables and configures virtualbox
- xone : Installs the xone driver
- starship : Configures the starship prompt
- keepassxc : Configures keepassxc
- gaming : Configures gaming related features (launchers, gamemode)
- stylix : Configures system themes, can also be applied to dashvim if used.
- git : Git key and config module
- nextcloud : Handles synchronization via nextcloud cmd. (requires config.sops.secrets.nextcloud)
- firefox: Enables and configures firefox (extensions and settings)
- Hyprland: Installs and configures Hyprland with various additional packages
- yazi: Installs yazi and sets custom keybinds
- teams: For the poor souls that have to use this....
- sops: Enables sops-nix
- fish: Enables and configures fish shell
- kitty: Enables and configures kitty terminal
