{ config, pkgs, ... }:

let
  secrets = (import ../private/secrets.nix);
in
{
    virtualisation.virtualbox.host.enable = true;
}
