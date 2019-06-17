{ config, pkgs, ... }:

{
  services.xserver = {
    libinput.enable = true;
    synaptics.enable = false;

    config = ''
      Section "InputClass"
        Identifier       "Enable libinput for TrackPoint"
        MatchIsTouchpad  "on"
        Driver           "libinput"
        Option "NaturalScrolling" "true"
      EndSection
    '';
  };
}
