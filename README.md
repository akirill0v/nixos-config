# nixos-configuration

## Installation:

After install and rebooting

### Add channels

```
sudo nix-channel --add https://nixos.org/channels/nixos-unstable unstable
sudo nix-channel --add https://github.com/NixOS/nixos-hardware/archive/master.tar.gz nixos-hardware
sudo nix-channel --update
```

### Mount SSH keys drive

```
mkdir -p /media/secret
mount /dev/disk/by-label/PRIVATE /media/secret
```

### Clone configuration repos

```
nix-shell -p git vim
mv /etc/nixos /etc/nixos.install
git clone https://github.com/jonaswouters/nixos-configuration /etc/nixos
cp /etc/nixos.install/hardware-configuration.nix /etc/nixos/
ln -sr /etc/nixos/machines/$MACHINE/configuration.nix /etc/nixos/configuration.nix

ssh-agent bash -c 'ssh-add /media/secret/.ssh/id_rsa; git clone PATH_TO_PRIVATE_REPO /etc/nixos-private'

```

### Machine specific

[Lenovo Thinkpad X1 Carbon 2018](machines/jwx1carbon/README.md)

### Set user password

```
passwd jonaswouters
su - jonaswouters
```

### Copy over stuff

```
cp -R /media/secret/.aws ~/
cp -R /media/secret/.ssh ~/
cp -R /media/secret/.gnupg ~/
chmod 700 ~/.ssh
chmod -R 600 ~/.ssh/id_rsa*
```

### Make config editable for user

```
sudo chown -R jonaswouters /etc/nixos/
cd /etc/nixos/
```

### Fix configuration origin location

```
git remote set-url origin git@github.com:jonaswouters/nixos-configuration.git
```
