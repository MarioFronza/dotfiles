# tmux

## Install (Arch)

```bash
sudo pacman -S tmux
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Copy

```bash
mkdir -p ~/.config/tmux
cp tmux.conf ~/.config/tmux/tmux.conf
```

## Apply

Start (or reload) tmux, then install plugins from inside a session:

```
prefix + I
```

(prefix is `Ctrl-a`, set in `tmux.conf`). Plugins in use: `tpm`,
`vim-tmux-navigator`, `tmux-resurrect`, `tmux-continuum`.
