# RedmineOH

RedmineOH is an independent overhaul of Redmine with a custom RedmineOH theme and a companion `redmine_oh_shell` plugin that replaces the main application shell without modifying Redmine core.

The project is under active development and should be treated as a pre-release codebase. Local Docker setup is supported for development and evaluation. Direct production migration is not recommended without a dedicated deployment, security, and upgrade review.

## Project structure

- `themes/redmine_oh`: the in-progress RedmineOH visual theme.
- `plugins/redmine_oh_shell`: the RedmineOH shell override plugin that controls the main layout.
- `plugins/`: bundled plugin dependencies retained for compatibility review.

Design direction and UI constraints are documented in [docs/REDMINEOH_DESIGN.md](/Users/gustavs/Documents/GitHub/RedmineM89/docs/REDMINEOH_DESIGN.md).

## Technology stack

- Redmine application codebase derived from upstream Redmine
- Ruby 3.3.x
- Rails 8.0.4 as recorded in `Gemfile.lock`
- MariaDB 11.4 in local Docker development
- Docker Compose for local startup

Upstream status and divergence notes are documented in [UPSTREAM.md](/Users/gustavs/Documents/GitHub/RedmineM89/UPSTREAM.md). Third-party bundled components are tracked in [THIRD_PARTY.md](/Users/gustavs/Documents/GitHub/RedmineM89/THIRD_PARTY.md).

## Local development setup

This repository includes a Docker Compose setup for local development only.

1. Create a local environment file:

```bash
cp .env.example .env
```

2. Review the values in `.env` and adjust them for your machine if needed.

3. Start the local stack:

```bash
docker compose up --build
```

4. Open RedmineOH at [http://localhost:3000](http://localhost:3000).

5. Stop the stack when finished:

```bash
docker compose down
```

## Environment configuration

The tracked Docker and database configuration uses environment variables with development-safe defaults. The most important variables are:

- `RAILS_ENV`
- `DATABASE_HOST`
- `DATABASE_NAME`
- `DATABASE_TEST_NAME`
- `DATABASE_USER`
- `DATABASE_PASSWORD`
- `MARIADB_DATABASE`
- `MARIADB_USER`
- `MARIADB_PASSWORD`
- `MARIADB_ROOT_PASSWORD`
- `SECRET_KEY_BASE`

Safe example values are provided in [.env.example](/Users/gustavs/Documents/GitHub/RedmineM89/.env.example). Do not commit real secrets, customer data, `.env`, generated assets, runtime logs, or uploaded files.

`config/database.yml` is tracked and uses environment variables so local Docker startup remains straightforward without committing machine-specific credentials.

## Theme and shell plugin

The RedmineOH interface depends on two separate layers:

- `themes/redmine_oh` provides the project-specific styling.
- `plugins/redmine_oh_shell` overrides the main Redmine layout and must be reviewed whenever Redmine is upgraded.

Theme work should stay in the theme directory. Shell structure changes should stay in the plugin. Redmine core changes should remain rare, focused, and justified.

## Third-party components

Third-party plugins are vendored in this repository to preserve current functionality while RedmineOH remains under active development. Ownership, source, license status, and compatibility notes are documented in [THIRD_PARTY.md](/Users/gustavs/Documents/GitHub/RedmineM89/THIRD_PARTY.md).

These bundled components are not a claim of full compatibility or production readiness. Each retained dependency still needs ongoing review during future Redmine, Rails, Ruby, and MariaDB upgrades.

## Licensing

RedmineOH is derived from Redmine. Upstream Redmine code remains subject to the applicable GPLv2 licensing terms included in [COPYING](/Users/gustavs/Documents/GitHub/RedmineM89/COPYING). Third-party bundled components may carry additional licenses documented in their own directories and summarized in [THIRD_PARTY.md](/Users/gustavs/Documents/GitHub/RedmineM89/THIRD_PARTY.md).

## Documentation

- [docs/REDMINEOH_DESIGN.md](/Users/gustavs/Documents/GitHub/RedmineM89/docs/REDMINEOH_DESIGN.md)
- [UPSTREAM.md](/Users/gustavs/Documents/GitHub/RedmineM89/UPSTREAM.md)
- [THIRD_PARTY.md](/Users/gustavs/Documents/GitHub/RedmineM89/THIRD_PARTY.md)
- [CONTRIBUTING.md](/Users/gustavs/Documents/GitHub/RedmineM89/CONTRIBUTING.md)
- [SECURITY.md](/Users/gustavs/Documents/GitHub/RedmineM89/SECURITY.md)
