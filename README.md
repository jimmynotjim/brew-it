# Brew It

Brew It is an automated installer for [Homebrew][1] inspired by [Bash-It][2]


## Installation

1. Clone Brew It to you home directory

    ```
    git clone git@github.com:jimmynotjim/brew-it.git ~/.brew_it
    ```

1. Check out the available formulas in `/formulas` and make adjustments for your own needs

1. Run the installer

    ```
    ~/.brew_it/install.sh
    ```

1. Follow the instructions

1. Enjoy

## Usage

If Homebrew isn't already installed on your system, Brew It will ask if you would like to install it, but it's a rhetorical question, you need Homebrew to use Brew It. If it is installed Brew It will run `brew update` to get the latest packages.

From here Brew It will check for an existing `.brewrc` file in your home directory. If it finds one, you have the option of running the installer with it or replacing it with a new `.brewrc` file built by Brew It.

If you don't have an existing `.brewrc` or choose to build a new file, the installer will ask if you'd like to install all, some or none of the included formulas. Typically you want to choose `all`, but the other options are available to you if you need them.

After Brew It builds your `.brewrc` file it will give you the choice to continue the installation or exit and review the file. If you made a mistake or you want to be absolutely sure what you agreed to install, now's your chance to take a look.

Finally, Brew It will run the appropriate commands for each of the formula types and complete your installation.


## Notes

1. The included formulas are broken up into their main types. Not every formula is included within each type and some are included but commented out to save you from searching for them. It's assumed your needs are not my needs, and you will edit the files within `/formulas` to fit your system. It's best to create a new branch with your edits, so that you don't lose them from pulling from the repo in the future. If you're unsure if you need a formula, you should most likely comment it out to avoid installing it.

1. When running the installer Brew It will check for an existing `.brewrc` and back it up as `.brewrc.bak` if you choose to. If you need to keep an existing brewfile it's encouraged that you make a copy outside your home directory or rename it.


## License

Brew It is Copyright &copy; 2012-2015 James Wilson, released under the [MIT license][3]. This means you can re-create, edit or share Brew It as long as you maintain the same open licensing.


## Version

Latest version is 0.2.0 and may be unstable. Make sure to view [the changelog][4] before updating. If you find errors, please repot them to the [issues page].


## Author

[James Wilson (@jimmynotjim)][6]

[1]: http://brew.sh/
[2]: https://github.com/revans/bash-it
[3]: https://github.com/jimmynotjim/brew-it/blob/master/LICENSE-MIT
[4]: https://github.com/jimmynotjim/brew-it/blob/master/CHANGELOG.md
[5]: https://github.com/jimmynotjim/brew-it/issues
[6]: http://github.com/jimmynotjim
