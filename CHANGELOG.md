# Changelog

## [0.5.0] - 2026-05-23

This release modernizes the project for current Elixir (1.15+) and refreshes
the bundled country data from upstream.

### Added

- Additional fields on returned `Countriex.Country` values, carried over from
  the refreshed upstream JSON: `:g7_member`, `:g20_member`, `:un_member`,
  `:iso_long_name`, `:iso_short_name_lower_case`, `:postal_code_format`,
  `:start_of_week`, `:distance_unit`, `:vehicle_registration_code`. The
  pre-existing struct fields are unchanged.

### BREAKING CHANGES

- Minimum required Elixir is now `~> 1.15` (was `~> 1.3`).
- `Countriex.Geo` fields `:latitude_dec` and `:longitude_dec`
  have been removed. Upstream stopped shipping them. Use `:latitude` and
  `:longitude` instead — they carry the same decimal-degree value.

## [0.4.1] - 2017

- See git history.
