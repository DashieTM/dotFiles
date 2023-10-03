{ lib
, pkgs
, ...
}:
{

  home.packages = with pkgs; [
    rustdesk
    keepassxc
    nheko
    kdeconnect
    nextcloud-client
    xournalpp
  ];

}
