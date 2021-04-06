# gasma
This is my repository of .ebuilds file

## Installation
Create /etc/portage/repos.conf/gasma.conf file and add the following lines
```shell
[DEFAULT]
main-repo = gentoo

[gasma]
location = /var/lib/overlays/gasma
sync-type = git
sync-uri = https://github.com/MattiaG-afk/gasma
auto-sync = yes
clone-depth = 1
```

Now you have to run:
```shell
sudo emerge --sync gasma
```

## Contacts
If you need an ebuild but you don't know how to do it you can contact me and I'll do it for you (of course I'll add it here)
