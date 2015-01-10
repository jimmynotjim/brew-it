# Changelog

Releases are be numbered in the semantic versioning format:

`<major>.<minor>.<patch>`

And constructed with these guidelines:

* Breaking backwards compatibility bumps the major
* New additions without breaking backwards compatibility bumps the minor
* Bug fixes and misc changes bump the patch

For more information on semantic versioning, please visit http://semver.org/.

## v0.3.0 - January 9, 2015

- Modularized tasks and checkers into individual functions for cleaner code and easier reuse
- Added option to install from existing `.brewrc`
- Don't overwrite existing `.brewrc` unless user begins loading formulas

## v0.2.0 - January 8, 2015

- Swapped `brew bundle` for bash command
- Added verification checker for formulas
- Added real instructions to docs

## v0.1.0

- Initial Release