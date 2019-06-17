{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
  sound.enable = true;
  # hardware.pulseaudio.enable = true;
  hardware.pulseaudio = {
    enable = true;
    package = pkgs.pulseaudioFull;

    # Extra bluetooth packages
    extraModules = [ pkgs.pulseaudio-modules-bt ];
  };
  environment.systemPackages = with pkgs; [
    pavucontrol
  ];
}
