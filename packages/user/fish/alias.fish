alias tig "tig --show-signature"
alias vim nvim
alias vi nvim
alias nix-cleanup "sudo nix-env --delete-generations old && nix-collect-garbage -d"

# Docker
alias do "docker"
alias de "docker exec -it -w (pwd) -v (pwd):(pwd)"

# Docker-compose
alias dcc "docker-compose"
alias dcu "docker-compose up"
alias dce "docker-compose exec"
alias dcs "docker-compose stop"

# Kubernetes
alias k "kubectl"
alias kg "kubectl get"
alias kd "kubectl describe"

function delline
  sed -i "$argv[2]"d $argv[1] 
end
