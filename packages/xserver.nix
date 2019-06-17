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
  };

  environment.systemPackages = with pkgs; [
    arandr
    xorg.xhost
    xorg.xbacklight
    xbindkeys
    xbindkeys-config
  ];
}
