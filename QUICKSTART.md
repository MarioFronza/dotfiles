# Quickstart: fresh machine to configured

## 1. Boot the install media

Download the [Arch Linux ISO](https://archlinux.org/download/), write it
to a USB drive, boot from it with Secure Boot disabled.

## 2. Get on the network

Wired: nothing to do, DHCP just works.

Wifi:

```bash
iwctl
station wlan0 scan
station wlan0 connect <SSID>   # tab-complete after "connect "
```

## 3. Run archinstall

```bash
archinstall
```

| Section | Setting |
|---|---|
| Mirrors and repositories | Select regions > your country |
| Disk configuration | Partitioning > select disk > Use a best-effort default partition layout |
| Disk > File system | btrfs (default subvolumes, use compression) |
| Disk > Disk encryption | Encryption type: LUKS > set password > Partitions: select which one to encrypt (recommended, not required) |
| Bootloader | Limine |
| Hostname | whatever you want |
| Authentication > Root password | set one |
| Authentication > User account | add yourself, Superuser: yes |
| Profile | Type: Desktop > Sway |
| Applications > Audio | pipewire |
| Network configuration | copy ISO network config |
| Timezone | yours |

Reboot, log in as the user you created.

## 4. Enable SSH, finish setup from another machine

Doing the rest over SSH from a real terminal beats fighting the console
font forever.

On the new machine:

```bash
sudo pacman -S --needed openssh
sudo systemctl enable --now sshd
ip a   # note the IP
```

From another machine:

```bash
ssh <user>@<ip>
```

## 5. Bootstrap

See [`bootstrap/README.md`](bootstrap/README.md) — installs `git` +
`base-devel`. No clone yet: browse the repo on GitHub and type each
folder's README commands by hand, one at a time.

