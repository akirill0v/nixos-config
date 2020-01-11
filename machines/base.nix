{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      /etc/nixos/hardware-configuration.nix
      ../modules/module-list.nix
      ../users.nix
      ../packages/common.nix
      ../packages/audio.nix
      ../packages/bluetooth.nix
      ../packages/user/development.nix
    ];

    nixpkgs.config = {
       # Alow unfree packages
      allowUnfree = true;

      # Create an alias for the unstable channel
      packageOverrides = pkgs: {
        unstable = import <nixos-unstable> {
          config = config.nixpkgs.config;
        };
      };
    };

    # Enable OpenSSH
    services.openssh = {
      enable = true;
      passwordAuthentication = false;
    };

    # Timezone
    time.timeZone = "Europe/Saratov";
    services.ntp.enable = true;

    # Set channel to unstable
    # system.autoUpgrade.channel = "https://nixos.org/channels/nixos-stable/";
}
