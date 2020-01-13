{ config, pkgs, ... }:
let
  secrets = (import ../../../../private/secrets.nix);
in
{
  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # browsers
    google-chrome
    firefox
    # tor-browser-bundle-bin

    # file managers
    ranger # shell
    gnome3.nautilus # gui
    mucommander

    # System
    gparted

    # Unzippers
    unzip

    # viewers
    zathura # PDF
    feh # image viewer
    evince # Pdf viewer
    green-pdfviewer

    # graphics
    unstable.krita
    unstable.blender
    unstable.gimp
    unstable.inkscape

    # meeting
    zoom-us

    # screenshots
    shutter

    # misc
    bat
    feh
    fd

    # Diff
    gnome3.meld

    # Video player
    vlc

    #terminals
    unstable.alacritty
    rxvt_unicode

    # backgrounds
    unstable.variety
  ];
}
