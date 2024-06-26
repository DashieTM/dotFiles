{ pkgs, config, ... }:
{
  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # Enable networking
  networking.networkmanager.enable = true;
  services.flatpak.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Zurich";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Configure keymap in X11
  services.xserver = {
    xkb.layout = "us";
    xkb.variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = true;
  services.printing.browsing = true;
  services.printing.drivers = [ pkgs.hplip ];
  services.printing.startWhenNeeded = true; # optional
  services.avahi = {
    enable = true;
    nssmdns4 = true;
    openFirewall = true;
  };

  # Enable sound with pipewire.
  sound.enable = true;
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  environment.variables = {
    XDG_CACHE_HOME = "$HOME/.cache";
    DIRENV_LOG_FORMAT = "";
  };

  nix.settings.trusted-users = [
    "dashie"
  ];

  # allows user change later on
  users.mutableUsers = true;
  users.users.dashie = {
    isNormalUser = true;
    description = "dashie";
    extraGroups = [ "networkmanager" "wheel" "gamemode" "docker" "vboxusers" ];
    packages = with pkgs; [
      home-manager
      xdg-desktop-portal-gtk
    ];
    # this password will only last for the first login
    # e.g. login, then change to whatever else, this also ensures no public hash is available
    password = "firstlogin";
  };

  system.stateVersion = "unstable";
  boot.initrd.availableKernelModules = [ "nvme" "xhci_pci" "ahci" "usbhid" "usb_storage" "sd_mod" ];

  fileSystems."/" =
    {
      device = "/dev/disk/by-label/ROOT";
      fsType = "btrfs";
      options = [
        "noatime"
        "nodiratime"
        "discard"
      ];
    };

  fileSystems."/boot" =
    {
      device = "/dev/disk/by-label/BOOT";
      fsType = "vfat";
      options = [ "rw" "fmask=0022" "dmask=0022" "noatime" ];
    };

  fileSystems."/home" =
    {
      device = "/dev/disk/by-label/HOME";
      fsType = "btrfs";
      options = [
        "noatime"
        "nodiratime"
        "discard"
      ];
    };

  swapDevices =
    [{ device = "/dev/disk/by-label/SWAP"; }];

  boot.kernelParams = [
    "resume=\"PARTLABEL=SWAP\""
  ] ++ config.programs.boot.boot_params;
}
