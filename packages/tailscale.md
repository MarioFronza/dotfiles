# Tailscale

`tailscale` is in [`pacman.txt`](pacman.txt), so `install.sh` puts it on the
machine — but the daemon ships disabled, the same way `iwd` and `bluetooth`
do. Nothing connects until you enable it.

## Enable the service

```bash
sudo systemctl enable --now tailscaled
```

`enable` is what makes it come back on every boot; `--now` also starts it
immediately so you don't need a separate `start`.

## Authenticate

```bash
sudo tailscale up
```

Prints a URL to open in a browser and bind the machine to the tailnet. Only
needed once per machine — the daemon keeps its state in
`/var/lib/tailscale/`, so later boots connect on their own.

## Verify

```bash
tailscale status
```

Lists every machine in the tailnet with its `100.x.y.z` address. Those
hostnames resolve directly, so `ssh homelab` works from anywhere without
port forwarding or knowing the LAN address.
