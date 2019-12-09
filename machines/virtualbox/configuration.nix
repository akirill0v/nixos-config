{ config, pkgs, ... }:

{
  imports =
    [
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
      ../../packages/user/devops.nix
      #../../packages/user/development.nix
      ../../packages/user/fonts.nix
      ../../packages/user/gnupg.nix
      ../../packages/user/ide/spacemacs.nix
    ];

  # Boot settings
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  # This value determines the NixOS release with which your
  # system is to be compatible, in order to avoid breaking
  # some software such as database servers. You should
  # change this only after NixOS release notes say you
  # should.
  system.stateVersion = "19.09";

  # Networking
  networking = {
    hostName = "virtualbox";
  };
}
