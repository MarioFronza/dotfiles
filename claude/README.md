# claude

[Claude Code](https://claude.com/claude-code) config: `CLAUDE.md` (global
instructions), agents, skills, hooks, rules, settings, statusline, theme.

Not tracked (machine/account-specific, never commit):
`.credentials.json`, `sessions/`, `projects/`, `history.jsonl`,
`shell-snapshots/`, `session-env/`, `cache/`, `backups/`, `downloads/`,
`file-history/`, `paste-cache/`, `settings.local.json`.

`claude-code` and `rtk` (referenced by the Bash hook in `settings.json`,
optional) are installed via [`../packages/`](../packages/README.md).

## Copy

48 files (agents, skills with their own scripts) — too many to paste by
hand one at a time. From the root of your clone of this repo (the one
you used for `packages/install.sh`):

```bash
mkdir -p ~/.claude/skills
cp claude/CLAUDE.md claude/RTK.md claude/settings.json claude/statusline-command.sh ~/.claude/
cp -r claude/rules claude/agents claude/hooks claude/themes ~/.claude/
cp -r claude/skills/* ~/.claude/skills/
```

## Apply

`settings.json` still says `"theme": "dark"` (the built-in one) —
`themes/tokyo_night.json` is copied in but not switched to
automatically. Pick it with `/theme` inside Claude Code.
