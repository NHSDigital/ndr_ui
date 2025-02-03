## [Unreleased]
* no unreleased changes *

## 5.0.1 / 2025-02-03
### Fixed
* fix cancel modal button
* re-introdce `btn-default` style
* fix `bootstrap_tab_nav_tag` helper method with required classes
* allow more padding at the end for `bootstrap_list_badge_and_link_to`
* fix offset class name in line with Bootstrap 5 upgrade
* fix `bootstrap_alert_tag` style with close button option

## 5.0.0 / 2025-01-24
### Changed
* Support Bootstrap to v5.3.3
* Drop support for Bootstrap 3/4
* include bootstrap-icons library
* replace panel helpers to card helpers

## 4.1.2 / 2025-01-24
### Fixed
* Bump bootstrap-datepicker to 1.7.1

## 4.1.1 / 2024-11-20
### Fixed
* Support Ruby 3.2 and 3.3 and Rails 7.1 and 7.2

## 4.1.0 / 2024-05-20
### Added
* Bump jQuery to v3.7.0

## 4.0.0 / 2024-05-20
### Added
* Support Ruby 3.2. Drop support for Ruby 2.7, Rails 6.0
* Display line breaks for readonly textarea fields
* Bump jQuery to v3.0.0

## 3.3.1 / 2022-12-01
### Fixed
* Support Ruby 3.1 and Rails 7.0
* Drop support for Ruby 2.6, Rails 5.2
* Replace Public Health England naming with NHS Digital

## 3.3.0 / 2022-03-28
### Added
* Added styling for NDRS navbars and footers

## 3.2.0 / 2021-05-10
### Fixed
* Don't mutate arguments when merging CSS options
* Support Ruby 2.7 and 3.0.

### Changed
* Remove dependency on unsupported sass gem

## 3.1.0 / 2019-12-04
### Added
* Add `new_link` bootstrap helper (#36)
* Support nested polymorphic resources for bootstrap link helpers

### Fixed
* Don't leak `skip_authorization` as an HTML attribute (#37)

## 3.0.0 / 2019-09-10
### Changed
* Changes to how the engine exposes assets, for use outside of manifests (#35)

## 2.3.0 / 2019-09-03
### Added
* enable `data-controller` options to bootstrap form helpers

## 2.2.0 / 2019-07-08
### Added
* Allow `edit_link` and friends to optionally `skip_authorization: true`, if the UI is handling this differently.

## 2.1.1 / 2019-05-16
### Fixed
* Ensure Rails 6.0.0rc1 is supported.

## 2.1.0 / 2019-04-26
### Added
* Bump bootstrap-sass in response to CVE-2016-10735 and CVE-2019-8331

## 2.0.2 / 2019-01-18
### Fixed
* Ensure that RubyGems doesn't re-write symlinked asset wrongly

## 2.0.1 / 2019-01-18
### Fixed
* Repacked gem without tests

## 2.0.0 / 2019-01-17
### Changed
* for input fields with `input-addons`, remove background and border when the form is read-only. (#24)
* `delete_link` now adds a `data-confirm` attribute by default (#25)
* `{details,edit,delete}_link` integrate with authorisation, if possible (#26)

### Added
* `form_with` can use `NdrUi::BootstrapBuilder` as builder, also added `bootstrap_form_with` helper method as shortcut (#32)
* Added `bootstrap_icon_spinner` helper methods
* Add `inline_controls_for` button toolbar helper (#27)

### Fixed
* Support Ruby 2.6. Ruby 2.4 / Rails 5.1 is now the minimum requirement.

## 1.12.2 / 2018-06-22
### Fixed
* Address issue with datepicker SCSS (#22)

## 1.12.1 / 2018-05-01
### Fixed
* Correct issue with inline errors

## 1.12.0 / 2018-04-27
### Added
* Add support for Rails 5.1 / 5.2
* Added `bootstrap_modal_{dialog,header,body,footer}_tag` helper methods
* Added readonly ``bootstrap_modal_box`` button option

### Fixed
* `inline_errors` shouldn't break with basic objects
* Add fix for inline errors issue
* try to fix some I18n issues
* fix tooltips tests that had previously been spuriously passing
* Ensure `assert_select` is being used correctly. Resolves #18.
* fix SASS precompilation when using datepicker
* labels should not contain the 'for' HTML attribute when readonly (#16)
* Fix to the label `tooltip: false`. Resolves #15
