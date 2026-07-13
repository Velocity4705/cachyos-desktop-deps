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

No manual edits to README.md — it's always regenerated from `packages.json`.
