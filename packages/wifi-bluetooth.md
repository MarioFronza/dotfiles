# Wifi + Bluetooth (no NetworkManager)

`iwd` handles wifi, `systemd-networkd` handles wired + DHCP,
`systemd-resolved` handles DNS. `impala` and `bluetuith` are the TUIs on
top.

## Enable the services

```bash
sudo systemctl enable --now iwd
sudo systemctl enable --now systemd-networkd
sudo systemctl enable --now systemd-resolved
sudo ln -sf /run/systemd/resolve/stub-resolv.conf /etc/resolv.conf

sudo systemctl enable --now bluetooth
```

## Wired DHCP

`systemd-networkd` needs a `.network` file to know to DHCP the wired
interface. Find its name with `ip link`, then:

```bash
sudo tee /etc/systemd/network/20-wired.network <<'EOF'
[Match]
Name=en*

[Network]
DHCP=yes
EOF
sudo systemctl restart systemd-networkd
```

## Use

```bash
impala      # wifi: connect, scan, forget networks
bluetuith   # bluetooth: pair, connect, trust devices
```
