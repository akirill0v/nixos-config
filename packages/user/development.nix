{ config, pkgs, ... }:

let
  secrets = (import ../../private/secrets.nix);
in
{

  home-manager.users.${secrets.username}.home.packages = with pkgs; [
    # Visual Studio Code
    unstable.vscode

    # Node
    unstable.nodejs-10_x

    # files
    filezilla

    # API
    unstable.postman
  ];
}
