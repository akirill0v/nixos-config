{ config, pkgs, ... }:

{ imports = [
      ../base-workstation.nix
      # virtualization
      ../../packages/docker.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/dconf.nix
      ../../packages/user/desktop/i3.nix
      ../../packages/user/desktop/gtk.nix

      # Packages
      ../../packages/user/common.nix
      #../../packages/user/development.nix
      ../../packages/user/fonts.nix
      ../../packages/user/gnupg.nix
      ../../packages/user/ide/spacemacs.nix
  ];

  boot.loader = {
    systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
  };

  networking = {
    hostName = "alex-tp-e480";
    firewall.enable = false;
    networkmanager.enable = true;
  };

    fileSystems."/work" =
      { device = "/dev/disk/by-uuid/6b2e1d0a-00ef-449a-b18b-c9e0bd545619";
        fsType = "f2fs";
      };

  system.stateVersion = "19.03"; # Did you read the comment?
}
