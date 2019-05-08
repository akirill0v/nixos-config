{ config, lib, pkgs, ... }:

let
  secrets = (import ./private/secrets.nix);
in
{
  imports = [
    # Home manager import
    "${builtins.fetchTarball https://github.com/rycee/home-manager/archive/release-19.03.tar.gz}/nixos"
  ];

  # Users
  users.users.${secrets.username} = {
    isNormalUser = true;
    uid = 1000;
    createHome = true;
    description = "${secrets.fullName}";
    extraGroups = [
      "audio"
      "docker"
      "networkmanager"
      "video"
      "wheel"
      "libvirtd"
    ];
    openssh.authorizedKeys.keys = [
      (builtins.readFile (builtins.fetchurl {
        url = "https://github.com/${secrets.github}.keys";
        sha256 = "00i09ixakizgvyhi7qrmd36dparyjxk0pqrmv3ikgbqqyiym11y8";
      }))
    ];
  };
  
  # Home manager
  home-manager.users.${secrets.username} = {
    programs.ssh = {
      enable = true;
      forwardAgent = true;
    };
    
    services.gpg-agent = {
      enable = true;
      enableSshSupport = true;
    };
  };
}
