# RedmineOH Shell

Version: `0.1.0`

This plugin provides an isolated RedmineOH layout override for the application shell.
It restructures the main Redmine layout so the global navigation, search, account actions,
workspace title, project navigation, and full-width content render in the intended order.

Redmine core is not modified.

Because this plugin overrides the main layout, the override should be reviewed whenever
Redmine is upgraded.

Manual activation:

- The plugin is loaded automatically when present under `plugins/`
- The RedmineOH theme should remain selected

Production refresh commands:

```sh
docker compose exec app sh -lc 'RAILS_ENV=production bin/rails assets:precompile'
docker compose restart app
```

Manual pages to verify:

- Home
- My Page
- Projects
- Administration
- Project overview
- Issue list
- Issue detail
