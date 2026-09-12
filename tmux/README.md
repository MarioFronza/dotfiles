# tmux

`tmux` is installed via [`../packages/`](../packages/README.md).

## Setup

[tpm](https://github.com/tmux-plugins/tpm) (plugin manager) isn't a
package — clone it:

```bash
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
```

## Copy

From the root of your clone of this repo:

```bash
mkdir -p ~/.config/tmux
cp tmux/tmux.conf ~/.config/tmux/tmux.conf
```

## Apply

Start (or reload) tmux, then install plugins from inside a session:

```
prefix + I
```

(prefix is `Ctrl-a`, set in `tmux.conf`). Plugins in use: `tpm`,
`vim-tmux-navigator`, `tmux-resurrect`, `tmux-continuum`.
