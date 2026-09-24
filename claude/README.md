# claude

[Claude Code](https://claude.com/claude-code) config: `CLAUDE.md` (global
instructions), `rules/`, `agents/`, `skills/`, `hooks/`, `settings.json`,
`statusline-command.sh` and a Tokyo Night `themes/` entry.

The two hooks talk to [`../tmux/`](../tmux/README.md). `notify-ready.sh`
plays a sound and paints the window and session red when a run finishes
somewhere you are not looking; tmux repaints them when you switch to it.
`agent-state.sh` writes `working`/`idle` per pane under `/tmp`.

Not tracked (machine or account specific, never commit):
`.credentials.json`, `sessions/`, `projects/`, `history.jsonl`,
`shell-snapshots/`, `session-env/`, `cache/`, `backups/`, `downloads/`,
`file-history/`, `paste-cache/`, `settings.local.json`.

`claude-code` and `rtk` (the Bash hook in `settings.json`, optional) are
installed via [`../packages/`](../packages/README.md).

## Copy

48 files, so copy the trees rather than listing them:

```bash
mkdir -p ~/.claude/skills
cp claude/CLAUDE.md claude/RTK.md claude/settings.json claude/statusline-command.sh ~/.claude/
cp -r claude/rules claude/agents claude/hooks claude/themes ~/.claude/
cp -r claude/skills/* ~/.claude/skills/
```

## Apply

`settings.json` still says `"theme": "dark"`, the built-in one.
`themes/tokyo_night.json` is copied in but not selected automatically —
pick it with `/theme` inside Claude Code.
