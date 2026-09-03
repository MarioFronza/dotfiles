# claude

[Claude Code](https://claude.com/claude-code) config: `CLAUDE.md` (global
instructions), agents, skills, hooks, rules, settings, statusline, theme.

Not tracked (machine/account-specific, never commit):
`.credentials.json`, `sessions/`, `projects/`, `history.jsonl`,
`shell-snapshots/`, `session-env/`, `cache/`, `backups/`, `downloads/`,
`file-history/`, `paste-cache/`, `settings.local.json`.

`skills/omarchy` and `skills/diagnose-crash` also aren't here — they're
symlinks into `/usr/share/omarchy`, installed by Omarchy itself.

## Install (Arch)

```bash
yay -S claude-code
# or: npm install -g @anthropic-ai/claude-code
```

RTK (referenced by the Bash hook in `settings.json`) is optional:

```bash
cargo install rtk
```

## Link

```bash
mkdir -p ~/.claude
ln -sf "$(pwd)/CLAUDE.md" ~/.claude/CLAUDE.md
ln -sf "$(pwd)/RTK.md" ~/.claude/RTK.md
ln -sf "$(pwd)/settings.json" ~/.claude/settings.json
ln -sf "$(pwd)/statusline-command.sh" ~/.claude/statusline-command.sh
ln -sfn "$(pwd)/rules" ~/.claude/rules
ln -sfn "$(pwd)/agents" ~/.claude/agents
ln -sfn "$(pwd)/hooks" ~/.claude/hooks
ln -sfn "$(pwd)/themes" ~/.claude/themes

mkdir -p ~/.claude/skills
for d in "$(pwd)"/skills/*/; do
  ln -sfn "$d" ~/.claude/skills/"$(basename "$d")"
done
```
