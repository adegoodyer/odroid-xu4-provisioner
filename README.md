# odroid-xu4-provisioner

A collection of installation scripts that automate the setup of an Odroid XU4 devce. Structured in a way that allows easy composition, increased code reuse and reduced code duplication.

## Mount disk instructions
- https://medium.com/@sh.tsang/partitioning-formatting-and-mounting-a-hard-drive-in-linux-ubuntu-18-04-324b7634d1e0
- https://forum.odroid.com/viewtopic.php?t=28283

### Update system
```
sudo apt update
```

### Search for correct drive and information
```
sudo fdisk -l
sudo fdisk /dev/sda (m, p, n, p, 1, enter, enter -use these commands to create new partition)
```
Press w to write table to disk and exit..
```
sudo mkfs.ext4 /dev/sda

sudo mkdir -p /media/sda
sudo mount /dev/sda /media/sda
sudo mount | grep sda # use to check drive mounted
```

### Copy UUID of drive
> Copying the UUID like this makes sure the folder appears on the desktop which makes finding films easier if not using Kodi UI
```
sudo blkid

sudo nano /etc/fstab
UUID="734089dd-d31c-41c1-af4a-fa7d11f0b5f2"        /media/hdd1       ext4    auto,user,rw        0       0
```

### Reboot
```
sudo reboot
```