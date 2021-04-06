# gasma
This is my repository of .ebuilds file

## Installation
You have to copy the repository in the /var/db/repos directory:
```shell
sudo echo "[DEFAULT]\nmain-repo = gentoo\n\n[gasma]\nlocation = /var/lib/overlays/gasma\nsync-type = git/nsync-uri = https://github.com/MattiaG-afk/gasma\nauto-sync = yes\nclone-depth = 1" >> /etc/portage/repos.conf/gasma.conf
```

## Contacts
If you need an ebuild but you don't know how to do it you can contact me and I'll do it for you (of course I'll add it here)
