# claude

[Claude Code](https://claude.com/claude-code) config: `CLAUDE.md` (global
instructions), agents, skills, hooks, rules, settings, statusline, theme.

Not tracked (machine/account-specific, never commit):
`.credentials.json`, `sessions/`, `projects/`, `history.jsonl`,
`shell-snapshots/`, `session-env/`, `cache/`, `backups/`, `downloads/`,
`file-history/`, `paste-cache/`, `settings.local.json`.

## Install (Arch)

```bash
yay -S claude-code
# or: npm install -g @anthropic-ai/claude-code
```

RTK (referenced by the Bash hook in `settings.json`) is optional:

```bash
cargo install rtk
```

## Copy

49 files (agents, skills with their own scripts) — too many to paste by
hand one at a time. Clone just to copy from, no script run:

```bash
git clone --depth 1 https://github.com/MarioFronza/dotfiles /tmp/dotfiles
mkdir -p ~/.claude/skills
cp /tmp/dotfiles/claude/CLAUDE.md /tmp/dotfiles/claude/RTK.md \
   /tmp/dotfiles/claude/settings.json /tmp/dotfiles/claude/statusline-command.sh ~/.claude/
cp -r /tmp/dotfiles/claude/rules /tmp/dotfiles/claude/agents \
      /tmp/dotfiles/claude/hooks /tmp/dotfiles/claude/themes ~/.claude/
cp -r /tmp/dotfiles/claude/skills/* ~/.claude/skills/
rm -rf /tmp/dotfiles
```

`settings.json` still says `"theme": "dark"` (the built-in one) — `themes/tokyo_night.json` is copied in but not switched to automatically. Pick it with `/theme` inside Claude Code.
