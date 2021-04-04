# gasma-repository
This is my repository of .ebuilds file

## Installation
You have to copy the repository in the /var/db/repos directory:
```shell
sudo git clone https://github.com/MattiaG-afk/gasma-repository /var/db/repos/gasma
sudo echo "[gasma]\nlocation = /var/db/repos/gasma" >> /etc/portage/repos.conf/gasma.conf
```

At the moment if you want to update the ebuilds in the repository you have to delete and re-clone the repository:
```shell
sudo rm -rf /var/db/repos/gasma
sudo git clone https://github.com/MattiaG-afk/gasma-repository /var/db/repos/gasma
```

## Contacts
If you need an ebuild but you don't know how to do it you can contact me and I'll do it for you (of course I'll add it here)
