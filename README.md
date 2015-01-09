# Brew It

Brew It is a package installer for Homebrew inspired by Bash-It

## Installation

Clone Brew It to you home directory

```
git clone git@github.com:jimmynotjim/brew-it.git ~/.brew_it
```

Check out the available formulas in `/formulas` and make adjustments for your own needs

Run the installer

```
~/.brew_it/install.sh
```


## Usage

If Homebrew isn't already installed on your system, it will do so first. From there it will give you the choice of installing all, some or none of the available packages. If you choose all, it will run through and add all of the included formulas to your `.brewrc`. If you choose some, it will ask you which of the formula types to include in your `.brewrc`. If you choose none it will exit the process.

The included formulas are broken up into their main type. Not every formula is included within each type and some are included but commented out to save you from searching for them. It's assumed your needs are not my needs, and you will edit the files within `/formulas` to fit your system. It's best to create a new branch with your edits, so that you don't lose them from pulling from the repo in the future. If you're unsure if you need a formula, you should most likely comment it out to avoid installing it.


## Notes

When running the installer Brew It will create a new `.brewrc` and backup your existing `.brewrc` as `.brewrc.bak` if one exists. If you need to keep an existing brewfile it's encouraged that you make a copy outside your home directory or rename it.
