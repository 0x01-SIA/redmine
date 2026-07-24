# Third-Party Components

This inventory records vendored third-party plugins retained in the repository
during the migration cleanup. Compatibility has not been exhaustively tested
unless noted.

## Plugins

| Component | Classification | Source | Version / evidence | License | Reason retained | Compatibility |
| --- | --- | --- | --- | --- | --- | --- |
| `redmine_dashboard` | Required third-party dependency | https://github.com/jgraichen/redmine_dashboard | README identifies Redmine Dashboard 2; local plugin metadata and README retained | Apache License 2.0 in `plugins/redmine_dashboard/LICENSE` | Bundled functionality for issue dashboards; present as a complete plugin | Unverified |
| `redmine_drawio` | Required third-party dependency | https://github.com/mikitex70/redmine_drawio | `init.rb` declares version `1.5.1` | No local license file found in the vendored copy | Bundled Draw.io integration; retained because removal impact was not validated safely | Unverified |
| `redmine_leaflet_maps` | Optional third-party dependency | https://github.com/urbaxy/redmine_leaflet_maps | `init.rb` declares version `0.2` | No local license file found in the vendored copy | Retained pending a functional review of map macros and customer-independent use | Unverified |
| `redmine_wiki_extensions` | Required third-party dependency | http://www.r-labs.org/projects/r-labs/wiki/Wiki_Extensions_en | `init.rb` declares version `1.1.0` | GPL text retained in `plugins/redmine_wiki_extensions/GPL.txt` and plugin header | Bundled wiki enhancements retained to avoid breaking existing wiki behavior | Unverified |
| `redmine_oh_shell` | Original RedmineOH code | Local project component | `README.md` declares version `0.1.0` | Covered by repository licensing context and local project ownership decisions | Required for the RedmineOH application shell override | Verified present |

## Notes

- The repository now keeps only the project-owned `themes/redmine_oh` theme.
- Vendored third-party code was intentionally left unmodified during this cleanup.
- Components without a clear local license file should be reviewed before any company-owned redistribution or broader publication decisions.
