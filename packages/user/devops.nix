{ config, pkgs, ... }:

{ environment.systemPackages = with pkgs; [
    docker-compose
    click
    kubectl
    kubectx
    kubernetes-helm
  ];
}
