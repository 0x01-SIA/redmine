# Upstream Redmine Base

## Upstream project

- Project URL: https://www.redmine.org/
- Source code URL: https://github.com/redmine/redmine

## Best available base identification

The strongest local evidence indicates that this repository is based on Redmine `6.1.0.devel`:

- `lib/redmine/version.rb` declares `MAJOR = 6`, `MINOR = 1`, `TINY = 0`, and `BRANCH = 'devel'`.
- `Gemfile` requires Ruby `>= 3.2.0` and `< 3.5.0`.
- `Gemfile.lock` records Ruby `3.3.8p144`.
- The repository contains standard upstream Redmine documentation files under `doc/`.

An exact upstream Redmine commit SHA could not be established confidently from the local repository alone, so it is not claimed here.

## Known local divergence

Local divergence includes at least:

- the custom `themes/redmine_oh` theme;
- the custom `plugins/redmine_oh_shell` layout override plugin;
- bundled third-party plugins under `plugins/`;
- bundled third-party themes under `themes/`;
- local development Docker configuration.

Recent repository history also shows local precompiled asset commits, runtime logs, and uploaded files, which were treated as repository hygiene issues rather than intended upstream divergence.

## RedmineOH-specific work

RedmineOH-specific implementation is primarily located in:

- `themes/redmine_oh`
- `plugins/redmine_oh_shell`
- project-specific documentation such as `docs/REDMINEOH_DESIGN.md`

## Upgrade policy

- Review upstream Redmine release notes before adopting any update.
- Re-check the `redmine_oh_shell` layout override on every upstream upgrade because it replaces the main Redmine layout.
- Keep Redmine core modifications minimal and isolated.
- Re-test bundled third-party plugins and themes during every Redmine, Rails, Ruby, and database upgrade cycle.

## Warning

The `redmine_oh_shell` plugin overrides the main Redmine layout and must be reviewed during upstream upgrades before the application is considered stable on a new Redmine base.
