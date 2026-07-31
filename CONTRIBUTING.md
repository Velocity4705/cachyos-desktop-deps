# Contributing

## Issues

Found an outdated package list or a missing DE? Open an issue with the DE name and the packages that need updating.

## Pull Requests

1. Run `./cachyos-de sync` to pull the latest from upstream before making changes.
2. If adding a new DE, add it to `packages.json` (or wait for `sync` to pick it up).
3. Run `./cachyos-de readme` to regenerate README.md.
4. Commit both `packages.json` and `README.md`.

## Structure

- `packages.json` — structured package lists (source of truth)
- `cachyos-de` — CLI tool for sync, search, diff, etc.
- `README.md` — auto-generated from packages.json
- `.github/workflows/` — CI/CD

No manual edits to README.md — it's always regenerated from `packages.json`.

### Package overrides

`sync` mirrors upstream `netinstall.yaml`. If a package upstream lists is broken or missing (e.g. removed from Arch/AUR), don't edit `packages` directly — `sync` will revert it. Instead add an `overrides` block to the DE entry:

```json
"QTile": {
  "upstream_name": "Qtile",
  "overrides": {
    "remove": ["ttf-font-awesome"],
    "add": ["otf-font-awesome"]
  },
  "packages": [ "..." ]
}
```

`sync` and `diff` apply these on top of upstream's list, so your fix survives daily runs.

## Automated maintenance

A scheduled GitHub Actions workflow runs `cachyos-de sync --yes` daily. It:

- Applies upstream package changes and commits them
- Refreshes the "Last verified" date
- Opens an issue if a DE is removed or added upstream

You can trigger it manually via **Actions → Daily Sync → Run workflow**.
