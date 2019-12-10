{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
  # Enable the X11 windowing system.
  hardware.brightnessctl.enable = true;
  services.xserver = {
    enable = true;

    displayManager.slim = {
      enable = true;
      defaultUser = secrets.username;
      theme = pkgs.fetchurl {
        url = "https://github.com/edwtjo/nixos-black-theme/archive/v1.0.tar.gz";
        sha256 = "13bm7k3p6k7yq47nba08bn48cfv536k4ipnwwp1q1l2ydlp85r9d";
      };
    };

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;
  };

  services.dbus = {
    enable = true;
    packages = [ pkgs.gnome3.dconf ];
  };

  programs = {
    light.enable = true;
    nm-applet.enable = true;
    command-not-found.enable = true;
  };

  environment.systemPackages = with pkgs; [
    arandr
    xorg.xhost
    xorg.xbacklight
    xbindkeys
    xbindkeys-config
  ];
}
