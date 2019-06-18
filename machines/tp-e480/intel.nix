{ config, pkgs, ... }:
{
  nixpkgs.config.packageOverrides = pkgs: {
    vaapiIntel = pkgs.vaapiIntel.override { enableHybridCodec = true; };
  };
  hardware.opengl = {
    enable = true;
    extraPackages = with pkgs; [
      libva-utils
      vaapiIntel
      vaapiVdpau
      libvdpau-va-gl
      vaapi-intel-hybrid
      intel-media-driver # only available starting nixos-19.03 or the current nixos-unstable
    ];
  };

  services.xserver = {
    videoDrivers = [ "intel" ];
    screenSection = ''
      Option "TripleBuffer" "On"
    '';
  };
}
