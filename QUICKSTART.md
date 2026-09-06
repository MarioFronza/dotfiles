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
| Disk configuration | Partitioning > default layout > select disk |
| Disk > File system | btrfs (default subvolumes, use compression) |
| Disk > Disk encryption | LUKS, set a password (recommended, not required) |
| Hostname | whatever you want |
| Bootloader | Limine |
| Authentication > Root password | set one |
| Authentication > User account | add yourself, Superuser: yes |
| Applications > Audio | pipewire |
| Network configuration | copy ISO network config |
| Timezone | yours |

Reboot, log in as the user you created.

## 4. Fix the console font

The default TTY font is tiny. Before doing anything else:

```bash
sudo pacman -S --needed terminus-font
setfont ter-132b                        # bigger, right now
ls /usr/share/kbd/consolefonts/         # other sizes, if 132b is too much/little
```

Persist it:

```bash
echo "FONT=ter-132b" | sudo tee -a /etc/vconsole.conf
```

## 5. Enable SSH, finish setup from another machine

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

## 6. Clone and install

```bash
git clone git@github.com:MarioFronza/dotfiles.git
cd dotfiles
packages/install.sh [amd|intel|nvidia]
```

Then work through the README in each folder you need (see the main
[`README.md`](README.md) for the list) — every one of them is just a
handful of `cp` commands.
