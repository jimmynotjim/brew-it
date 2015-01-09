# Brew It

Brew It is an automated installer for [Homebrew][1] inspired by [Bash-It][2]


## Installation

1. Clone Brew It to you home directory

  ```
  git clone git@github.com:jimmynotjim/brew-it.git ~/.brew_it
  ```

2. Check out the available formulas in `/formulas` and make adjustments for your own needs

3. Run the installer

  ```
  ~/.brew_it/install.sh
  ```


## Usage

If Homebrew isn't already installed on your system, Brew It will ask if you'd like to install it, but it's a rhetorical question, you need Homebrew to use Brew It. From there it will give you the choice of installing all, some or none of the available packages. If you choose all, it will run through and add all of the included formulas to your `.brewrc`. If you choose some, it will ask you which of the formula types to include in your `.brewrc`. If you choose none it will exit the process.

The included formulas are broken up into their main types. Not every formula is included within each type and some are included but commented out to save you from searching for them. It's assumed your needs are not my needs, and you will edit the files within `/formulas` to fit your system. It's best to create a new branch with your edits, so that you don't lose them from pulling from the repo in the future. If you're unsure if you need a formula, you should most likely comment it out to avoid installing it.


## Notes

When running the installer Brew It will create a new `.brewrc` and backup your existing `.brewrc` as `.brewrc.bak` if one exists. If you need to keep an existing brewfile it's encouraged that you make a copy outside your home directory or rename it.


## License

Brew It is Copyright &copy; 2012-2015 James Wilson, released under the [MIT license][3]. This means you can re-create, edit or share Brew It as long as you maintain the same open licensing.


## Version

Latest version is 0.2.0 and may be unstable. Make sure to view [the changelog][4] before updating.


## Author

[James Wilson (@jimmynotjim)][5]

[1]: http://brew.sh/
[2]: https://github.com/revans/bash-it
[3]: https://github.com/jimmynotjim/brew-it/blob/master/LICENSE-MIT
[4]: https://github.com/jimmynotjim/brew-it/blob/master/CHANGELOG.md
[5]: http://github.com/jimmynotjim
