{ config, pkgs, ... }:

{ environment.systemPackages = with pkgs; [
    unstable.docker-compose
    unstable.click
    unstable.kubectl
    kubectx
    unstable.kubernetes-helm
    ansible
    # helm
  ];
}
