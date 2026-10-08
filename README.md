# Dotfiles

Managed with chezmoi and Git. Source: `~/.local/share/chezmoi`.
Aliases must be loaded in your shell.

## Commands

Replace `FILE` with a path in your home directory.

| Action | Command | Alias |
| --- | --- | --- |
| Add | `chezmoi add FILE` | `dota FILE` |
| Edit and apply | `chezmoi edit --apply FILE` | `dote FILE` |
| Capture live edits | `chezmoi re-add FILE` | `dotr FILE` |
| Capture all managed edits | `chezmoi re-add` | `dotr` |
| Show differences | `chezmoi diff` | `dotd` |
| Show status | `chezmoi status` | `dots` |
| Preview apply | `chezmoi apply --dry-run --verbose` | `dotpreview` |
| Apply | `chezmoi apply` | `dotapply` |
| Unmanage; keep live file | `chezmoi forget FILE` | `dotf FILE` |
| Remove private attribute | `chezmoi chattr noprivate FILE` | `dot chattr noprivate FILE` |
| Git status | `chezmoi git -- status --short` | `dotgs` |
| Git diff | `chezmoi git -- diff` | `dotgd` |
| Stage | `chezmoi git -- add -A` | `dotstage` |
| Review staged changes | `chezmoi git -- diff --cached` | `dotgit diff --cached` |
| Commit | `chezmoi git -- commit -m "Message"` | `dotcommit "Message"` |
| Push | `chezmoi git -- push` | `dotpush` |
| Pull | `chezmoi git -- pull --ff-only` | `dotgit pull --ff-only` |

## Daily workflow

Capture live edits, review, then commit and push:

```sh
chezmoi re-add                         # dotr
chezmoi git -- diff                    # dotgd
chezmoi git -- add -A                  # dotstage
chezmoi git -- diff --cached           # dotgit diff --cached
chezmoi git -- commit -m "Update config" # dotcommit "Update config"
chezmoi git -- push                    # dotpush
```

- `re-add` skips templates and new files. Use `edit` for templates and `add` for new files.
- Capture wanted live edits before applying; apply can overwrite them.
- `diff` compares source with live files; Git diff compares source with Git history.
- `forget` can be undone by adding the path or its parent again.
- Optional exclusions go in `.chezmoiignore`, relative to your home directory.
- `private_` controls permissions, not encryption or repository visibility.

## Restore

```sh
chezmoi init REPO_URL
chezmoi diff
chezmoi apply --dry-run --verbose
chezmoi apply
```

Open a new shell to load aliases. For later updates, pull, review with `dotd`,
then apply with `dotapply`. Commit local source changes before pulling.
