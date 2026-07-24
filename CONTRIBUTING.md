# Contributing

## Scope

RedmineOH is a focused overhaul of Redmine. Contributions should improve the
project without turning this repository into a broad Redmine fork with casual
core edits.

## Where changes belong

- Theme changes belong in `themes/redmine_oh`.
- Application shell and layout-override changes belong in
  `plugins/redmine_oh_shell`.
- Bundled third-party plugins should not be modified casually. Prefer
  documenting issues and upstream sources instead.
- Redmine core changes should be rare, tightly scoped, and justified in the
  commit and pull request description.

## Commit expectations

- Keep commits focused and reviewable.
- Avoid mixing repository-hygiene, documentation, UI, and behavior changes when
  they can be separated clearly.
- Update documentation when behavior, setup, or project policy changes.

## Testing expectations

- Run the practical checks available for the change you make.
- At minimum, verify the affected files and configuration paths.
- For environment or startup changes, prefer `docker compose config` and local
  application startup checks where possible.

## Repository hygiene

Do not commit:

- secrets or real credentials;
- `.env` files;
- runtime logs;
- uploaded files;
- generated assets under `public/assets/` or `public/plugin_assets/`;
- `.bundle/config`;
- customer-derived screenshots, attachments, or operational data;
- editor junk, backup files, or OS metadata such as `.DS_Store`.

Use `script/check_repository_hygiene` before pushing when the change touches
repository structure or generated output.

## Third-party attribution

Preserve third-party attribution and license files. If a third-party component
is added, updated, or removed, update [THIRD_PARTY.md](THIRD_PARTY.md)
accordingly.
