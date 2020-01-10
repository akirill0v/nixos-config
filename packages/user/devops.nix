{ config, pkgs, ... }:

{ environment.systemPackages = with pkgs; [
    unstable.docker-compose
    unstable.click
    unstable.kubectl
    unstable.etcher
    kube3d
    kubectx
    unstable.kubernetes-helm
    ansible
  ];
}
