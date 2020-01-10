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
        # url = "https://github.com/edwtjo/nixos-black-theme/archive/v1.0.tar.gz";
        # sha256 = "13bm7k3p6k7yq47nba08bn48cfv536k4ipnwwp1q1l2ydlp85r9d";
        url = "https://github.com/akirill0v/evrone-dm-theme/archive/0.1.tar.gz";
        sha256 = "1gmc2rf9v2s1k1bw6b9vxmzbxdjrwnxl7ifpwyczq3pni06zy3h9";
      };
    };

    desktopManager.default = "none";
    desktopManager.xterm.enable = false;

    # xautolock = {
    #   enable = true;
    #   enableNotifier = true;
    #   locker = ''${config.security.wrapperDir}/physlock'';
    #   notifier =
    #     ''${pkgs.libnotify}/bin/notify-send "Locking in 10 seconds"'';
    # };
  };

  services.dbus = {
    enable = true;
    packages = [ pkgs.gnome3.dconf ];
  };

  # services.physlock = {
  #   allowAnyUser = true;
  #   enable = true;
  # };

  services.autorandr = {
    enable = true;
    defaultTarget = "default";
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
    mate.mate-polkit
  ];
}
