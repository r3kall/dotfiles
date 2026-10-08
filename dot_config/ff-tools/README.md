# ff-tools (Firefox utilities)

A small set of bash utilities for:
- resolving the default Firefox profile (`ff-profile-path`)
- pruning history (`ff-history-cleanup`)
- exporting bookmarks (`ff-bookmarks-export`)

## Config

Default config dir: `~/.config/ff-tools` (override with `FF_TOOLS_DIR`).

- `~/.config/ff-tools/sensitive_domains.txt` (optional)
- `~/.config/ff-tools/exports/` (bookmark exports)

## Install

You can keep the layout and add `bin/` to PATH, or copy scripts:

```bash
mkdir -p ~/.local/bin ~/.local/lib/ff-tools
cp -a bin/* ~/.local/bin/
cp -a lib/* ~/.local/lib/ff-tools/
```

If you copy to a different lib location, update the `source` line in each script accordingly.
