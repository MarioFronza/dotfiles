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
| Profile | leave empty |
| Applications > Audio | no audio server |
| Network configuration | copy ISO network config |
| Timezone | yours |

Leave the profile and audio sections alone on purpose. Every desktop
profile drags in a compositor, a launcher and a terminal of its own
choosing, and this repo installs its own set in step 7 — see
[`packages/pacman.txt`](packages/pacman.txt). Picking one only means
uninstalling the parts you don't want afterwards.

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
`base-devel`, the bare minimum to clone this repo.

## 6. Enable multilib

Off by default. Needed for `lib32-*` packages and `steam` (see
[`packages/README.md`](packages/README.md)) — 32-bit libs that Steam and
Proton/Wine games depend on even on a 64-bit system.

```bash
sudo sed -i '/^#\[multilib\]/,/^#Include = \/etc\/pacman.d\/mirrorlist/ s/^#//' /etc/pacman.conf
sudo pacman -Sy
```

## 7. Clone and install every package

One shot, everything the machine needs (pacman + AUR + GPU driver):

```bash
git clone https://github.com/MarioFronza/dotfiles.git
cd dotfiles/packages
./install.sh [amd|intel|nvidia]
```

## 8. Enable wifi and bluetooth

`iwd`, `systemd-networkd`, `systemd-resolved`, and `bluetooth` are
installed by now, but not enabled as services — you're still on
whatever wired/SSH connection you set up in step 4. See
[`packages/wifi-bluetooth.md`](packages/wifi-bluetooth.md).

From here on, every module's README skips its own package list — it's
already installed. Each README only covers copying its config files into
place (see [`bootstrap/README.md`](bootstrap/README.md) for the
suggested order).

