{ config, pkgs, ... }:

{
  # Channels
  #nix.nixPath = lib.mkDefault (lib.mkBefore [
  #  "nixpkgs=https://nixos.org/channels/nixos-18.09"
  #  "nixos-hardware=https://github.com/NixOS/nixos-hardware/archive/master.tar.gz"
  #]);
  imports = [
      <nixos-hardware/lenovo/thinkpad/t480s>
      ../base-workstation.nix
      # virtualization
      ../../packages/docker.nix

      # Xserver
      ../../packages/xserver.nix
      ../../packages/user/desktop/dconf.nix
      ../../packages/user/desktop/i3.nix
      ../../packages/user/desktop/gtk.nix
      ./trackpad.nix

      # Packages
      ../../packages/user/common.nix
      ../../packages/user/devops.nix
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

  powerManagement.powertop.enable = true;
  system.stateVersion = "19.03"; # Did you read the comment?
}
