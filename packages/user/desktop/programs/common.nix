{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # browsers
    google-chrome
    firefox
    tor-browser-bundle-bin

    # file managers
    ranger # shell
    gnome3.nautilus # gui
    mucommander

    # Unzippers
    unzip

    # viewers
    zathura # PDF
    feh # image viewer
    evince # Pdf viewer
    green-pdfviewer

    # meeting
    zoom-us

    # screenshots
    shutter

    # misc
    bat
    feh

    # Diff
    gnome3.meld

    # Video player
    vlc

    #terminals
    unstable.alacritty
    rxvt_unicode
  ];
}
