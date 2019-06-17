{ config, pkgs, ... }:

{
  services.xserver = {
    libinput.enable = true;
    synaptics.enable = false;

    config = ''
      Section "InputClass"
        Identifier       "Enable libinput for TrackPoint"
        MatchIsTouchpad  "on"
	      MatchDevicePath "/dev/input/event*"
        Driver           "libinput"
	      Option "NaturalScrolling" "1"
      EndSection
    '';
  };
}
