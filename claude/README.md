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

```bash
mkdir -p ~/.claude
cp CLAUDE.md RTK.md settings.json statusline-command.sh ~/.claude/
cp -r rules agents hooks themes ~/.claude/
cp -r skills/* ~/.claude/skills/
```

`settings.json` still says `"theme": "dark"` (the built-in one) — `themes/flexoki_dark.json` is copied in but not switched to automatically. Pick it with `/theme` inside Claude Code.
